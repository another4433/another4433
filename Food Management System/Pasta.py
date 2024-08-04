from Pizza import Pizza


class Pasta(Pizza):

    def __init__(self, name, top, states):
        super().__init__(name, top, states)

    def display(self):
        print(f"Pasta Name: {self.getName()} \nPasta Type: {self.getType()} \n\n")
        print(f"Pasta Toppings: {self.getToppings()} \n\nPasta States: {self.describe}")
