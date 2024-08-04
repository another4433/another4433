from Burger import Burger


class Shawarma(Burger):

    def __init__(self, name, top, states, food_side, bread):
        super().__init__(name, top, states, food_side, bread)

    def display(self):
        print(f"Shawarma Name: {self.getName()} \nShawarma Type: {self.getType()}")
        print(f"\nShawarma is on {self.getFoodSide()} side \n\n")
        print(f"Shawarma Toppings: {self.top} \n\nShawarma States: {self.describe} \n\n")
        print(f"Shawarma Bread Type: {self.bread}")
