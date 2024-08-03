from customList import List


class Toppings:
    fillings = List
    foodSize = 0

    def __init__(self, initial):
        self.fillings = List(initial)
        self.foodSize = 0

    def offer(self, food):
        self.fillings.request(food)
        self.foodSize = self.foodSize + 1

    def getFoodSize(self):
        return self.foodSize

    def __getitem__(self, item):
        if self.fillings.search(item):
            location = self.fillings.indexOf(item)
            return self.fillings.array[location]
        else:
            print("Item not found!")

    def poll(self):
        if self.fillings.isEmpty():
            return
        else:
            backup = self.fillings.serve()
            self.foodSize = self.foodSize - 1
            return backup

    def remove(self, item):
        checker = self.fillings.remove(item)
        if checker == item:
            self.foodSize = self.foodSize - 1
            return checker
        else:
            print("Item not found!")

    def change(self, food_old, food_new):
        return self.fillings.replace(food_old, food_new)

    def getList(self):
        return self.fillings

    def find(self, item):
        return self.fillings.indexOf(item)

    def eraseAll(self):
        while self.fillings.clear():
            self.foodSize = self.foodSize - 1
        if self.fillings.isEmpty():
            print("The list became empty.")

    def display(self):
        self.fillings.display()

