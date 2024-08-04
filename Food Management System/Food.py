class Food:
    name = ""
    type = "Fast food"
    quantity = 0

    def __init__(self, name, quantity):
        self.name = name
        self.quantity = quantity

    def setName(self, name):
        self.name = name

    def setType(self, t):
        self.type = t

    def setQuantity(self, quantity):
        self.quantity = quantity

    def getQuantity(self):
        return self.quantity

    def getName(self):
        return self.name

    def getType(self):
        return self.type

    def display(self):
        print(f"Name: {self.name} \nType: {self.type} \nQuantity: {self.quantity}")
