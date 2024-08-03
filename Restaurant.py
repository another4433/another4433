from Food import Food
from customList import List


class Restaurant(Food):
    pizza, pasta, burger, shawarma, orders = List
    pizza_count, pasta_count, burger_count, shawarma_count, orders_count = 0, 0, 0, 0, 0

    def __init__(self, name, quantity):
        super().__init__(name, quantity)
        self.pizza, self.pasta, self.burger, self.shawarma, self.orders = List(quantity)

    def setName(self, name):
        self.name = name

    def getName(self):
        return self.name

    def getType(self):
        return self.type

    def getQuantity(self):
        return self.quantity

    def isRange(self, index):
        return 0 <= index < self.orders.Size() or 0 <= index < self.getQuantity()

    def addPizza(self, item, quantity):
        if self.isRange(quantity):
            if self.orders_count == self.getQuantity():
                print("Pizza count already reached to the limit. \nWould you like to increase the limit? \nYes or No.")
                answer = input("Answer: ")
                if answer == "Yes":
                    self.pizza.reallocate()
                    size = self.orders.reallocate()
                    self.setQuantity(size)
                else:
                    print("Cannot add more Pizza.")
                    return False
            count = 0
            while count < quantity:
                self.pizza.request(item)
                self.pizza_count = self.pizza_count + 1
                self.orders.request(item)
                self.orders_count = self.orders_count + 1
                count = count + 1
            return True
        return False

    def addPasta(self, item, quantity):
        if self.isRange(quantity):
            if self.orders_count == self.getQuantity():
                print("Pasta count already reached to the limit. \nWould you like to increase the limit? \nYes or No.")
                answer = input("Answer: ")
                if answer == "Yes":
                    self.pasta.reallocate()
                    size = self.orders.reallocate()
                    self.setQuantity(size)
                else:
                    print("Cannot add more pasta.")
                    return False
            count = 0
            while count < quantity:
                self.pasta.request(item)
                self.pasta_count = self.pasta_count + 1
                self.orders.request(item)
                self.orders_count = self.orders_count + 1
                count = count + 1
            return True
        return False

    def addBurger(self, item, quantity):
        if self.isRange(quantity):
            if self.orders_count == self.getQuantity():
                print("Burger count already reached to the limit. \nWould you like to increase the limit? \nYes or No.")
                answer = input("Answer: ")
                if answer == "Yes":
                    self.burger.reallocate()
                    size = self.orders.reallocate()
                    self.setQuantity(size)
                else:
                    print("Cannot add more burger.")
                    return False
            count = 0
            while count < quantity:
                self.burger.request(item)
                self.burger_count = self.burger_count + 1
                self.orders.request(item)
                self.orders_count = self.orders_count + 1
                count = count + 1
            return True
        return False

    def addShawarma(self, item, quantity):
        if self.isRange(quantity):
            if self.orders_count == self.getQuantity():
                print(
                    "Shawarma count already reached to the limit. \nWould you like to increase the limit? \nYes or No.")
                answer = input("Answer: ")
                if answer == "Yes":
                    self.shawarma.reallocate()
                    size = self.orders.reallocate()
                    self.setQuantity(size)
                else:
                    print("Cannot add more shawarma.")
                    return False
            count = 0
            while count < quantity:
                self.shawarma.request(item)
                self.shawarma_count = self.shawarma_count + 1
                self.orders.request(item)
                self.orders_count = self.orders_count + 1
                count = count + 1
            return True
        return False

    def removePizza(self, item, quantity):
        count = 0
        if self.isRange(quantity):
            for counter in range(0, quantity):
                if self.orders.search(item) and self.pizza.search(item):
                    if self.orders.remove(item) == self.pizza.remove(item):
                        count = count + 1
                        self.orders_count = self.orders_count - 1
                        self.pizza_count = self.pizza_count - 1
            return count == quantity - 1 or count == quantity
        return False

    def removePasta(self, item, quantity):
        count = 0
        if self.isRange(quantity):
            for counter in range(0, quantity):
                if self.orders.search(item):
                    if self.orders.remove(item) == self.pasta.remove(item):
                        count = count + 1
                        self.orders_count = self.orders_count - 1
                        self.pasta_count = self.pasta_count - 1
            return count == quantity - 1 or count == quantity
        return False

    def removeBurger(self, item, quantity):
        count = 0
        if self.isRange(quantity):
            for counter in range(0, quantity):
                if self.orders.search(item) and self.orders.search(item):
                    if self.orders.remove(item) == self.burger.remove(item):
                        count = count + 1
                        self.orders_count = self.orders_count - 1
                        self.burger_count = self.burger_count - 1
            return count == quantity - 1 or count == quantity
        return False

    def removeShawarma(self, item, quantity):
        count = 0
        if self.isRange(quantity):
            for counter in range(0, quantity):
                if self.orders.search(item) and self.orders.search(item):
                    if self.orders.remove(item) == self.shawarma.remove(item):
                        count = count + 1
                        self.orders_count = self.orders_count - 1
                        self.shawarma_count = self.shawarma_count - 1
            return count == quantity - 1 or count == quantity
        return False

    def requestFood(self, item):
        if self.orders_count == self.getQuantity():
            print("Food quantity limit reached. \nWould you like to increase the quantity? \nYes or No.")
            answer = input("Answer: ")
            if answer == "Yes":
                size = self.orders.reallocate()
                self.setQuantity(size)
            else:
                print("Cannot add more food.")
                return
        self.orders.request(item)
        self.orders_count = self.orders_count + 1

    def serveFood(self):
        serving = self.orders.serve()
        if not (serving is None):
            self.orders_count = self.orders_count - 1
        return serving

    def changeFood(self, old, new):
        return self.orders.replace(old, new)

    def changePizza(self, old, new):
        return self.pizza.replace(old, new)

    def changePasta(self, old, new):
        return self.pasta.replace(old, new)

    def changeBurger(self, old, new):
        return self.burger.replace(old, new)

    def changeShawarma(self, old, new):
        return self.shawarma.replace(old, new)

    def __getitem__(self, index):
        return self.orders.__getitem__(index)

    def getOrder(self, index):
        return self.__getitem__(index)

    def getPizza(self, index):
        return self.pizza.__getitem__(index)

    def getPasta(self, index):
        return self.pizza.__getitem__(index)

    def getBurger(self, index):
        return self.burger.__getitem__(index)

    def getShawarma(self, index):
        return self.shawarma.__getitem__(index)

    def display(self):
        print(f"Restaurant name: {self.getName()}")
        print(f"Restaurant type: {self.getType()}")
        print(f"Restaurant food quantity: {self.getQuantity()}")
        print(f"Food orders count: {self.orders_count}")
        print("List of food orders: ")
        self.orders.display()
        print(f"Pizza orders count: {self.pizza_count}")
        print("List of pizza orders: ")
        self.pizza.display()
        print(f"Pasta order count: {self.pasta_count}")
        print("List of pasta orders: ")
        self.pasta.display()
        print(f"Burger orders count: {self.burger_count}")
        print("List of burger orders: ")
        self.burger.display()
        print(f"Shawarma orders count: {self.shawarma_count}")
        print("List of shawarma orders: ")
        self.shawarma.display()
