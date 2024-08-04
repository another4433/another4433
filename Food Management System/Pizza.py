from Toppings import Toppings
from State import State


class Pizza:
    name = "None"
    type = "Fast Food"
    top = Toppings
    describe = State

    def __init__(self, name, top, states):
        self.name = name
        self.top = top
        self.describe = states

    def setName(self, name):
        self.name = name

    def setType(self, category):
        self.type = category

    def setState(self, state):
        self.describe = state

    def getToppings(self):
        return self.top

    def getName(self):
        return self.name

    def getType(self):
        return self.type

    def display(self):
        print(f"Pizza Name: {self.getName()} \nPizza Type: {self.getType()} \n\n")
        print(f"Pizza Toppings: {self.getToppings()} \n\nPizza States: {self.describe}")
