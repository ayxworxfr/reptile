import re
import time
# import PyMysql
import os
import sys
import requests
from bs4 import BeautifulSoup
from urllib import request
import ssl
import pymysql
from core.thread.Book import Book


class Reptile:
    Headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36'}

    def __init__(self, source = 'biqiuge', url_root = 'http://www.biqiuge.com/book/'):
        self.source = source                            # 下载源
        self.url_root = url_root                        # 下载根地址

    def getHtmlCode(self, url):
        # page = request.urlopen(url)
        # html = page.read()
        # htmlTree = BeautifulSoup(html, 'html.parser')
        # return htmlTree
        try:
            page = request.urlopen(url)
            html = page.read()
            htmlTree = BeautifulSoup(html, 'html.parser')
            return htmlTree
            # return htmlTree.prettify()
        except request.URLError as e:
            print(e.reason)
        finally:
            return None

    # 获取该小说名称和对应的所有章节url
    def parserCaption(self, url):
        page = requests.get(url, headers=self.Headers)
        page.encoding = page.apparent_encoding
        html = page.text
        name_re = "<h2>(.*?)</h2>"
        storyName = re.findall(name_re, html)[0]

        print('小说名:', storyName)
        aList_re = "href.*?\"/.*?/.*?/(.*?).html\">"
        aList = re.findall(aList_re, html)

        aDealList = []
        for line in aList:
            if line not in aDealList:  # 去重
                aDealList.append(line)
        aDealList.sort()  # 排序
        urlList = []
        for line in aDealList:
            line = url + str(line) + '.html'
            urlList.append(line)
        # print(urlList)
        return (storyName, urlList)

    # 通过url爬取标题或文本(含html标签)
    def parserChapter(self, url, action = 'all'):
        page = requests.get(url, headers=self.Headers)
        page.encoding = page.apparent_encoding
        html = page.text
        title_re = re.compile('<h1>(.*?)</h1>')
        content_re = re.compile('<div id="content" class="showtxt">(.*?)</div>')
        if(action == 'title'):
            title = re.findall(title_re, html)[0]
            return title
        elif(action == 'content'):
            content = re.findall(content_re, html)[0]
            return content

        title = re.findall(title_re, html)[0]
        content = re.findall(content_re, html)[0]

        page.close()
        return title, content

    def start(self, url):
        (storyName, urlList) = self.parserCaption(url)
        flag = True
        # cmd = 'del ' + storyName
        # os.system(cmd)
        # cmd = 'cls'
        count = 1
        for url_alone in urlList:
            lv = count / len(urlList) * 100
            message = storyName + u'进度为:   '
            print('%-9s    %0.2f%%\n' % (message, lv))
            f = open('../../data/' + storyName + '.txt','a+',encoding = 'utf-8')
            (title, content) = self.parserChapter(url_alone)
            tmp = title + '\n' + content
            f.write(tmp)
            f.close()
            count = count + 1

    # 通过一本小说的url找到对应的所有章节url和章节名称
    def saveToMysql(self, book):
        book_name, urlList = self.parserCaption(book.url_source)
        book.name = book_name
        book.id = self.findBookId(book,'save')

        self.insertChapters(book, urlList)

    # 查询书的id，没有返回-1，只有一个则直接返回id，若有多个且action=delete则直接返回第一个id，并且删除其他数据
    # 没有且action=save则直接插入数据返回对应id
    def findBookId(self, book, action = None):
        # 打开数据库连接
        db = pymysql.connect(host='localhost', user='root', passwd='123456', db='book')

        # 使用 cursor() 方法创建一个游标对象 cursor
        cursor = db.cursor()

        # 使用 execute()  方法执行 SQL 查询
        # cursor.execute("SELECT VERSION()")
        selectName = "select id from books where name=%s;"
        insertName = "insert into books(name, url, url_source) values (%s,%s,%s);"
        deleteBook = "delete books where id != %d and id in (select id from books where name=%s);"
        cursor.execute(selectName, book.name)
        result = cursor.fetchall()
        if(cursor.rowcount == 1):
            db.close()
            return result[0]
        elif(action == 'delete' and cursor.rowcount > 1):
            id = result[0]
            cursor.execute(deleteBook, (id, book.name))
            db.commit()
            db.close()
            return id
        elif(action == 'save'):
            cursor.execute(insertName, (book.name,book.url_source, book.url_source))
            result = cursor.execute(selectName, book.name)
            db.commit()
            db.close()
            return result[0]


    def insertChapters(self, book, urlList, action = "OverWrite"):
        # 打开数据库连接
        db = pymysql.connect(host='localhost', user='root', passwd='123456', db='book')

        # 使用 cursor() 方法创建一个游标对象 cursor
        cursor = db.cursor()

        # 使用 execute()  方法执行 SQL 查询
        # cursor.execute("SELECT VERSION()")
        selectChapter = "select id from book_chapter where book_id=%s and chapter_id = %s;"
        saveChapter = "insert into book_chapter(book_id, chapter_id, title, url, url_source) values(%s,%s,%s,%s,%s);"
        updateChapter = "update book_chapter set title = %s, url = %s, url_source = %s where id in (select id from book_chapter where book_id=%s and chapter_id = %s);"

        count = 1
        for url_alone in urlList:
            if (count % 50 == 0):
                db.commit()

            lv = count / len(urlList) * 100
            message = book.name + u'进度为:   '
            print('%-9s    %0.2f%%\n' % (message, lv))
            title = self.parserChapter(url_alone, 'title')      # 只爬取title
            chapterNum_re = '第(.*?)章'
            chapterNum = re.findall(chapterNum_re, title)[0]    # 章节数
            chapter_re = '第.*?章\s+(.*)'
            chapter = re.findall(chapter_re, title)[0].strip()  # 章节名称

            # 保存部分
            result = cursor.execute(selectChapter, (book.id[0], chapterNum))
            if (cursor.rowcount == 0):
                cursor.execute(saveChapter, (book.id, chapterNum, chapter, url_alone, url_alone))
            elif(cursor.rowcount >= 1 and action == "Skip"):
                print("该章节已经存在，直接跳过\n")
            elif(cursor.rowcount >= 1 and action == "OverWrite"):
                print("该章节已经存在，直接更新\n")
                # cursor.execute(updateChapter, (chapter, url_alone, url_alone, book.id, chapterNum))
                updateChapter = "update book_chapter set title = '{}', url = '{}', url_source = '{}' where id in (select id from book_chapter where book_id={} and chapter_id = '{}');".format(chapter, url_alone, url_alone, book.id[0], chapterNum)
                cursor.execute(updateChapter)

            db.commit()

            count = count + 1

    exitFlag = False
