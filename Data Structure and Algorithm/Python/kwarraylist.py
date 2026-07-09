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
        if (self.isEmpty()):
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
        
    def getSize(self):
        return self.size
    
    def get(self, index):
        if (index < 0 or index >= self.size):
            return "Index out of bounds"
        return self.theList[index]
    
    def search(self, item):
        for i in range(self.size):
            if (self.theList[i] == item):
                return i
        return -1
    
    def sort(self):
        for i in range(self.size):
            for j in range(0, self.size-i-1):
                if (self.theList[j] > self.theList[j+1]):
                    self.theList[j], self.theList[j+1] = self.theList[j+1], self.theList[j]

    def set(self, index, item):
        if (index < 0 or index >= self.size):
            return "Index out of bounds"
        self.theList[index] = item

    def replace(self, oldItem, newItem):
        index = self.search(oldItem)
        if (index == -1):
            return "Item not found in the list"
        self.theList[index] = newItem
        return "Item replaced successfully"
    
    def indexOf(self, item):
        return self.search(item)
    
    def printList(self):
        for i in range(self.size):
            print(self.theList[i], end=" ")
        print()

    def clear(self):
        self.theList = [None] * self.capacity
        self.size = 0

    def isEmpty(self):
        return self.size == 0
    
    def getName(self):
        return self.name