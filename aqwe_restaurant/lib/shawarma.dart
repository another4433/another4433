import 'dart:math';
import 'package:flutter/material.dart';
import 'firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: firebaseConfig.apiKey,
      projectId: firebaseConfig.projectId,
      messagingSenderId: firebaseConfig.messagingSenderId,
      appId: firebaseConfig.appId,
    ),
  );
  runApp(const MyShawarma());
}

class NoSQLDBBurger {
  static Future<void> addFood(
    isSpicy,
    isCheesy,
    isCrunchy,
    isOily,
    hasMayo,
    hasKetchup,
    hasMustard,
    chooseDrink,
    context,
    name,
    bread,
    type,
    toppings,
  ) async {
    CollectionReference collectionReference = FirebaseFirestore.instance
        .collection("aqwe-shawarma");
    DocumentReference docRef = collectionReference.doc();
    Map<String, dynamic> dbItem = {
      "Name": name,
      "Type": type,
      "Bread": bread,
      "Drink": chooseDrink,
      "Cheesy?": isCheesy,
      "Crunchy?": isCrunchy,
      "Include Ketchup?": hasKetchup,
      "Include Mayo?": hasMayo,
      "Include Mustard?": hasMustard,
      "Oily?": isOily,
      "Spicy?": isSpicy,
      "Toppings": toppings,
    };
    await docRef.set(dbItem);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("The restaurant has received your order.")),
    );
  }
}

class MyShawarma extends StatelessWidget {
  const MyShawarma({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AQWE Shawarma',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.limeAccent),
      ),
      home: const AddShawarma(),
    );
  }
}

class ShawarmaStates {
  bool isSpicy, isCheesy, isCrunchy, isOily, hasMayo, hasKetchup, hasMustard;
  String chooseDrink;

  ShawarmaStates(
    this.isSpicy,
    this.isCheesy,
    this.isCrunchy,
    this.isOily,
    this.hasMayo,
    this.hasKetchup,
    this.hasMustard,
    this.chooseDrink,
  );
}

class Shawarma extends ShawarmaStates {
  String name = "", type = "", bread = "";
  List<String> theToppings = [];

  Shawarma(
    this.name,
    this.type,
    this.bread,
    bool isSpicy,
    bool isCheesy,
    bool isCrunchy,
    bool isOily,
    bool hasMayo,
    bool hasKetchup,
    bool hasMustard,
    String chooseDrink,
  ) : super(
        isSpicy,
        isCheesy,
        isCrunchy,
        isOily,
        hasMayo,
        hasKetchup,
        hasMustard,
        chooseDrink,
      );

  static List<Shawarma> theList = [];
}

class AddShawarma extends StatefulWidget {
  const AddShawarma({super.key});

  @override
  State<AddShawarma> createState() => _AddShawarmaState();
}

