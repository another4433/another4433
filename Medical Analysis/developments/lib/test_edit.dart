import 'package:flutter/material.dart';
import 'package:medical_app/test.dart';

class TestEdit extends StatefulWidget {
  const TestEdit({super.key, required this.receivedTest, required this.index});

  final int index;
  final Test receivedTest;

  @override
  State<TestEdit> createState() => _TestEditState();
}

class _TestEditState extends State<TestEdit> {
  late String _theName, _theCode, _theHospital, _unit;
  TestResult _theResult = TestResult.inconclusive;
  late DateTime _discharge, _visit;
  final ScrollController _theControl = ScrollController();
  bool critical = false, emergency = false, followUp = false, abnormal = false;
  double _value = 0, _valueLow = 0, _valueHigh = 0, _valuePrev = 0;
  final TextEditingController _controllerDate1 = TextEditingController();
  final TextEditingController _controllerDate2 = TextEditingController();
  int _roomNum = 0, _visitNum = 0;

  @override
  Widget build(BuildContext context) {
    _theName = widget.receivedTest.name;
    _theCode = widget.receivedTest.code;
    _theHospital = widget.receivedTest.hospital;
    _unit = widget.receivedTest.unit;
    _theResult = widget.receivedTest.theResults;
    _discharge = widget.receivedTest.discharged;
    _visit = widget.receivedTest.visited;
    critical = widget.receivedTest.isCritical;
    emergency = widget.receivedTest.isEmergency;
    followUp = widget.receivedTest.isFollowUp;
    abnormal = widget.receivedTest.isAbornal;
    _value = widget.receivedTest.valueNum;
    _valueLow = widget.receivedTest.valueLow;
    _valueHigh = widget.receivedTest.valueHigh;
    _valuePrev = widget.receivedTest.valuePrev;
    _roomNum = widget.receivedTest.roomNum;
    _visitNum = widget.receivedTest.visitNum;
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Data Edit"),
        backgroundColor: Colors.purpleAccent,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: Text("Confirmation"),
                        content: Text(
                          "Are you sure you want to make these changes?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Test.theTests.remove(widget.receivedTest);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "The test has been deleted successfully!",
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => TestList(),
                                ),
                              );
                            },
                            child: Text("Yes"),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Failed to delete that test!",
                                    ),
                                  ),
                                );
                                Navigator.pop(context);
                              });
                            },
                            child: Text("No"),
                          ),
                        ],
                      ),
                );
              });
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        controller: _theControl,
        thickness: 5,
        radius: Radius.circular(8),
        child: SingleChildScrollView(
          controller: _theControl,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Name"),
                    hintText: _theName,
                    icon: Icon(Icons.abc),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _theName = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Code"),
                    hintText: _theCode,
                    icon: Icon(Icons.code),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _theCode = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Hospital"),
                    hintText: _theHospital,
                    icon: Icon(Icons.local_hospital),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _theHospital = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _controllerDate1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Date Visit"),
                    hintText: _visit.toString(),
                    icon: Icon(Icons.dataset_outlined),
                  ),
                  onChanged: (value) {
                    setState(() {
                      showDatePicker(
                        context: context,
                        firstDate: DateTime(1000),
                        lastDate: DateTime(3000),
                        initialDate: DateTime.now(),
                      ).then((pickedDate) {
                        if (pickedDate != null) {
                          _visit = pickedDate;
                          _controllerDate1.text =
                              pickedDate.toIso8601String().split('T')[0];
                        }
                      });
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _controllerDate2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Date Discharge"),
                    hintText: _discharge.toString(),
                    icon: Icon(Icons.date_range_outlined),
                  ),
                  onChanged: (value) {
                    setState(() {
                      showDatePicker(
                        context: context,
                        firstDate: DateTime(1000),
                        lastDate: DateTime(3000),
                        initialDate: DateTime.now(),
                      ).then((pickedDate) {
                        if (pickedDate != null) {
                          _discharge = pickedDate;
                          _controllerDate2.text =
                              pickedDate.toIso8601String().split('T')[0];
                        }
                      });
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  child: Row(
                    children: [
                      Text("Is the test Critical?"),
                      Switch(
                        value: critical,
                        onChanged: (bool value) {
                          setState(() {
                            critical = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  child: Row(
                    children: [
                      Text("Is the test Emergency?"),
                      Switch(
                        value: emergency,
                        onChanged: (bool value) {
                          setState(() {
                            emergency = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  child: Row(
                    children: [
                      Text("Is the test Abnormal?"),
                      Switch(
                        value: abnormal,
                        onChanged: (bool value) {
                          setState(() {
                            abnormal = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  child: Row(
                    children: [
                      Text("Does the test have followups?"),
                      Switch(
                        value: followUp,
                        onChanged: (bool value) {
                          setState(() {
                            followUp = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Test Unit"),
                    hintText: _unit,
                    icon: Icon(Icons.ac_unit),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _unit = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Lowest Value"),
                    hintText: _valueLow.toString(),
                    icon: Icon(Icons.arrow_downward),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _valueLow = value as double;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Highest Value"),
                    hintText: _valueHigh.toString(),
                    icon: Icon(Icons.arrow_upward),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _valueHigh = value as double;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Current Value"),
                    hintText: _value.toString(),
                    icon: Icon(Icons.numbers),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _value = value as double;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Previous Value"),
                    hintText: _valuePrev.toString(),
                    icon: Icon(Icons.arrow_back),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _valuePrev = value as double;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  child: Column(
                    children: [
                      Text(
                        "Select the test result from the options below: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ListTile(
                        title: Text(TestResult.inconclusive.toString()),
                        leading: Radio(
                          value: TestResult.inconclusive,
                          groupValue: _theResult,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                _theResult = value;
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text(TestResult.positive.toString()),
                        leading: Radio(
                          value: TestResult.positive,
                          groupValue: _theResult,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                _theResult = value;
                              }
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text(TestResult.negative.toString()),
                        leading: Radio(
                          value: TestResult.negative,
                          groupValue: _theResult,
                          onChanged: (value) {
                            setState(() {
                              if (value != null) {
                                _theResult = value;
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Room Number"),
                    hintText: _roomNum.toString(),
                    icon: Icon(Icons.room),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _roomNum = value as int;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Visit Number"),
                    hintText: _visitNum.toString(),
                    icon: Icon(Icons.text_increase),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _visitNum = value as int;
                    });
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: Text("Confirmation"),
                            content: Text(
                              "Are you sure you want to make these changes?",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Test editedTest = Test(
                                    _theName,
                                    _theCode,
                                    _theHospital,
                                    _unit,
                                    _theResult,
                                    _discharge,
                                    _visit,
                                    critical,
                                    emergency,
                                    followUp,
                                    abnormal,
                                    _value,
                                    _valueLow,
                                    _valueHigh,
                                    _valuePrev,
                                    _roomNum,
                                    _visitNum,
                                  );
                                  Test.theTests[widget.index] = editedTest;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "The data of the selected test has been edited as per your request.",
                                      ),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (BuildContext context) => TestList(),
                                    ),
                                  );
                                },
                                child: Text("Yes"),
                              ),
                            ],
                          ),
                    );
                  });
                },
                child: Text("Confirm"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
