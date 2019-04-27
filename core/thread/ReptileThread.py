import threading
from core.thread.Book import Book
from core.thread.Reptile import Reptile
# from core.thread import Reptile


class ReptileThread(threading.Thread):
    def __init__(self, threadID, name, source, url, action = "SaveToTxt"):
        threading.Thread.__init__(self)
        self.threadID = threadID
        self.name = name
        self.source = source
        self.url = url
        self.action = action

    def run(self):
        # reptile = Reptile(self.source, self.url)
        reptile = Reptile()
        print('开始线程:' + self.name)
        if(self.action == "SaveToTxt"):
            reptile.start(self.url)
        elif(self.action == "SaveToMysql"):
            book = Book(self.url)
            reptile.saveToMysql(book)

        print("退出线程:" + self.name)

