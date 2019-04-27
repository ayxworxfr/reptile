class Book:
    def __init__(self, url_source = None, name = None,  id = None, author = None, url = None):
        self.name = name
        self.id = id
        self.author = author
        self.url = url
        self.url_source = url_source