class _AddShawarmaState extends State<AddShawarma> {
  final GlobalKey<FormState> _shawarmaForm = GlobalKey<FormState>();
  final TextEditingController _shawarmaName = TextEditingController();
  final TextEditingController _shawarmaBread = TextEditingController();
  final ScrollController _scrollBar = ScrollController();
  bool spice = false, cheese = false, crunch = false, oil = false;
  bool mayo = false, ketchup = false, mustard = false;
  bool potato = false, tomato = false, pickle = false, lettuce = false;
  bool onion = false, olives = false, beans = false, ginger = false;
  bool carrot = false, bell = false, pepper = false, chips = false;
  String shawarmaName = "", meatType = "", breadType = "", drink = "";
  List<String> otherMeat = ["Crab", "Lobster", "Octopus", "Alligator", "Snake"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Shawarma"),
        backgroundColor: Colors.lime,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShawarmaList()),
                );
              });
            },
            icon: Icon(Icons.list),
          ),
        ],
      ),
      body: Form(
        key: _shawarmaForm,
        child: Scrollbar(
          thumbVisibility: true,
          trackVisibility: true,
          thickness: 5,
          radius: Radius.circular(5),
          scrollbarOrientation: ScrollbarOrientation.right,
          interactive: true,
          controller: _scrollBar,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: TextFormField(
                    controller: _shawarmaName,
                    decoration: InputDecoration(
                      label: Text("Name"),
                      hintText: "Give a name for your shawarma",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => "Name field is empty",
                    onSaved: (newValue) {
                      setState(() {
                        shawarmaName = _shawarmaName.text;
                      });
                    },
                  ),
                ),
                Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Select the type of the meat for your shawarma: "),
                      ListTile(
                        title: Text("Meat"),
                        leading: Radio(
                          value: "Meat",
                          groupValue: meatType,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                meatType = "Meat";
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("Chicken"),
                        leading: Radio(
                          value: "Chicken",
                          groupValue: meatType,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                meatType = value;
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("Fish"),
                        leading: Radio(
                          value: "Fish",
                          groupValue: meatType,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                meatType = value;
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("Shrimp"),
                        leading: Radio(
                          value: "Shrimp",
                          groupValue: meatType,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                meatType = value;
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("None of the above"),
                        subtitle: Text("Random choice meat"),
                        leading: Radio(
                          value:
                              otherMeat[Random().nextInt(otherMeat.length - 1)],
                          groupValue: meatType,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                meatType = value;
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: _shawarmaBread,
                    decoration: InputDecoration(
                      label: Text("Bread Type"),
                      hintText: "Enter the bread type you know",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => "Do not leave the field empty!",
                    onSaved: (newValue) {
                      setState(() {
                        breadType = _shawarmaBread.text;
                      });
                    },
                  ),
                ),
                Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Select the following toppings for your shawarma: "),
                      ListTile(
                        title: Text("Potato"),
                        trailing: Checkbox(
                          value: potato,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                potato = value;
                              } else {
                                potato = false;
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("Lettuce"),
                        trailing: Checkbox(
                          value: lettuce,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                lettuce = value;
                              } else {
                                lettuce = false;
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("Tomato"),
                        trailing: Checkbox(
                          value: tomato,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                tomato = value;
                              } else {
                                tomato = false;
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("Pickle"),
                        trailing: Checkbox(
                          value: pickle,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                pickle = value;
                              } else {
                                pickle = false;
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("Onion"),
                        trailing: Checkbox(
                          value: onion,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                onion = value;
                              } else {
                                onion = false;
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("Olives"),
                        trailing: Checkbox(
                          value: olives,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                olives = value;
                              } else {
                                olives = false;
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("Beans"),
                        trailing: Checkbox(
                          value: beans,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                beans = value;
                              } else {
                                beans = false;
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("Carrot"),
                        trailing: Checkbox(
                          value: carrot,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                carrot = value;
                              } else {
                                carrot = false;
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("Jalapeño"),
                        subtitle: Text("Halapenio"),
                        trailing: Checkbox(
                          value: pepper,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                pepper = value;
                              } else {
                                pepper = false;
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("Bell Pepper"),
                        trailing: Checkbox(
                          value: bell,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                bell = value;
                              } else {
                                bell = false;
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("Ginger"),
                        trailing: Checkbox(
                          value: ginger,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                ginger = value;
                              } else {
                                ginger = false;
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text("Chips"),
                        trailing: Checkbox(
                          value: chips,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                chips = value;
                              } else {
                                chips = false;
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
                          DropdownMenuEntry(
                            value: "7up",
                            label: "Sparkling Water",
                          ),
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
                        value: spice,
                        onChanged: (value) {
                          setState(() {
                            spice = value;
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
                      Text("Cheesy?"),
                      Switch(
                        value: cheese,
                        onChanged: (value) {
                          setState(() {
                            cheese = value;
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
                      Text("Crunchy?"),
                      Switch(
                        value: crunch,
                        onChanged: (value) {
                          setState(() {
                            crunch = value;
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
                      Text("Oily?"),
                      Switch(
                        value: oil,
                        onChanged: (value) {
                          setState(() {
                            oil = value;
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
                      Text("Include Mayoneese?"),
                      Switch(
                        value: mayo,
                        onChanged: (value) {
                          setState(() {
                            mayo = value;
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
                      Text("Include Ketchup?"),
                      Switch(
                        value: ketchup,
                        onChanged: (value) {
                          setState(() {
                            ketchup = value;
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
                      Text("Include Mustard?"),
                      Switch(
                        value: mustard,
                        onChanged: (value) {
                          setState(() {
                            mustard = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _shawarmaForm.currentState!.save();
              Shawarma theFood = Shawarma(
                shawarmaName,
                meatType,
                breadType,
                spice,
                cheese,
                crunch,
                oil,
                mayo,
                ketchup,
                mustard,
                drink,
              );
              if (theFood.theToppings.isNotEmpty) {
                theFood.theToppings.clear();
              }
              if (potato) {
                theFood.theToppings.add("Potato");
              }
              if (lettuce) {
                theFood.theToppings.add("Lettuce");
              }
              if (beans) {
                theFood.theToppings.add("Beans");
              }
              if (bell) {
                theFood.theToppings.add("Bell Pepper");
              }
              if (pepper) {
                theFood.theToppings.add("Jalapeño");
              }
              if (chips) {
                theFood.theToppings.add("Chips");
              }
              if (carrot) {
                theFood.theToppings.add("Carrot");
              }
              if (cheese) {
                theFood.theToppings.add("Cheese");
              }
              if (ginger) {
                theFood.theToppings.add("Ginger");
              }
              if (pickle) {
                theFood.theToppings.add("Pickle");
              }
              if (onion) {
                theFood.theToppings.add("Onion");
              }
              if (olives) {
                theFood.theToppings.add("Oilves");
              }
              if (tomato) {
                theFood.theToppings.add("Tomato");
              }
              Shawarma.theList.add(theFood);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "An item has been added to the list and it has been sent to the restaurant.",
                  ),
                ),
              );
              NoSQLDBBurger.addFood(
                spice,
                cheese,
                crunch,
                oil,
                mayo,
                ketchup,
                mustard,
                drink,
                context,
                shawarmaName,
                breadType,
                meatType,
                theFood.theToppings,
              );
              _shawarmaForm.currentState!.reset();
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class ShawarmaList extends StatefulWidget {
  const ShawarmaList({super.key});

  @override
  State<ShawarmaList> createState() => _ShawarmaListState();
}

class _ShawarmaListState extends State<ShawarmaList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shawarma List"),
        backgroundColor: Colors.lime,
      ),
      body: ListView.builder(
        itemCount: Shawarma.theList.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 80,
            child: Card(
              color: Colors.pinkAccent,
              child: ListTile(
                title: Text(
                  "(${index + 1}) ${Shawarma.theList[index].type} Shawarma",
                ),
                subtitle: Text(Shawarma.theList[index].chooseDrink),
                leading: IconButton(
                  onPressed: () {
                    setState(() {
                      Shawarma.theList.removeAt(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "An item has been deleted or removed from the list. The restaurant still has your order.",
                          ),
                        ),
                      );
                    });
                  },
                  icon: Icon(Icons.delete),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => ThatToppings(theIndex: index),
                            ),
                          );
                        });
                      },
                      icon: Icon(Icons.shopping_cart_checkout),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ThatToppings extends StatefulWidget {
  const ThatToppings({super.key, required this.theIndex});
  final int theIndex;
  @override
  State<ThatToppings> createState() => _ThatToppingsState();
}

class _ThatToppingsState extends State<ThatToppings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Toppings of ${Shawarma.theList[widget.theIndex].name}"),
        backgroundColor: Colors.lime,
      ),
      body: ListView.builder(
        itemCount: Shawarma.theList[widget.theIndex].theToppings.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.pinkAccent,
            child: ListTile(
              leading: Text("(${index + 1})"),
              title: Text(Shawarma.theList[widget.theIndex].theToppings[index]),
            ),
          );
        },
      ),
    );
  }
}
