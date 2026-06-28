class KWArrayList: 
    name = ""
    theList = []
    size = 0
    capacity = 100

    def __init__(self, name):
        self.theList = [None] * self.capacity
        self.name = name

    def reallocate(self):
        self.capacity = self.capacity*2

    def add(self, item):
        if (self.size == self.capacity):
            self.reallocate()
        self.theList[self.size] = item
        self.size = self.size + 1

    def remove(self, item):
        if (self.size == 0):
            return "Empty list! Cannot delete any item"