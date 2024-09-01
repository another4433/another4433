from myArrayList import ArrayList as myList
import random as rand
import json

colors = ['Green', 'Yellow', 'Red', 'Blue', 'Black']
types = ['Normal Card', 'Special Card']
number = [None, '+2', '+4', 0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
selector_color = rand.randint(0, len(colors)-1)
selector_type = rand.randint(0, 1)
selector_number = rand.randint(0, len(number)-1)
card = {"Number": 0, "Color": "Green", "Type": "Normal Card"}
if colors[selector_color] == 'Black' and types[selector_type] == 'Special Card':
    while not (number[selector_number] is None or number[selector_number] == '+4'):
        selector_number = rand.randint(0, len(number)-1)
    if number[selector_number] is None or number[selector_number] == '+4':
        card = {"Number": None, "Color": "Black", "Type": "Special Card"}
elif not (colors[selector_color] == 'Black') and not (types[selector_type] == 'Special Card'):
    if not (number[selector_number] is None or number[selector_number] == '+4'):
        card = {"Number": number[selector_number], "Color": colors[selector_color], "Type": types[selector_type]}
else:
    while (colors[selector_color] == 'Black' and not (types[selector_type] == 'Special Card') and not (
            number[selector_number] is None or number[selector_number] == '+4')) or (
            not (colors[selector_color] == 'Black') and types[selector_type] == 'Special Card' and (
            number[selector_number] is None or number[selector_number] == '+4')) or (
            colors[selector_color] == 'Black' and types[selector_type] == 'Special Card' and not (
            number[selector_number] is None or number[selector_number] == '+4')) or (
            colors[selector_color] == 'Black' and not (types[selector_type] == 'Special Card') and (
            number[selector_number] is None or number[selector_number] == '+4')) or (
            not (colors[selector_color] == 'Black') and not (types[selector_type] == 'Special Card') and (
            number[selector_number] is None or number[selector_number] == '+4')) or (
            not (colors[selector_color] == 'Black') and types[selector_type] == 'Special Card' and not (
            number[selector_number] is None or number[selector_number] == '+4')):
        selector_color = rand.randint(0, len(colors) - 1)
        selector_type = rand.randint(0, 1)
        selector_number = rand.randint(0, len(number) - 1)
    card = {"Number": number[selector_number], "Color": colors[selector_color], "Type": types[selector_type]}
collection = tuple(("UNO Game Started",))
collection += (card,)
user_list = myList
computer_list = myList
your_list_count = 0
PC_list_count = 0

print("Welcome to UNO game!")
print("Type \"start\" to start this game.")
print("Type \"quit\" to leave this game.")
answer = input("Answer: ")
while answer != "start" or answer != "Start" or answer != "quit" or answer != "Quit":
    answer = input("Re-enter your input: ")
if answer == "start" or answer == "Start":
    print("How many cards do you want to have?")
    identifier = int(input("Answer: "))
    while identifier < 1:
        identifier = int(input("Re-enter the number to be greater than 0: "))
    print("Gameplay environment creation is in progress.")
    print("Please! wait...")
    for i in range(0, identifier+1):
        selector_color = rand.randint(0, len(colors) - 1)
        selector_type = rand.randint(0, 1)
        selector_number = rand.randint(0, len(number) - 1)
        if colors[selector_color] == 'Black' and types[selector_type] == 'Special Card':
            while not (number[selector_number] is None or number[selector_number] == '+4'):
                selector_number = rand.randint(0, len(number) - 1)
            if number[selector_number] is None or number[selector_number] == '+4':
                card = {"Number": None, "Color": "Black", "Type": "Special Card"}
        elif not (colors[selector_color] == 'Black') and not (types[selector_type] == 'Special Card'):
            if not (number[selector_number] is None or number[selector_number] == '+4'):
                card = {"Number": number[selector_number], "Color": colors[selector_color],
                        "Type": types[selector_type]}
        else:
            while (colors[selector_color] == 'Black' and not (types[selector_type] == 'Special Card') and not (
                    number[selector_number] is None or number[selector_number] == '+4')) or (
                    not (colors[selector_color] == 'Black') and types[selector_type] == 'Special Card' and (
                    number[selector_number] is None or number[selector_number] == '+4')) or (
                    colors[selector_color] == 'Black' and types[selector_type] == 'Special Card' and not (
                    number[selector_number] is None or number[selector_number] == '+4')) or (
                    colors[selector_color] == 'Black' and not (types[selector_type] == 'Special Card') and (
                    number[selector_number] is None or number[selector_number] == '+4')) or (
                    not (colors[selector_color] == 'Black') and not (types[selector_type] == 'Special Card') and (
                    number[selector_number] is None or number[selector_number] == '+4')) or (
                    not (colors[selector_color] == 'Black') and types[selector_type] == 'Special Card' and not (
                    number[selector_number] is None or number[selector_number] == '+4')):
                selector_color = rand.randint(0, len(colors) - 1)
                selector_type = rand.randint(0, 1)
                selector_number = rand.randint(0, len(number) - 1)
            card = {"Number": number[selector_number], "Color": colors[selector_color], "Type": types[selector_type]}
        user_list.addLast(user_list.array, card)
        your_list_count = your_list_count + 1
    for j in range(0, identifier+1):
        selector_color = rand.randint(0, len(colors) - 1)
        selector_type = rand.randint(0, 1)
        selector_number = rand.randint(0, len(number) - 1)
        if colors[selector_color] == 'Black' and types[selector_type] == 'Special Card':
            while not (number[selector_number] is None or number[selector_number] == '+4'):
                selector_number = rand.randint(0, len(number) - 1)
            if number[selector_number] is None or number[selector_number] == '+4':
                card = {"Number": None, "Color": "Black", "Type": "Special Card"}
        elif not (colors[selector_color] == 'Black') and not (types[selector_type] == 'Special Card'):
            if not (number[selector_number] is None or number[selector_number] == '+4'):
                card = {"Number": number[selector_number], "Color": colors[selector_color],
                        "Type": types[selector_type]}
        else:
            while (colors[selector_color] == 'Black' and not (types[selector_type] == 'Special Card') and not (
                    number[selector_number] is None or number[selector_number] == '+4')) or (
                    not (colors[selector_color] == 'Black') and types[selector_type] == 'Special Card' and (
                    number[selector_number] is None or number[selector_number] == '+4')) or (
                    colors[selector_color] == 'Black' and types[selector_type] == 'Special Card' and not (
                    number[selector_number] is None or number[selector_number] == '+4')) or (
                    colors[selector_color] == 'Black' and not (types[selector_type] == 'Special Card') and (
                    number[selector_number] is None or number[selector_number] == '+4')) or (
                    not (colors[selector_color] == 'Black') and not (types[selector_type] == 'Special Card') and (
                    number[selector_number] is None or number[selector_number] == '+4')) or (
                    not (colors[selector_color] == 'Black') and types[selector_type] == 'Special Card' and not (
                    number[selector_number] is None or number[selector_number] == '+4')):
                selector_color = rand.randint(0, len(colors) - 1)
                selector_type = rand.randint(0, 1)
                selector_number = rand.randint(0, len(number) - 1)
            card = {"Number": number[selector_number], "Color": colors[selector_color], "Type": types[selector_type]}
        computer_list.addLast(computer_list.List(computer_list.array), card)
        PC_list_count = PC_list_count + 1
    print("Computer have ", computer_list.Size(computer_list.array), "cards. ")
    print("Your cards are as follows: ")
    user_list.display(user_list.array)
    print(collection[0], "\n")
    top_size = 1
    print("Top of the card = ", collection[top_size], "\n")
    top_size = top_size + 1
    while your_list_count > 0 or PC_list_count > 0:
        print("What do you want to do? ")
        print("1. Request new card.")
        print("2. Display cards.")
        print("3. Put a card.")
        identifying = int(input("Type only \"Number\" here: "))
        match identifying:
            case 1:
                selector_color = rand.randint(0, len(colors) - 1)
                selector_type = rand.randint(0, 1)
                selector_number = rand.randint(0, len(number) - 1)
                if colors[selector_color] == 'Black' and types[selector_type] == 'Special Card':
                    while not (number[selector_number] is None or number[selector_number] == '+4'):
                        selector_number = rand.randint(0, len(number) - 1)
                    if number[selector_number] is None or number[selector_number] == '+4':
                        card = {"Number": None, "Color": "Black", "Type": "Special Card"}
                elif not (colors[selector_color] == 'Black') and not (types[selector_type] == 'Special Card'):
                    if not (number[selector_number] is None or number[selector_number] == '+4'):
                        card = {"Number": number[selector_number], "Color": colors[selector_color],
                                "Type": types[selector_type]}
                else:
                    while (colors[selector_color] == 'Black' and not (types[selector_type] == 'Special Card') and not (
                            number[selector_number] is None or number[selector_number] == '+4')) or (
                            not (colors[selector_color] == 'Black') and types[selector_type] == 'Special Card' and (
                            number[selector_number] is None or number[selector_number] == '+4')) or (
                            colors[selector_color] == 'Black' and types[selector_type] == 'Special Card' and not (
                            number[selector_number] is None or number[selector_number] == '+4')) or (
                            colors[selector_color] == 'Black' and not (types[selector_type] == 'Special Card') and (
                            number[selector_number] is None or number[selector_number] == '+4')) or (
                            not (colors[selector_color] == 'Black') and not (types[selector_type] == 'Special Card') and
                            (number[selector_number] is None or number[selector_number] == '+4')) or (
                            not (colors[selector_color] == 'Black') and types[selector_type] == 'Special Card' and not (
                            number[selector_number] is None or number[selector_number] == '+4')):
                        selector_color = rand.randint(0, len(colors) - 1)
                        selector_type = rand.randint(0, 1)
                        selector_number = rand.randint(0, len(number) - 1)
                    card = {"Number": number[selector_number], "Color": colors[selector_color],
                            "Type": types[selector_type]}
                user_list.addLast(user_list.array, card)
                your_list_count = your_list_count + 1
            case 2: user_list.display(user_list.array)
            case 3:
                choosing = int(input("Choose your card by specifying index number here: "))
                while choosing < 0 or choosing > user_list.size - 1:
                    print("Re-enter the number to be between 0 and ", user_list.size - 1, ".")
                    choosing = int(input("Answer: "))
                print("You chose ", user_list.get(user_list.array, choosing))
                variable = str(collection[top_size])
                texture = json.loads(variable)
                card = dict(texture)
                while ((user_list.get(user_list.array, choosing)["Number"] != card["Number"]) and
                       (user_list.get(user_list.array, choosing)["Color"] != card["Color"]) and
                       (user_list.get(user_list.array, choosing)["Type"] != card["Type"])):
                    if ((user_list.get(user_list.array, choosing)["Number"] == '+4' or
                        user_list.get(user_list.array, choosing)["Number"] is None) and
                            user_list.get(user_list.array, choosing)["Color"] == 'Black' and
                            user_list.get(user_list.array, choosing)["Type"] == 'Special Card'):
                        break
                    print("Re-enter the number to be between 0 and ", user_list.size - 1, ".")
                    print("Make sure that it have some matching to top of the stack cards!")
                    choosing = int(input("Answer: "))
                if (user_list.get(user_list.array, choosing)["Number"] is None and
                        user_list.get(user_list.array, choosing)["Color"] == 'Black' and
                        user_list.get(user_list.array, choosing)["Type"] == 'Special Card'):
                    print("Choose color from list below.")
                    print(colors)
                    chooser = input("Answer: ")
                    while True:
                        flag = False
                        for a in colors:
                            if chooser == a:
                                flag = True
                                break
                        if flag:
                            break
                        else:
                            print("Re-select color from list below except black.")
                            print(colors)
                            chooser = input("Answer: ")
                    user_list.get(user_list.array, choosing)["Color"] = chooser
                elif user_list.get(user_list.array, choosing)["Number"] == '+2':
                    for i in range(0, 2):
                        selector_color = rand.randint(0, len(colors) - 1)
                        selector_type = rand.randint(0, 1)
                        selector_number = rand.randint(0, len(number) - 1)
                        if colors[selector_color] == 'Black' and types[selector_type] == 'Special Card':
                            while not (number[selector_number] is None or number[selector_number] == '+4'):
                                selector_number = rand.randint(0, len(number) - 1)
                            if number[selector_number] is None or number[selector_number] == '+4':
                                card = {"Number": None, "Color": "Black", "Type": "Special Card"}
                        elif not (colors[selector_color] == 'Black') and not (types[selector_type] == 'Special Card'):
                            if not (number[selector_number] is None or number[selector_number] == '+4'):
                                card = {"Number": number[selector_number], "Color": colors[selector_color],
                                        "Type": types[selector_type]}
                        else:
                            while (colors[selector_color] == 'Black' and not (
                                    types[selector_type] == 'Special Card') and not (
                                    number[selector_number] is None or number[selector_number] == '+4')) or (
                                    not (colors[selector_color] == 'Black') and types[
                                    selector_type] == 'Special Card' and (
                                            number[selector_number] is None or number[selector_number] == '+4')) or (
                                    colors[selector_color] == 'Black' and types[
                                    selector_type] == 'Special Card' and not (
                                    number[selector_number] is None or number[selector_number] == '+4')) or (
                                    colors[selector_color] == 'Black' and not (
                                    types[selector_type] == 'Special Card') and (
                                            number[selector_number] is None or number[selector_number] == '+4')) or (
                                    not (colors[selector_color] == 'Black') and not (
                                    types[selector_type] == 'Special Card') and (
                                            number[selector_number] is None or number[selector_number] == '+4')) or (
                                    not (colors[selector_color] == 'Black') and types[
                                    selector_type] == 'Special Card' and not (
                                    number[selector_number] is None or number[selector_number] == '+4')):
                                selector_color = rand.randint(0, len(colors) - 1)
                                selector_type = rand.randint(0, 1)
                                selector_number = rand.randint(0, len(number) - 1)
                                card = {"Number": number[selector_number], "Color": colors[selector_color],
                                        "Type": types[selector_type]}
                        computer_list.addLast(computer_list.List(computer_list.array), card)
                        PC_list_count = PC_list_count + 1
                elif (user_list.get(user_list.array, choosing)["Number"] == "+4" and
                        user_list.get(user_list.array, choosing)["Color"] == 'Black' and
                        user_list.get(user_list.array, choosing)["Type"] == 'Special Card'):
                    print("Choose color from list below.")
                    print(colors)
                    chooser = input("Answer: ")
                    while True:
                        flag = False
                        for a in colors:
                            if chooser == a:
                                flag = True
                                break
                        if flag:
                            break
                        else:
                            print("Re-select color from list below except black.")
                            print(colors)
                            chooser = input("Answer: ")
                    user_list.get(user_list.array, choosing)["Color"] = chooser
                    finally1 = -1
                    print("Choose the following action: ")
                    print("1. Challenge the computer.")
                    print("2. Draw 4 cards.")
                    choice = int(input("Enter number only here: "))
                    if choice == 1:
                        counter = 0
                        for b in computer_list.array:
                            if b["Color"] == chooser:
                                counter = counter + 1
                        if counter == 1:
                            finally1 = 0
                        else:
                            finally1 = 6
                    elif choice == 2:
                        finally1 = 4
                    print("You draw ", finally1, " cards.")
                    for i in range(0, finally1):
                        selector_color = rand.randint(0, len(colors) - 1)
                        selector_type = rand.randint(0, 1)
                        selector_number = rand.randint(0, len(number) - 1)
                        if colors[selector_color] == 'Black' and types[selector_type] == 'Special Card':
                            while not (number[selector_number] is None or number[selector_number] == '+4'):
                                selector_number = rand.randint(0, len(number) - 1)
                            if number[selector_number] is None or number[selector_number] == '+4':
                                card = {"Number": None, "Color": "Black", "Type": "Special Card"}
                        elif not (colors[selector_color] == 'Black') and not (types[selector_type] == 'Special Card'):
                            if not (number[selector_number] is None or number[selector_number] == '+4'):
                                card = {"Number": number[selector_number], "Color": colors[selector_color],
                                        "Type": types[selector_type]}
                        else:
                            while (colors[selector_color] == 'Black' and not (
                                    types[selector_type] == 'Special Card') and not (
                                    number[selector_number] is None or number[selector_number] == '+4')) or (
                                    not (colors[selector_color] == 'Black') and types[
                                    selector_type] == 'Special Card' and (
                                            number[selector_number] is None or number[selector_number] == '+4')) or (
                                    colors[selector_color] == 'Black' and types[
                                    selector_type] == 'Special Card' and not (
                                    number[selector_number] is None or number[selector_number] == '+4')) or (
                                    colors[selector_color] == 'Black' and not (
                                    types[selector_type] == 'Special Card') and (
                                            number[selector_number] is None or number[selector_number] == '+4')) or (
                                    not (colors[selector_color] == 'Black') and not (
                                    types[selector_type] == 'Special Card') and (
                                            number[selector_number] is None or number[selector_number] == '+4')) or (
                                    not (colors[selector_color] == 'Black') and types[
                                    selector_type] == 'Special Card' and not (
                                    number[selector_number] is None or number[selector_number] == '+4')):
                                selector_color = rand.randint(0, len(colors) - 1)
                                selector_type = rand.randint(0, 1)
                                selector_number = rand.randint(0, len(number) - 1)
                                card = {"Number": number[selector_number], "Color": colors[selector_color],
                                        "Type": types[selector_type]}
                        computer_list.addLast(computer_list.List(computer_list.array), card)
                        PC_list_count = PC_list_count + 1
                collection += (user_list.get(user_list.array, choosing),)
                print("Deleted card: ", user_list.delete(user_list.array, user_list.get(user_list.array, choosing)))
                your_list_count = your_list_count - 1
                print("Top of the card = ", collection[top_size], "\n")
                top_size = top_size + 1
                index_selector = rand.randint(0, PC_list_count-1)
                while ((computer_list.get(computer_list.array, index_selector)["Number"] != card["Number"]) and
                       (computer_list.get(computer_list.array, index_selector)["Color"] != card["Color"]) and
                       (computer_list.get(computer_list.array, index_selector)["Type"] != card["Type"])):
                    if ((computer_list.get(computer_list.array, index_selector)["Number"] == '+4' or
                        computer_list.get(computer_list.array, index_selector)["Number"] is None) and
                            computer_list.get(computer_list.array, index_selector)["Color"] == 'Black' and
                            computer_list.get(computer_list.array, index_selector)["Type"] == 'Special Card'):
                        break
                    index_selector = rand.randint(0, PC_list_count - 1)
                if (computer_list.get(computer_list.array, index_selector)["Number"] is None and
                        computer_list.get(computer_list.array, index_selector)["Color"] == 'Black' and
                        computer_list.get(computer_list.array, index_selector)["Type"] == 'Special Card'):
                    item_selector_1 = rand.randint(0, len(colors)-1)
                    item_selector_2 = colors[item_selector_1]
                    while True:
                        flag = False
                        for a in colors:
                            if item_selector_2 == a:
                                flag = True
                                break
                        if flag:
                            break
                        else:
                            item_selector_1 = rand.randint(0, len(colors) - 1)
                            item_selector_2 = colors[item_selector_1]
                    computer_list.get(computer_list.array, index_selector)["Color"] = item_selector_2
                elif computer_list.get(computer_list.array, index_selector)["Number"] == '+2':
                    for i in range(0, 2):
                        selector_color = rand.randint(0, len(colors) - 1)
                        selector_type = rand.randint(0, 1)
                        selector_number = rand.randint(0, len(number) - 1)
                        if colors[selector_color] == 'Black' and types[selector_type] == 'Special Card':
                            while not (number[selector_number] is None or number[selector_number] == '+4'):
                                selector_number = rand.randint(0, len(number) - 1)
                            if number[selector_number] is None or number[selector_number] == '+4':
                                card = {"Number": None, "Color": "Black", "Type": "Special Card"}
                        elif not (colors[selector_color] == 'Black') and not (types[selector_type] == 'Special Card'):
                            if not (number[selector_number] is None or number[selector_number] == '+4'):
                                card = {"Number": number[selector_number], "Color": colors[selector_color],
                                        "Type": types[selector_type]}
                        else:
                            while (colors[selector_color] == 'Black' and not (
                                    types[selector_type] == 'Special Card') and not (
                                    number[selector_number] is None or number[selector_number] == '+4')) or (
                                    not (colors[selector_color] == 'Black') and types[
                                    selector_type] == 'Special Card' and (
                                            number[selector_number] is None or number[selector_number] == '+4')) or (
                                    colors[selector_color] == 'Black' and types[
                                    selector_type] == 'Special Card' and not (
                                    number[selector_number] is None or number[selector_number] == '+4')) or (
                                    colors[selector_color] == 'Black' and not (
                                    types[selector_type] == 'Special Card') and (
                                            number[selector_number] is None or number[selector_number] == '+4')) or (
                                    not (colors[selector_color] == 'Black') and not (
                                    types[selector_type] == 'Special Card') and (
                                            number[selector_number] is None or number[selector_number] == '+4')) or (
                                    not (colors[selector_color] == 'Black') and types[
                                    selector_type] == 'Special Card' and not (
                                    number[selector_number] is None or number[selector_number] == '+4')):
                                selector_color = rand.randint(0, len(colors) - 1)
                                selector_type = rand.randint(0, 1)
                                selector_number = rand.randint(0, len(number) - 1)
                                card = {"Number": number[selector_number], "Color": colors[selector_color],
                                        "Type": types[selector_type]}
                        user_list.addLast(user_list.array, card)
                        your_list_count = your_list_count + 1
                elif (computer_list.get(computer_list.array, index_selector)["Number"] == '+4' and
                        computer_list.get(computer_list.array, index_selector)["Color"] == 'Black' and
                        computer_list.get(computer_list.array, index_selector)["Type"] == 'Special Card'):
                    item_selector_1 = rand.randint(0, len(colors)-1)
                    item_selector_2 = colors[item_selector_1]
                    while True:
                        flag = False
                        for a in colors:
                            if item_selector_2 == a:
                                flag = True
                                break
                        if flag:
                            break
                        else:
                            item_selector_1 = rand.randint(0, len(colors) - 1)
                            item_selector_2 = colors[item_selector_1]
                    computer_list.get(computer_list.array, index_selector)["Color"] = item_selector_2
                    print("Computer will draw 4 cards.")
                    for i in range(0, 4):
                        selector_color = rand.randint(0, len(colors) - 1)
                        selector_type = rand.randint(0, 1)
                        selector_number = rand.randint(0, len(number) - 1)
                        if colors[selector_color] == 'Black' and types[selector_type] == 'Special Card':
                            while not (number[selector_number] is None or number[selector_number] == '+4'):
                                selector_number = rand.randint(0, len(number) - 1)
                            if number[selector_number] is None or number[selector_number] == '+4':
                                card = {"Number": None, "Color": "Black", "Type": "Special Card"}
                        elif not (colors[selector_color] == 'Black') and not (types[selector_type] == 'Special Card'):
                            if not (number[selector_number] is None or number[selector_number] == '+4'):
                                card = {"Number": number[selector_number], "Color": colors[selector_color],
                                        "Type": types[selector_type]}
                        else:
                            while (colors[selector_color] == 'Black' and not (
                                    types[selector_type] == 'Special Card') and not (
                                    number[selector_number] is None or number[selector_number] == '+4')) or (
                                    not (colors[selector_color] == 'Black') and types[
                                    selector_type] == 'Special Card' and (
                                            number[selector_number] is None or number[selector_number] == '+4')) or (
                                    colors[selector_color] == 'Black' and types[
                                    selector_type] == 'Special Card' and not (
                                    number[selector_number] is None or number[selector_number] == '+4')) or (
                                    colors[selector_color] == 'Black' and not (
                                    types[selector_type] == 'Special Card') and (
                                            number[selector_number] is None or number[selector_number] == '+4')) or (
                                    not (colors[selector_color] == 'Black') and not (
                                    types[selector_type] == 'Special Card') and (
                                            number[selector_number] is None or number[selector_number] == '+4')) or (
                                    not (colors[selector_color] == 'Black') and types[
                                    selector_type] == 'Special Card' and not (
                                    number[selector_number] is None or number[selector_number] == '+4')):
                                selector_color = rand.randint(0, len(colors) - 1)
                                selector_type = rand.randint(0, 1)
                                selector_number = rand.randint(0, len(number) - 1)
                                card = {"Number": number[selector_number], "Color": colors[selector_color],
                                        "Type": types[selector_type]}
                        user_list.addLast(user_list.array, card)
                        your_list_count = your_list_count + 1
                collection += (computer_list.delete(computer_list.array,
                                                    computer_list.get(computer_list.array, index_selector)), )
            case _:
                print("Your selection is not found in the menu above.")
                print("Your cards will be sorted.")
                print("Please! wait...")
                if not (user_list.sorted(user_list.array)):
                    user_list.sort(user_list.array)
                print("Your list is sorted.")
    if your_list_count == 0:
        print("You won the game. Congrats!")
    elif PC_list_count == 0:
        print("Computer won the game. Congrats!")
    else:
        print("The game is a tie.")
    print("Do you want to play the game again?")
    print("Yes or No.")
    answering = input("Answer: ")
    while answering != "Yes" or answering != "No":
        answering = input("Re-enter your input as \"Yes\" or \"No\":")
    while answering == "Yes":
        selector_color = rand.randint(0, len(colors) - 1)
        selector_type = rand.randint(0, 1)
        selector_number = rand.randint(0, len(number) - 1)
        card = {"Number": 0, "Color": "Green", "Type": "Normal Card"}
        if colors[selector_color] == 'Black' and types[selector_type] == 'Special Card':
            while not (number[selector_number] is None or number[selector_number] == '+4'):
                selector_number = rand.randint(0, len(number) - 1)
            if number[selector_number] is None or number[selector_number] == '+4':
                card = {"Number": None, "Color": "Black", "Type": "Special Card"}
        elif not (colors[selector_color] == 'Black') and not (types[selector_type] == 'Special Card'):
            if not (number[selector_number] is None or number[selector_number] == '+4'):
                card = {"Number": number[selector_number], "Color": colors[selector_color],
                        "Type": types[selector_type]}
        else:
            while (colors[selector_color] == 'Black' and not (types[selector_type] == 'Special Card') and not (
                    number[selector_number] is None or number[selector_number] == '+4')) or (
                    not (colors[selector_color] == 'Black') and types[selector_type] == 'Special Card' and (
                    number[selector_number] is None or number[selector_number] == '+4')) or (
                    colors[selector_color] == 'Black' and types[selector_type] == 'Special Card' and not (
                    number[selector_number] is None or number[selector_number] == '+4')) or (
                    colors[selector_color] == 'Black' and not (types[selector_type] == 'Special Card') and (
                    number[selector_number] is None or number[selector_number] == '+4')) or (
                    not (colors[selector_color] == 'Black') and not (types[selector_type] == 'Special Card') and (
                    number[selector_number] is None or number[selector_number] == '+4')) or (
                    not (colors[selector_color] == 'Black') and types[selector_type] == 'Special Card' and not (
                    number[selector_number] is None or number[selector_number] == '+4')):
                selector_color = rand.randint(0, len(colors) - 1)
                selector_type = rand.randint(0, 1)
                selector_number = rand.randint(0, len(number) - 1)
            card = {"Number": number[selector_number], "Color": colors[selector_color], "Type": types[selector_type]}
        collection = tuple(("UNO Game Started",))
        collection += (card,)
        user_list = myList
        computer_list = myList
        your_list_count = 0
        PC_list_count = 0

        print("Welcome to UNO game!")
        print("Type \"start\" to start this game.")
        print("Type \"quit\" to leave this game.")
        answer = input("Answer: ")
        while answer != "start" or answer != "Start" or answer != "quit" or answer != "Quit":
            answer = input("Re-enter your input: ")
        if answer == "start" or answer == "Start":
            print("How many cards do you want to have?")
            identifier = int(input("Answer: "))
            while identifier < 1:
                identifier = int(input("Re-enter the number to be greater than 0: "))
            print("Gameplay environment creation is in progress.")
            print("Please! wait...")
            for i in range(0, identifier + 1):
                selector_color = rand.randint(0, len(colors) - 1)
                selector_type = rand.randint(0, 1)
                selector_number = rand.randint(0, len(number) - 1)
                if colors[selector_color] == 'Black' and types[selector_type] == 'Special Card':
                    while not (number[selector_number] is None or number[selector_number] == '+4'):
                        selector_number = rand.randint(0, len(number) - 1)
                    if number[selector_number] is None or number[selector_number] == '+4':
                        card = {"Number": None, "Color": "Black", "Type": "Special Card"}
                elif not (colors[selector_color] == 'Black') and not (types[selector_type] == 'Special Card'):
                    if not (number[selector_number] is None or number[selector_number] == '+4'):
                        card = {"Number": number[selector_number], "Color": colors[selector_color],
                                "Type": types[selector_type]}
                else:
                    while (colors[selector_color] == 'Black' and not (types[selector_type] == 'Special Card') and not (
                            number[selector_number] is None or number[selector_number] == '+4')) or (
                            not (colors[selector_color] == 'Black') and types[selector_type] == 'Special Card' and (
                            number[selector_number] is None or number[selector_number] == '+4')) or (
                            colors[selector_color] == 'Black' and types[selector_type] == 'Special Card' and not (
                            number[selector_number] is None or number[selector_number] == '+4')) or (
                            colors[selector_color] == 'Black' and not (types[selector_type] == 'Special Card') and (
                            number[selector_number] is None or number[selector_number] == '+4')) or (
                            not (colors[selector_color] == 'Black') and not (
                            types[selector_type] == 'Special Card') and (
                                    number[selector_number] is None or number[selector_number] == '+4')) or (
                            not (colors[selector_color] == 'Black') and types[selector_type] == 'Special Card' and not (
                            number[selector_number] is None or number[selector_number] == '+4')):
                        selector_color = rand.randint(0, len(colors) - 1)
                        selector_type = rand.randint(0, 1)
                        selector_number = rand.randint(0, len(number) - 1)
                    card = {"Number": number[selector_number], "Color": colors[selector_color],
                            "Type": types[selector_type]}
                user_list.addLast(user_list.array, card)
                your_list_count = your_list_count + 1
            for j in range(0, identifier + 1):
                selector_color = rand.randint(0, len(colors) - 1)
                selector_type = rand.randint(0, 1)
                selector_number = rand.randint(0, len(number) - 1)
                if colors[selector_color] == 'Black' and types[selector_type] == 'Special Card':
                    while not (number[selector_number] is None or number[selector_number] == '+4'):
                        selector_number = rand.randint(0, len(number) - 1)
                    if number[selector_number] is None or number[selector_number] == '+4':
                        card = {"Number": None, "Color": "Black", "Type": "Special Card"}
                elif not (colors[selector_color] == 'Black') and not (types[selector_type] == 'Special Card'):
                    if not (number[selector_number] is None or number[selector_number] == '+4'):
                        card = {"Number": number[selector_number], "Color": colors[selector_color],
                                "Type": types[selector_type]}
                else:
                    while (colors[selector_color] == 'Black' and not (types[selector_type] == 'Special Card') and not (
                            number[selector_number] is None or number[selector_number] == '+4')) or (
                            not (colors[selector_color] == 'Black') and types[selector_type] == 'Special Card' and (
                            number[selector_number] is None or number[selector_number] == '+4')) or (
                            colors[selector_color] == 'Black' and types[selector_type] == 'Special Card' and not (
                            number[selector_number] is None or number[selector_number] == '+4')) or (
                            colors[selector_color] == 'Black' and not (types[selector_type] == 'Special Card') and (
                            number[selector_number] is None or number[selector_number] == '+4')) or (
                            not (colors[selector_color] == 'Black') and not (
                            types[selector_type] == 'Special Card') and (
                                    number[selector_number] is None or number[selector_number] == '+4')) or (
                            not (colors[selector_color] == 'Black') and types[selector_type] == 'Special Card' and not (
                            number[selector_number] is None or number[selector_number] == '+4')):
                        selector_color = rand.randint(0, len(colors) - 1)
                        selector_type = rand.randint(0, 1)
                        selector_number = rand.randint(0, len(number) - 1)
                    card = {"Number": number[selector_number], "Color": colors[selector_color],
                            "Type": types[selector_type]}
                computer_list.addLast(computer_list.List(computer_list.array), card)
                PC_list_count = PC_list_count + 1
            print("Computer have ", computer_list.Size(computer_list.array), "cards. ")
            print("Your cards are as follows: ")
            user_list.display(user_list.array)
            print(collection[0], "\n")
            top_size = 1
            print("Top of the card = ", collection[top_size], "\n")
            top_size = top_size + 1
            while your_list_count > 0 or PC_list_count > 0:
                print("What do you want to do? ")
                print("1. Request new card.")
                print("2. Display cards.")
                print("3. Put a card.")
                identifying = int(input("Type only \"Number\" here: "))
                match identifying:
                    case 1:
                        selector_color = rand.randint(0, len(colors) - 1)
                        selector_type = rand.randint(0, 1)
                        selector_number = rand.randint(0, len(number) - 1)
                        if colors[selector_color] == 'Black' and types[selector_type] == 'Special Card':
                            while not (number[selector_number] is None or number[selector_number] == '+4'):
                                selector_number = rand.randint(0, len(number) - 1)
                            if number[selector_number] is None or number[selector_number] == '+4':
                                card = {"Number": None, "Color": "Black", "Type": "Special Card"}
                        elif not (colors[selector_color] == 'Black') and not (types[selector_type] == 'Special Card'):
                            if not (number[selector_number] is None or number[selector_number] == '+4'):
                                card = {"Number": number[selector_number], "Color": colors[selector_color],
                                        "Type": types[selector_type]}
                        else:
                            while (colors[selector_color] == 'Black' and not (
                                    types[selector_type] == 'Special Card') and not (
                                    number[selector_number] is None or number[selector_number] == '+4')) or (
                                    not (colors[selector_color] == 'Black') and types[
                                    selector_type] == 'Special Card' and (
                                            number[selector_number] is None or number[selector_number] == '+4')) or (
                                    colors[selector_color] == 'Black' and types[
                                    selector_type] == 'Special Card' and not (
                                    number[selector_number] is None or number[selector_number] == '+4')) or (
                                    colors[selector_color] == 'Black' and not (
                                    types[selector_type] == 'Special Card') and (
                                            number[selector_number] is None or number[selector_number] == '+4')) or (
                                    not (colors[selector_color] == 'Black') and not (
                                    types[selector_type] == 'Special Card') and
                                    (number[selector_number] is None or number[selector_number] == '+4')) or (
                                    not (colors[selector_color] == 'Black') and types[
                                    selector_type] == 'Special Card' and not (
                                    number[selector_number] is None or number[selector_number] == '+4')):
                                selector_color = rand.randint(0, len(colors) - 1)
                                selector_type = rand.randint(0, 1)
                                selector_number = rand.randint(0, len(number) - 1)
                                card = {"Number": number[selector_number], "Color": colors[selector_color],
                                        "Type": types[selector_type]}
                        user_list.addLast(user_list.array, card)
                        your_list_count = your_list_count + 1
                    case 2:
                        user_list.display(user_list.array)
                    case 3:
                        choosing = int(input("Choose your card by specifying index number here: "))
                        while choosing < 0 or choosing > user_list.size - 1:
                            print("Re-enter the number to be between 0 and ", user_list.size - 1, ".")
                            choosing = int(input("Answer: "))
                        print("You chose ", user_list.get(user_list.array, choosing))
                        variable = str(collection[top_size])
                        texture = json.loads(variable)
                        card = dict(texture)
                        while ((user_list.get(user_list.array, choosing)["Number"] != card["Number"]) and
                               (user_list.get(user_list.array, choosing)["Color"] != card["Color"]) and
                               (user_list.get(user_list.array, choosing)["Type"] != card["Type"])):
                            if ((user_list.get(user_list.array, choosing)["Number"] == '+4' or
                                 user_list.get(user_list.array, choosing)["Number"] is None) and
                                    user_list.get(user_list.array, choosing)["Color"] == 'Black' and
                                    user_list.get(user_list.array, choosing)["Type"] == 'Special Card'):
                                break
                            print("Re-enter the number to be between 0 and ", user_list.size - 1, ".")
                            print("Make sure that it have some matching to top of the stack cards!")
                            choosing = int(input("Answer: "))
                        if (user_list.get(user_list.array, choosing)["Number"] is None and
                                user_list.get(user_list.array, choosing)["Color"] == 'Black' and
                                user_list.get(user_list.array, choosing)["Type"] == 'Special Card'):
                            print("Choose color from list below.")
                            print(colors)
                            chooser = input("Answer: ")
                            while True:
                                flag = False
                                for a in colors:
                                    if chooser == a:
                                        flag = True
                                        break
                                if flag:
                                    break
                                else:
                                    print("Re-select color from list below except black.")
                                    print(colors)
                                    chooser = input("Answer: ")
                            user_list.get(user_list.array, choosing)["Color"] = chooser
                        elif user_list.get(user_list.array, choosing)["Number"] == '+2':
                            for i in range(0, 2):
                                selector_color = rand.randint(0, len(colors) - 1)
                                selector_type = rand.randint(0, 1)
                                selector_number = rand.randint(0, len(number) - 1)
                                if colors[selector_color] == 'Black' and types[selector_type] == 'Special Card':
                                    while not (number[selector_number] is None or number[selector_number] == '+4'):
                                        selector_number = rand.randint(0, len(number) - 1)
                                    if number[selector_number] is None or number[selector_number] == '+4':
                                        card = {"Number": None, "Color": "Black", "Type": "Special Card"}
                                elif not (colors[selector_color] == 'Black') and not (
                                        types[selector_type] == 'Special Card'):
                                    if not (number[selector_number] is None or number[selector_number] == '+4'):
                                        card = {"Number": number[selector_number], "Color": colors[selector_color],
                                                "Type": types[selector_type]}
                                else:
                                    while (colors[selector_color] == 'Black' and not (
                                            types[selector_type] == 'Special Card') and not (
                                            number[selector_number] is None or number[selector_number] == '+4')) or (
                                            not (colors[selector_color] == 'Black') and types[
                                            selector_type] == 'Special Card' and (
                                            number[selector_number] is None or number[
                                            selector_number] == '+4')) or (
                                            colors[selector_color] == 'Black' and types[
                                            selector_type] == 'Special Card' and not (
                                            number[selector_number] is None or number[selector_number] == '+4')) or (
                                            colors[selector_color] == 'Black' and not (
                                            types[selector_type] == 'Special Card') and (
                                            number[selector_number] is None or number[
                                            selector_number] == '+4')) or (
                                            not (colors[selector_color] == 'Black') and not (
                                            types[selector_type] == 'Special Card') and (
                                            number[selector_number] is None or number[
                                            selector_number] == '+4')) or (
                                            not (colors[selector_color] == 'Black') and types[
                                            selector_type] == 'Special Card' and not (
                                            number[selector_number] is None or number[selector_number] == '+4')):
                                        selector_color = rand.randint(0, len(colors) - 1)
                                        selector_type = rand.randint(0, 1)
                                        selector_number = rand.randint(0, len(number) - 1)
                                        card = {"Number": number[selector_number], "Color": colors[selector_color],
                                                "Type": types[selector_type]}
                                computer_list.addLast(computer_list.List(computer_list.array), card)
                                PC_list_count = PC_list_count + 1
                        elif (user_list.get(user_list.array, choosing)["Number"] == "+4" and
                              user_list.get(user_list.array, choosing)["Color"] == 'Black' and
                              user_list.get(user_list.array, choosing)["Type"] == 'Special Card'):
                            print("Choose color from list below.")
                            print(colors)
                            chooser = input("Answer: ")
                            while True:
                                flag = False
                                for a in colors:
                                    if chooser == a:
                                        flag = True
                                        break
                                if flag:
                                    break
                                else:
                                    print("Re-select color from list below except black.")
                                    print(colors)
                                    chooser = input("Answer: ")
                            user_list.get(user_list.array, choosing)["Color"] = chooser
                            finally1 = -1
                            print("Choose the following action: ")
                            print("1. Challenge the computer.")
                            print("2. Draw 4 cards.")
                            choice = int(input("Enter number only here: "))
                            if choice == 1:
                                counter = 0
                                for b in computer_list.array:
                                    if b["Color"] == chooser:
                                        counter = counter + 1
                                if counter == 1:
                                    finally1 = 0
                                else:
                                    finally1 = 6
                            elif choice == 2:
                                finally1 = 4
                            print("You draw ", finally1, " cards.")
                            for i in range(0, finally1):
                                selector_color = rand.randint(0, len(colors) - 1)
                                selector_type = rand.randint(0, 1)
                                selector_number = rand.randint(0, len(number) - 1)
                                if colors[selector_color] == 'Black' and types[selector_type] == 'Special Card':
                                    while not (number[selector_number] is None or number[selector_number] == '+4'):
                                        selector_number = rand.randint(0, len(number) - 1)
                                    if number[selector_number] is None or number[selector_number] == '+4':
                                        card = {"Number": None, "Color": "Black", "Type": "Special Card"}
                                elif not (colors[selector_color] == 'Black') and not (
                                        types[selector_type] == 'Special Card'):
                                    if not (number[selector_number] is None or number[selector_number] == '+4'):
                                        card = {"Number": number[selector_number], "Color": colors[selector_color],
                                                "Type": types[selector_type]}
                                else:
                                    while (colors[selector_color] == 'Black' and not (
                                            types[selector_type] == 'Special Card') and not (
                                            number[selector_number] is None or number[selector_number] == '+4')) or (
                                            not (colors[selector_color] == 'Black') and types[
                                            selector_type] == 'Special Card' and (
                                            number[selector_number] is None or number[
                                            selector_number] == '+4')) or (
                                            colors[selector_color] == 'Black' and types[
                                            selector_type] == 'Special Card' and not (
                                            number[selector_number] is None or number[selector_number] == '+4')) or (
                                            colors[selector_color] == 'Black' and not (
                                            types[selector_type] == 'Special Card') and (
                                            number[selector_number] is None or number[
                                            selector_number] == '+4')) or (
                                            not (colors[selector_color] == 'Black') and not (
                                            types[selector_type] == 'Special Card') and (
                                            number[selector_number] is None or number[
                                            selector_number] == '+4')) or (
                                            not (colors[selector_color] == 'Black') and types[
                                            selector_type] == 'Special Card' and not (
                                            number[selector_number] is None or number[selector_number] == '+4')):
                                        selector_color = rand.randint(0, len(colors) - 1)
                                        selector_type = rand.randint(0, 1)
                                        selector_number = rand.randint(0, len(number) - 1)
                                        card = {"Number": number[selector_number], "Color": colors[selector_color],
                                                "Type": types[selector_type]}
                                computer_list.addLast(computer_list.List(computer_list.array), card)
                                PC_list_count = PC_list_count + 1
                        collection += (user_list.get(user_list.array, choosing),)
                        print("Deleted card: ",
                              user_list.delete(user_list.array, user_list.get(user_list.array, choosing)))
                        your_list_count = your_list_count - 1
                        print("Top of the card = ", collection[top_size], "\n")
                        top_size = top_size + 1
                        index_selector = rand.randint(0, PC_list_count - 1)
                        while ((computer_list.get(computer_list.array, index_selector)["Number"] != card["Number"]) and
                               (computer_list.get(computer_list.array, index_selector)["Color"] != card["Color"]) and
                               (computer_list.get(computer_list.array, index_selector)["Type"] != card["Type"])):
                            if ((computer_list.get(computer_list.array, index_selector)["Number"] == '+4' or
                                 computer_list.get(computer_list.array, index_selector)["Number"] is None) and
                                    computer_list.get(computer_list.array, index_selector)["Color"] == 'Black' and
                                    computer_list.get(computer_list.array, index_selector)["Type"] == 'Special Card'):
                                break
                            index_selector = rand.randint(0, PC_list_count - 1)
                        if (computer_list.get(computer_list.array, index_selector)["Number"] is None and
                                computer_list.get(computer_list.array, index_selector)["Color"] == 'Black' and
                                computer_list.get(computer_list.array, index_selector)["Type"] == 'Special Card'):
                            item_selector_1 = rand.randint(0, len(colors) - 1)
                            item_selector_2 = colors[item_selector_1]
                            while True:
                                flag = False
                                for a in colors:
                                    if item_selector_2 == a:
                                        flag = True
                                        break
                                if flag:
                                    break
                                else:
                                    item_selector_1 = rand.randint(0, len(colors) - 1)
                                    item_selector_2 = colors[item_selector_1]
                            computer_list.get(computer_list.array, index_selector)["Color"] = item_selector_2
                        elif computer_list.get(computer_list.array, index_selector)["Number"] == '+2':
                            for i in range(0, 2):
                                selector_color = rand.randint(0, len(colors) - 1)
                                selector_type = rand.randint(0, 1)
                                selector_number = rand.randint(0, len(number) - 1)
                                if colors[selector_color] == 'Black' and types[selector_type] == 'Special Card':
                                    while not (number[selector_number] is None or number[selector_number] == '+4'):
                                        selector_number = rand.randint(0, len(number) - 1)
                                    if number[selector_number] is None or number[selector_number] == '+4':
                                        card = {"Number": None, "Color": "Black", "Type": "Special Card"}
                                elif not (colors[selector_color] == 'Black') and not (
                                        types[selector_type] == 'Special Card'):
                                    if not (number[selector_number] is None or number[selector_number] == '+4'):
                                        card = {"Number": number[selector_number], "Color": colors[selector_color],
                                                "Type": types[selector_type]}
                                else:
                                    while (colors[selector_color] == 'Black' and not (
                                            types[selector_type] == 'Special Card') and not (
                                            number[selector_number] is None or number[selector_number] == '+4')) or (
                                            not (colors[selector_color] == 'Black') and types[
                                            selector_type] == 'Special Card' and (
                                            number[selector_number] is None or number[
                                            selector_number] == '+4')) or (
                                            colors[selector_color] == 'Black' and types[
                                            selector_type] == 'Special Card' and not (
                                            number[selector_number] is None or number[selector_number] == '+4')) or (
                                            colors[selector_color] == 'Black' and not (
                                            types[selector_type] == 'Special Card') and (
                                            number[selector_number] is None or number[
                                            selector_number] == '+4')) or (
                                            not (colors[selector_color] == 'Black') and not (
                                            types[selector_type] == 'Special Card') and (
                                            number[selector_number] is None or number[
                                            selector_number] == '+4')) or (
                                            not (colors[selector_color] == 'Black') and types[
                                            selector_type] == 'Special Card' and not (
                                            number[selector_number] is None or number[selector_number] == '+4')):
                                        selector_color = rand.randint(0, len(colors) - 1)
                                        selector_type = rand.randint(0, 1)
                                        selector_number = rand.randint(0, len(number) - 1)
                                        card = {"Number": number[selector_number], "Color": colors[selector_color],
                                                "Type": types[selector_type]}
                                user_list.addLast(user_list.array, card)
                                your_list_count = your_list_count + 1
                        elif (computer_list.get(computer_list.array, index_selector)["Number"] == '+4' and
                              computer_list.get(computer_list.array, index_selector)["Color"] == 'Black' and
                              computer_list.get(computer_list.array, index_selector)["Type"] == 'Special Card'):
                            item_selector_1 = rand.randint(0, len(colors) - 1)
                            item_selector_2 = colors[item_selector_1]
                            while True:
                                flag = False
                                for a in colors:
                                    if item_selector_2 == a:
                                        flag = True
                                        break
                                if flag:
                                    break
                                else:
                                    item_selector_1 = rand.randint(0, len(colors) - 1)
                                    item_selector_2 = colors[item_selector_1]
                            computer_list.get(computer_list.array, index_selector)["Color"] = item_selector_2
                            print("Computer will draw 4 cards.")
                            for i in range(0, 4):
                                selector_color = rand.randint(0, len(colors) - 1)
                                selector_type = rand.randint(0, 1)
                                selector_number = rand.randint(0, len(number) - 1)
                                if colors[selector_color] == 'Black' and types[selector_type] == 'Special Card':
                                    while not (number[selector_number] is None or number[selector_number] == '+4'):
                                        selector_number = rand.randint(0, len(number) - 1)
                                    if number[selector_number] is None or number[selector_number] == '+4':
                                        card = {"Number": None, "Color": "Black", "Type": "Special Card"}
                                elif not (colors[selector_color] == 'Black') and not (
                                        types[selector_type] == 'Special Card'):
                                    if not (number[selector_number] is None or number[selector_number] == '+4'):
                                        card = {"Number": number[selector_number], "Color": colors[selector_color],
                                                "Type": types[selector_type]}
                                else:
                                    while (colors[selector_color] == 'Black' and not (
                                            types[selector_type] == 'Special Card') and not (
                                            number[selector_number] is None or number[selector_number] == '+4')) or (
                                            not (colors[selector_color] == 'Black') and types[
                                            selector_type] == 'Special Card' and (
                                            number[selector_number] is None or number[
                                            selector_number] == '+4')) or (
                                            colors[selector_color] == 'Black' and types[
                                            selector_type] == 'Special Card' and not (
                                            number[selector_number] is None or number[selector_number] == '+4')) or (
                                            colors[selector_color] == 'Black' and not (
                                            types[selector_type] == 'Special Card') and (
                                            number[selector_number] is None or number[
                                            selector_number] == '+4')) or (
                                            not (colors[selector_color] == 'Black') and not (
                                            types[selector_type] == 'Special Card') and (
                                            number[selector_number] is None or number[
                                            selector_number] == '+4')) or (
                                            not (colors[selector_color] == 'Black') and types[
                                            selector_type] == 'Special Card' and not (
                                            number[selector_number] is None or number[selector_number] == '+4')):
                                        selector_color = rand.randint(0, len(colors) - 1)
                                        selector_type = rand.randint(0, 1)
                                        selector_number = rand.randint(0, len(number) - 1)
                                        card = {"Number": number[selector_number], "Color": colors[selector_color],
                                                "Type": types[selector_type]}
                                user_list.addLast(user_list.array, card)
                                your_list_count = your_list_count + 1
                        collection += (computer_list.delete(computer_list.array,
                                                            computer_list.get(computer_list.array, index_selector)),)
                    case _:
                        print("Your selection is not found in the menu above.")
                        print("Your cards will be sorted.")
                        print("Please! wait...")
                        if not (user_list.sorted(user_list.array)):
                            user_list.sort(user_list.array)
                        print("Your list is sorted.")
        print("Do you want to play the game again?")
        print("Yes or No.")
        answering = input("Answer: ")
        while answering != "Yes" or answering != "No":
            answering = input("Re-enter your input as \"Yes\" or \"No\":")
    print("Thank you for playing!")
    print("Goodbye!")
else:
    print("Thank you for playing!")
    print("Goodbye!")
