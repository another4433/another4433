import random as r

class TheHashing: 
    def __init__(self, size, capacity):
        self.size = size
        self.capacity = capacity
        self.table = [None] * capacity

    def reallocate(self):
        self.capacity *= 2
        temp = self.table
        self.table = [None] * self.capacity
        for i in range(len(temp)):
            self.table[i] = temp[i]
        temp = None

    def insert(self, item):
        if self.size == self.capacity-1:
            self.reallocate()
        index = r.randint(0, self.capacity - 1)  
        while self.table[index] is not None:
            index = r.randint(0, self.capacity - 1)
        self.table[index] = item
        self.size += 1

    def search(self, item):
        for i in range(self.capacity):
            if self.table[i] == item:
                return i
        return -1

    def delete(self, item):
        temp = None
        for i in range(self.capacity):
            if self.table[i] == item:
                temp = self.table[i]
                self.table[i] = None
                self.size -= 1
                return temp
        return temp

    def get_size(self):
        return self.size

    def get_capacity(self):
        return self.capacity

    def get(self, index):
        if index < 0 or index >= self.capacity:
            return None
        return self.table[index]

    def print_table(self):
        for i in range(self.capacity):
            print(f"Index {i}: {self.table[i]}")