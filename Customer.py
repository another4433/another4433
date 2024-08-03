from Restaurant import Restaurant
from Person import Person


class Customer(Person):
    email = "empty"
    phone = "empty"
    specificRestaurant = Restaurant
    customerID = 0

    def __init__(self, name, cpr, age, money, email, phone, specific, customer_id):
        super().__init__(name, cpr, age, money)
        self.email = email
        self.phone = phone
        self.specificRestaurant = specific
        self.customerID = customer_id

    def setName(self, name):
        self.name = name

    def setID(self, cpr):
        self.id = cpr

    def setMoney(self, money):
        self.money = money

    def setEmail(self, email):
        self.email = email

    def setPhone(self, phone):
        self.phone = phone

    def setRestaurant(self, restaurant):
        self.specificRestaurant = restaurant

    def getName(self):
        return self.name

    def getID(self):
        return self.id

    def getEmail(self):
        return self.email

    def getMoney(self):
        return self.money

    def getAge(self):
        return self.age

    def getRestaurant(self):
        return self.specificRestaurant

    def getCustomerID(self):
        return self.customerID

    def getPhone(self):
        return self.phone

    def display(self):
        super().display()
        print(f"Email: {self.getEmail()}")
        print(f"Phone number: {self.getPhone()}")
        print("\nDetails about the restaurant: ")
        self.getRestaurant().display()
        print(f"\nCustomer ID: {self.getCustomerID()}")
