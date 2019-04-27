#coding:utf-8

import re
import os
import sys
import requests
from bs4 import BeautifulSoup
from urllib import request
import ssl
import threading
import time

# url = 'http://www.biqiuge.com/book/4772/'
# url = 'https://www.qu.la/book/1/'
url = 'http://www.biqiuge.com/book/1/'
url = 'http://www.biqiuge.com/book/'   #多线程
Headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36'}


def getHtmlCode(url):
    page = request.urlopen(url)
    html = page.read()
    htmlTree = BeautifulSoup(html,'html.parser')
    return htmlTree
    #return htmlTree.prettify()
def getKeyContent(url):
    htmlTree = getHtmlCode(url)

def parserCaption(url):
    page = requests.get(url, headers=Headers)
    page.encoding = page.apparent_encoding
    html = page.text
    name_re = "<h2>(.*?)</h2>"
    storyName = re.findall(name_re, html)[0]
    print(re.findall(name_re, html))

    print('小说名:',storyName)
    aList_re = "href.*?\"/.*?/.*?/(.*?).html\">"
    aList = re.findall(aList_re, html)

    aDealList = []
    for line in aList:
        if line not in aDealList:    #去重
            aDealList.append(line)
    aDealList.sort()    #排序
    urlList = []
    for line in aDealList:
        line = url + str(line) + '.html'
        urlList.append(line)
    # print(urlList)
    return (storyName,urlList)
def parserChapter(url):
    page = requests.get(url, headers=Headers)
    page.encoding=page.apparent_encoding
    html = page.text
    title_re = re.compile('<h1>(.*?)</h1>')
    content_re = re.compile('<div id="content" class="showtxt">(.*?)</div>')

    title = re.findall(title_re, html)[0]
    content = re.findall(content_re, html)[0]

    # print("title: ", title)
    # print("content: ", content)
    page.close()
    return (title,content)

def main(url):
    (storyName,urlList) = parserCaption(url)
    flag = True
    # cmd = 'del ' + storyName
    # os.system(cmd)
    # cmd = 'cls'
    count = 1
    for url_alone in urlList:
        lv = count / len(urlList) * 100
        message = storyName + u'进度为:   '
        print('%-9s:    %0.2f%%'%(message,lv))
        f = open('../../data/' + storyName,'a+',encoding = 'utf-8')
        (title,content) = parserChapter(url_alone)
        tmp = title + '\n' + content
        f.write(tmp)
        f.close()
        count = count + 1

exitFlag = False

class myThread(threading.Thread):
    def __init__(self,threadID,name,url):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.name = name
        self.url = url
    def run(self):
        print('开始线程:' + self.name)
        main(self.url)
        print("退出线程:" + self.name)
# cmd = 'del /q /s *.txt'
# os.system(cmd)
start = 340
space = 500

for i in range(start,space):
    url_tmp = url + str(i) + '/'
    print(url_tmp)
    tmp = 'Thread-' + str(i)
    threadName = myThread(i,tmp, url_tmp)
    threadName.start()
    break
    # threadName.join()
    # break
# for i in range(1,space):
#     threadName = myThread(i,tmp, url_tmp)
#     threadName.start()
#     threadName.join()
print("exit")