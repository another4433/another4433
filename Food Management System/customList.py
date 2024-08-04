class List:
    constant = 100
    capacity = constant
    size = 0
    array = [None] * capacity

    def __init__(self, initial):
        if initial <= 0:
            self.capacity = self.constant
        else:
            self.capacity = initial
        self.size = 0
        self.array = [None]*self.capacity

    def reallocate(self):
        double = 2*self.capacity
        backup = [None]*double
        for item in range(0, len(self.array)):
            backup[item] = self.array[item]
        self.array = backup
        return double

    def Capacity(self):
        return self.capacity

    def Size(self):
        return self.size

    def isEmpty(self):
        return self.size == 0

    def isFull(self):
        return self.size == self.capacity

    def request(self, item):
        if self.isFull():
            self.reallocate()
        self.array[self.Size()] = item
        self.size = self.size + 1
        return self.array[self.Size()-1]

    def serve(self):
        if self.isEmpty():
            return
        else:
            backup = self.array[self.Size()-1]
            self.size = self.size - 1
            return backup

    def search(self, item):
        return self.indexOf(item)

    def isRange(self, index):
        return 0 <= index < self.size

    def indexOf(self, item):
        for index in range(0, len(self.array)):
            if self.array[index] == item:
                return index
        return -1

    def remove(self, item):
        if self.search(item):
            location = self.indexOf(item)
            backup = self.array[location]
            for index in range(location+1, self.Size()):
                self.array[index-1] = self.array[index]
            self.size = self.size - 1
            return backup
        else:
            print("Item not found!")

    def set(self, index, item_new):
        if self.isRange(index):
            backup = self.array[index]
            self.array[index] = item_new
            return backup
        else:
            print("Index not in range of the list.")

    def replace(self, item_old, item_new):
        if self.search(item_old):
            location = self.indexOf(item_old)
            return self.set(location, item_new)
        else:
            print("Old item not found! \nNo change in the list.")

    def __getitem__(self, index):
        if self.isRange(index):
            return self.array[index]

    def clear(self):
        while not (self.isEmpty()):
            self.size = self.size - 1
        if self.isEmpty():
            print(f"The list is empty, so the size is {self.size}")

    def display(self):
        print("Items in the list are as follows: ")
        for item in range(0, len(self.array)):
            print(self.array[item])
