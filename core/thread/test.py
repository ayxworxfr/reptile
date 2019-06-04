from core.thread.ReptileThread import ReptileThread

if __name__ == '__main__':
    start = 340
    space = 500
    source = 'biqiuge'
    url_root = 'http://www.biqiuge.com/book/'
    thread_list = []
    for i in range(start, space):
        url_tmp = url_root + str(i) + '/'
        print(url_tmp)
        tmp = 'Thread-' + str(i)
        # SaveToMysql or SaveToTxt
        threadName = ReptileThread(i, tmp, 'biqiuge', url_tmp, action="SaveToMysql")
        thread_list.append(threadName)
        threadName.start()
        break
    for thread in thread_list:
        thread.join()

    print("exit")