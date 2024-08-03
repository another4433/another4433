from customList import List


class State:
    containSauce = False
    isSpicy = False
    isRegular = False
    containMayo = False
    isOily = False
    properties = List

    def __init__(self, initial):
        self.containSauce = False
        self.isSpicy = False
        self.isRegular = False
        self.containMayo = False
        self.isOily = False
        self.properties = List(initial)

    def setSauce(self, sauce):
        self.containSauce = bool(sauce)

    def spicy(self):
        return self.isSpicy

    def regular(self):
        return self.isRegular

    def setMayo(self, mayonnaise):
        self.containMayo = bool(mayonnaise)

    def oily(self):
        return self.isOily

    def addState(self, state):
        self.properties.request(state)

    def deleteState(self, state):
        return self.properties.remove(state)

    def getSauce(self):
        return self.containSauce

    def setSpicy(self, spicy):
        self.isSpicy = bool(spicy)

    def setRegular(self, regular):
        self.isRegular = bool(regular)

    def mayonnaise(self):
        return self.containMayo

    def setOily(self, oil):
        self.isOily = bool(oil)

    def __getitem__(self, item):
        if self.properties.search(item):
            return self.properties.array[item]
        else:
            print("State not found!")

    def display(self):
        self.properties.display()
