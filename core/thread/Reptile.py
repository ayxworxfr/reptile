import re
import time
# import PyMysql
import time
import sys
import requests
from bs4 import BeautifulSoup
from urllib import request
import ssl
import pymysql
from core.thread.Book import Book


class Reptile:
    CONNECTCHECK = 10          # 网络重连次数
    Headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36'}

    def __init__(self, source = 'biqiuge', url_root = 'http://www.biqiuge.com/book/'):
        self.source = source                            # 下载源
        self.url_root = url_root                        # 下载根地址


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
            f = open('../../data2/' + storyName + '.txt','a+',encoding = 'utf-8')
            (title, content) = self.parserChapter(url_alone)
            tmp = title + '\n' + content
            f.write(tmp)
            f.close()
            count = count + 1

    # 通过一本小说的url找到对应的所有章节url和章节名称
    def saveToMysql(self, book):
        connectCheck = 0
        while (True):
            try:
                book_name, urlList = self.parserCaption(book.url_source)
                break
            except IndexError as e:
                print("%s 无法找到相应的小说" % book.url_source)
                connectCheck += 1
                if(connectCheck > self.CONNECTCHECK):
                    return
        book.name = book_name
        book.id = self.findBookId(book,'save')

        self.insertChapters(book, urlList)



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
            try:
                title = re.findall(title_re, html)[0]
            except IndexError as e:
                print(e)
                print(html)
                # print("%s 该标题未找到\n" % url)
                raise Exception
            finally:
                page.close()
                return title
        elif(action == 'content'):
            try:
                content = re.findall(content_re, html)[0]
            except IndexError as e:
                print("%s 该文本未找到\n" % url)
                raise Exception
            finally:
                page.close()
                return content


        try:
            title = re.findall(title_re, html)[0]
            content = re.findall(content_re, html)[0]
        except IndexError as e:
            print("该标题或文本未找到\n")
            raise Exception
        finally:
            page.close()
            return title, content


    # 查询书的id，没有返回-1，只有一个则直接返回id，若有多个且action=delete则直接返回第一个id，并且删除其他数据
    # 没有且action=save则直接插入数据返回对应id
    def findBookId(self, book, action = None):
        # 打开数据库连接
        db = pymysql.connect(host='localhost', user='root', passwd='123456', db='book')

        # 使用 cursor() 方法创建一个游标对象 cursor
        cursor = db.cursor()

        # 使用 execute()  方法执行 SQL 查询
        # cursor.execute("SELECT VERSION()")
        selectBook = "select id from books where name=%s;"
        insertBook = "insert into books(name, url, chapterlist_url, url_source, create_time, update_time) values (%s,%s,%s,%s,%s,%s);"
        deleteBook = "delete books where id != %d and id in (select id from books where name=%s);"
        cursor.execute(selectBook, book.name)
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
            time_str = time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()));
            cursor.execute(insertBook, (book.name,book.url_source,book.url_source, book.url_source, time_str, time_str))
            db.commit()
            result = cursor.execute(selectBook, book.name)
            result = cursor.fetchall()
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
        deleteChapter = "delete from book_chapter where book_id=%s and chapter_id = %s;"
        saveChapter = "insert into book_chapter(book_id, chapter_id, title, url, url_source, create_time, update_time) values(%s,%s,%s,%s,%s,%s,%s);"
        updateChapter = "UPDATE book_chapter AS bc inner join (SELECT * FROM book_chapter WHERE book_id={} AND chapter_id = '{}' ORDER BY id  LIMIT 0,999999999) bc2 on bc.id = bc2.id SET bc.title = '{}', bc.url = '{}', bc.url_source = '{}', bc.update_time = '{}';"
        # updateChapter = "UPDATE book_chapter AS bc inner join (SELECT * FROM book_chapter WHERE book_id=%s AND chapter_id = %s ORDER BY id  LIMIT 0,999999999) bc2 on bc.id = bc2.id SET bc.title = %s, bc.url = %s, bc.url_source = %s;"

        count = 1
        for url_alone in urlList:
            if (count % 50 == 0):
                db.commit()

            lv = count / len(urlList) * 100
            message = book.name + u'进度为:   '
            print('%-9s    %0.2f%%\n' % (message, lv))

            connectCheck = 0
            while(True):
                try:
                    title = self.parserChapter(url_alone, 'title')      # 只爬取title
                    break
                except Exception as e:
                    print("%s: 标题或文本未找到(%s)\n" % (book.name, url_alone))
                    # raise Exception
                    if(connectCheck > self.CONNECTCHECK):
                        break
                finally:
                    connectCheck += 1

            try:
                chapterNum_re = '第(.*?)章'
                chapterNum = re.findall(chapterNum_re, title)[0]    # 章节数
                chapter_re = '第.*?章\s+(.*)'
                chapter = re.findall(chapter_re, title)[0].strip()  # 章节名称
            except IndexError as e:
                print('%s: 匹配章节或章节名称失败(%s)' % (book.name, url_alone))
                continue
                # return

            # 保存部分
            result = cursor.execute(selectChapter, (book.id[0], chapterNum))
            if (cursor.rowcount == 0):
                time_str = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()));
                cursor.execute(saveChapter, (book.id, chapterNum, chapter, url_alone, url_alone, time_str, time_str))
            elif(cursor.rowcount >= 1 and action == "Skip"):
                print("该章节已经存在，直接跳过\n")
            elif(cursor.rowcount >= 1 and action == "OverWrite"):
                print("该章节已经存在，直接更新\n")
                time_str = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()));
                # cursor.execute(updateChapter, (chapter, url_alone, url_alone, book.id, chapterNum))
                updateChapter = updateChapter.format(book.id[0], chapterNum, chapter, url_alone, url_alone, time_str)
                cursor.execute(updateChapter)

            db.commit()
            count = count + 1
            time.sleep(0.1)         # 休眠0.1秒防止被监控

    exitFlag = False
