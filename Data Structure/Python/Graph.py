class Graph:
    def __init__(self):
        self.capacity = 10
        self.array = [0][0] * self.capacity

    def Capacity(self):
        return self.capacity

    def List(self):
        return self.array

    def range(self, index):
        return 0 <= index < self.Capacity()

    def connect(self, row, column):
        if self.range(row) and self.range(column):
            self.List()[row][column] = 1
            return True
        return False

    def disconnect(self, row, column):
        if self.range(row) and self.range(column):
            self.List()[row][column] = 0
            return True
        return False

    def display(self):
        print(f"\nGraph = {self.List()}\n")
        print(f"Capacity: {self.Capacity()}\n")
