class Hashing:
    capacity = 10
    array = [0] * capacity

    def __init__(self, initial):
        if initial <= 0:
            self.capacity = 10
        else:
            self.capacity = initial

    def Capacity(self):
        return self.capacity

    def List(self):
        return self.array

    def range(self, index):
        return 0 <= index < self.Capacity()

    def reallocate(self):
        self.capacity = self.capacity * 2
        new_array = [0] * self.Capacity()
        for index in range(0, len(self.List())):
            if not (self.List()[index] == 0):
                location = self.List()[index] % len(self.List())
                while not (new_array[location] == 0):
                    location = (location + 1) % len(self.List())
                if new_array[location] == 0:
                    new_array[location] = self.List()[index]
        self.array = new_array

    def search(self, item):
        location = self.List()[item] % self.Capacity()
        while not (self.List()[location] == item):
            location = (location + 1) % self.Capacity()
        return location

    def insert(self, item):
        count = 0
        location = self.List()[item] % self.Capacity()
        while not (self.List()[location] == 0):
            count = count + 1
            location = (location + 1) % self.Capacity()
            if count == self.Capacity():
                print("Item not added to the list.")
                return False
        self.List()[location] = item
        return True

    def get(self, location):
        if self.range(location) and location % self.Capacity() == location:
            return self.List()[location]

    def delete(self, item):
        location = self.search(item)
        backup = self.List()[location]
        if backup == item:
            self.List()[location] = 0
            return backup
