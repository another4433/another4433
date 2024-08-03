class Person:
    name = ""
    id = 0
    age = 0
    money = 0

    def __init__(self, name, cpr, age, money):
        self.name = name
        self.id = cpr
        self.age = age
        self.money = money

    def setName(self, name):
        self.name = name

    def setID(self, cpr):
        self.id = cpr

    def setAge(self, age):
        self.age = age

    def getName(self):
        return self.name

    def getID(self):
        return self.id

    def getAge(self):
        return self.age

    def setMoney(self, money):
        self.money = money

    def getMoney(self):
        return self.money

    def display(self):
        print(f"Name: {self.getName()} \nID: {self.getID()} \nAge: {self.getAge()} \nMoney: {self.getMoney()} BD")
