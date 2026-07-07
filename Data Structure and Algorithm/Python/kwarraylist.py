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
        theStat = False
        if (self.size == 0):
            return "Empty list! Cannot delete any item"
        for i in range(self.size):
            if (self.theList[i] == item):
                theStat = True
                for j in range(i, self.size - 1):
                    self.theList[j] = self.theList[j + 1]
                self.theList[self.size - 1] = None
                self.size = self.size - 1
                break
        if (theStat == False):
            return "Item not found in the list"
        else:
            return "Item removed successfully"