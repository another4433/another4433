class ArrayList:
    capacity = 100
    size = 0
    array = [None] * capacity

    def __init__(self, initial):
        if initial <= 0:
            self.capacity = 100
        else:
            self.capacity = initial
        self.size = 0
        self.array = [None] * self.capacity

    def Capacity(self):
        return self.capacity

    def Size(self):
        return self.size

    def List(self):
        return self.array

    def range(self, index):
        return 0 <= index < self.Size()

    def empty_status(self):
        return self.Size() == 0

    def full_status(self):
        return self.Size() == self.Capacity()

    def reallocate(self):
        self.capacity = self.capacity * 2
        new_array = [None] * self.capacity
        for i in range(0, self.Capacity()):
            new_array[i] = self.array[i]
        self.array = new_array
        return self.Capacity()

    def get(self, index):
        if self.range(index):
            return self.List()[index]

    def index(self, item):
        for i in range(0, self.Size()):
            if self.List()[i] == item:
                return i
        return -1

    def search(self, item):
        if not (self.index(item) == -1):
            return True
        else:
            return False

    def addFirst(self, item):
        if self.full_status():
            self.reallocate()
        for i in range(self.Size(), 1):
            self.List()[i] = self.List()[i-1]
        self.List()[0] = item
        self.size = self.size + 1

    def addLast(self, item):
        if self.full_status():
            self.reallocate()
        self.List()[self.Size()] = item
        self.size = self.size + 1

    def add(self, item, location):
        if self.range(location):
            if self.full_status():
                self.reallocate()
            for i in range(self.Size(), location):
                self.List()[i] = self.List()[i-1]
            self.List()[location] = item
            self.size = self.size + 1
            return True
        return False

    def deleteFirst(self):
        if self.empty_status():
            return None
        backup = self.List()[0]
        for i in range(1, self.Size()):
            self.List()[i-1] = self.List()[i]
        self.size = self.size - 1
        return backup

    def deleteLast(self):
        if self.empty_status():
            return None
        self.size = self.size - 1
        return self.List()[self.Size()]

    def delete(self, item):
        if self.search(item):
            location = self.index(item)
            if self.Size() == 1 or location == self.Size()-1:
                return False
            backup = self.List()[location]
            for i in range(location + 1, self.Size()):
                self.List()[i-1] = self.List()[i]
            self.size = self.size - 1
            return backup
        return self.search(item)

    def set(self, location, item):
        if self.range(location):
            backup = self.List()[location]
            self.List()[location] = item
            return backup
        return None

    def replace(self, old, new):
        return not (self.set(self.index(old), new) is None)

    def clean(self):
        count = 0
        for i in range(0, self.index(None)-1 or self.Capacity()-1):
            for j in range(i+1, self.index(None) or self.Capacity()):
                if self.get(i) == self.get(j):
                    self.delete(self.get(j))
                    count = count + 1
        return count

    def sorted(self):
        for i in range(0, self.Size()-1):
            for j in range(i+1, self.Size()):
                if self.get(i) > self.get(j):
                    return False
        return True

    def sort(self):
        count = 0
        for i in range(0, self.Size()-1):
            for j in range(i+1, self.Size()):
                if self.get(i) > self.get(j):
                    temp = self.get(i)
                    self.replace(self.get(i), self.get(j))
                    self.replace(self.get(j), temp)
                    count = count + 1
        return count

    def display(self):
        print(f"\nList = {self.List()}\n")
