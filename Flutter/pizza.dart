import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'firebase.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDsuTpekSZFyQyQB0Pao2090sVqYB4r7Jc",
      projectId: firebaseConfig.projectId,
      messagingSenderId: firebaseConfig.messagingSenderId,
      appId: "1:824820585467:android:ac7d948266f268d259f15e",
    ),
  );
  runApp(const MyPizza());
}

class MyPizza extends StatelessWidget {
  const MyPizza({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AQWE Pizza',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lime),
      ),
      home: const OrderPizza(),
    );
  }
}

class Pizza {
  String size, crust, drink;
  List<String> toppings = [];
  bool spicy;

  Pizza(this.size, this.crust, this.spicy, this.drink);
  static List<Pizza?> pizzaList = [];
}

class NoSQLDBPizza {
  static Future<void> addPizza(
    drink,
    theSizer,
    crustValue,
    isSpicy,
    toppings,
    context,
  ) async {
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection("aqwe-pizza");
    DocumentReference docRef = collectionReference.doc();
    Map<String, dynamic> dbItem = {
      "Drink": drink,
      "Size": theSizer,
      "Crust": crustValue,
      "Spicy?": isSpicy,
      "Toppings": toppings,
    };
    await docRef.set(dbItem);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("The restaurant has received your order.")),
    );
  }
}

enum TheSizes { small, medium, large }

class OrderPizza extends StatefulWidget {
  const OrderPizza({super.key});

  @override
  State<OrderPizza> createState() => _OrderPizzaState();
}

