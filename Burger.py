from Pasta import Pasta


class Burger(Pasta):
    food_side = "Meat or Chicken"
    bread = "Roll bread"

    def __init__(self, name, top, state, food_side, bread):
        super().__init__(name, top, state)
        self.food_side = food_side
        self.bread = bread

    def setFoodSide(self, food_side):
        self.food_side = food_side

    def getFoodSide(self):
        return self.food_side

    def setBread(self, bread):
        self.bread = bread

    def getBread(self):
        return self.bread

    def display(self):
        print(f"Burger Name: {self.getName()} \nBurger Type: {self.getType()}")
        print(f"\nBurger is on {self.getFoodSide()} side\n\n")
        print(f"Burger Toppings: {self.top} \n\nBurger States: {self.describe} \n\nBurger Bread Type: {self.bread}")