class _OrderPizzaState extends State<OrderPizza> {
  TheSizes? _sizes;
  List<String> theCrusts = [];
  String crustValue = "", theSizer = "", drink = "";
  TextEditingController crustControl = TextEditingController();
  bool isCheesy = false, hasOlives = false, hasPep = false, isSpicy = false;
  bool hasOnion = false, hasTomato = false, hasPepper = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order Pizza"), backgroundColor: Colors.lime),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Select Pizza Size: "),
                  ListTile(
                    title: Text("Small"),
                    leading: Radio(
                      value: TheSizes.small,
                      groupValue: _sizes,
                      onChanged: (value) {
                        setState(() {
                          if (value != null) {
                            _sizes = value;
                          }
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text("Medium"),
                    leading: Radio(
                      value: TheSizes.medium,
                      groupValue: _sizes,
                      onChanged: (value) {
                        setState(() {
                          if (value != null) {
                            _sizes = value;
                          }
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text("Large"),
                    leading: Radio(
                      value: TheSizes.large,
                      groupValue: _sizes,
                      onChanged: (value) {
                        setState(() {
                          if (value != null) {
                            _sizes = value;
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: ListTile(
                leading: Text("Select Crust: "),
                trailing: DropdownMenu(
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: "Thin", label: "Thin"),
                    DropdownMenuEntry(value: "Thick", label: "Thick"),
                    DropdownMenuEntry(value: "Stuffed", label: "Stuffed"),
                  ],
                  controller: crustControl,
                ),
              ),
            ),
            Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Select Topping: "),
                  ListTile(
                    leading: Text("Cheese"),
                    trailing: Checkbox(
                      value: isCheesy,
                      onChanged: (value) {
                        setState(() {
                          if (value != null) {
                            isCheesy = value;
                          } else {
                            isCheesy = false;
                          }
                        });
                      },
                    ),
                  ),
                  ListTile(
                    leading: Text("Olives"),
                    trailing: Checkbox(
                      value: hasOlives,
                      onChanged: (value) {
                        setState(() {
                          if (value != null) {
                            hasOlives = value;
                          } else {
                            hasOlives = false;
                          }
                        });
                      },
                    ),
                  ),
                  ListTile(
                    leading: Text("Pepperoni"),
                    trailing: Checkbox(
                      value: hasPep,
                      onChanged: (value) {
                        setState(() {
                          if (value != null) {
                            hasPep = value;
                          } else {
                            hasPep = false;
                          }
                        });
                      },
                    ),
                  ),
                  ListTile(
                    leading: Text("Onion"),
                    trailing: Checkbox(
                      value: hasOnion,
                      onChanged: (value) {
                        setState(() {
                          if (value != null) {
                            hasOnion = value;
                          } else {
                            hasOnion = false;
                          }
                        });
                      },
                    ),
                  ),
                  ListTile(
                    leading: Text("Tomato"),
                    trailing: Checkbox(
                      value: hasTomato,
                      onChanged: (value) {
                        setState(() {
                          if (value != null) {
                            hasTomato = value;
                          } else {
                            hasTomato = false;
                          }
                        });
                      },
                    ),
                  ),
                  ListTile(
                    leading: Text("Green Pepper"),
                    trailing: Checkbox(
                      value: hasPepper,
                      onChanged: (value) {
                        setState(() {
                          if (value != null) {
                            hasPepper = value;
                          } else {
                            hasPepper = false;
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Choose your drink: "),
                  DropdownMenu(
                    initialSelection: drink,
                    dropdownMenuEntries: [
                      DropdownMenuEntry(value: "Water", label: "Water"),
                      DropdownMenuEntry(
                        value: "Pepsi",
                        label: "Black Soft Drink",
                      ),
                      DropdownMenuEntry(
                        value: "Cola",
                        label: "Brown Soft Drink",
                      ),
                      DropdownMenuEntry(
                        value: "Miranda Orange",
                        label: "Orange Soft Drink",
                      ),
                      DropdownMenuEntry(
                        value: "Kinza Berry",
                        label: "Purple Soft Drink",
                      ),
                      DropdownMenuEntry(
                        value: "Lemonita",
                        label: "Lime Soft Drink",
                      ),
                      DropdownMenuEntry(
                        value: "Orange Juice",
                        label: "Orange Juice",
                      ),
                      DropdownMenuEntry(value: "7up", label: "Sparkling Water"),
                      DropdownMenuEntry(
                        value: "Lemon Juice",
                        label: "Lemon Juice",
                      ),
                      DropdownMenuEntry(
                        value: "Apple Juice",
                        label: "Apple Juice",
                      ),
                      DropdownMenuEntry(
                        value: "Kiwi Juice",
                        label: "Kiwi Juice",
                      ),
                      DropdownMenuEntry(
                        value: "Mixed Berry Juice",
                        label: "Mixed Berry Juice",
                      ),
                    ],
                    onSelected: (value) {
                      setState(() {
                        if (value != null) {
                          drink = value;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Spicy?"),
                  Switch(
                    value: isSpicy,
                    onChanged: (value) {
                      setState(() {
                        isSpicy = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  crustValue = crustControl.text;
                  if (_sizes == TheSizes.small) {
                    theSizer = "Small";
                  } else if (_sizes == TheSizes.medium) {
                    theSizer = "Medium";
                  } else {
                    theSizer = "Large";
                  }
                  Pizza theItem = Pizza(theSizer, crustValue, isSpicy, drink);
                  if (theItem.toppings.isNotEmpty) {
                    theItem.toppings.clear();
                  }
                  if (isCheesy) {
                    theItem.toppings.add("Cheese");
                  }
                  if (hasOlives) {
                    theItem.toppings.add("Olives");
                  }
                  if (hasPep) {
                    theItem.toppings.add("Pepperoni");
                  }
                  if (hasOnion) {
                    theItem.toppings.add("Onion");
                  }
                  if (hasPepper) {
                    theItem.toppings.add("Green Pepper");
                  }
                  if (hasTomato) {
                    theItem.toppings.add("Tomato");
                  }
                  Pizza.pizzaList.add(theItem);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "An item has been added to the list and sent to the restaurant.",
                      ),
                    ),
                  );
                  NoSQLDBPizza.addPizza(
                    drink,
                    theSizer,
                    crustValue,
                    isSpicy,
                    theItem.toppings,
                    context,
                  );
                });
              },
              child: Text("Add to Cart"),
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Items Added: ${Pizza.pizzaList.length}"),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PizzaList()),
                        );
                      });
                    },
                    icon: Icon(Icons.shopping_cart_checkout),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PizzaList extends StatefulWidget {
  const PizzaList({super.key});

  @override
  State<PizzaList> createState() => _PizzaListState();
}

class _PizzaListState extends State<PizzaList> {
  String theToppings = "";
  String theSpicy = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AQWE Pizza List"),
        backgroundColor: Colors.limeAccent,
      ),
      body: ListView.builder(
        itemCount: Pizza.pizzaList.length,
        itemBuilder: (context, index) {
          theToppings = "";
          for (String item in Pizza.pizzaList[index]!.toppings) {
            theToppings += "$item\t";
          }
          if (Pizza.pizzaList[index]!.spicy) {
            theSpicy = "Is Spicy";
          } else {
            theSpicy = "Is Not Spicy";
          }
          return Card(
            color: Colors.pinkAccent,
            child: ListTile(
              title: Text(
                "(${index + 1}) Pizza: ${Pizza.pizzaList[index]!.size} ${Pizza.pizzaList[index]!.crust}",
              ),
              subtitle: Text("$theToppings + ${Pizza.pizzaList[index]!.drink}"),
              leading: IconButton(
                onPressed: () {
                  setState(() {
                    Pizza.pizzaList.removeAt(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "An item has been deleted or removed from the list, but the restaurant still have your order.",
                        ),
                      ),
                    );
                  });
                },
                icon: Icon(Icons.delete),
              ),
              trailing: Text(theSpicy),
            ),
          );
        },
      ),
    );
  }
}
