import 'package:flutter/material.dart';
import 'package:medical_app/test_edit.dart';

enum TestResult { positive, negative, inconclusive }

enum TheTrend { increasing, decreasing, stable, firstObservation }

class Test {
  String _name, _code, _hospital, _unit;
  TestResult _result = TestResult.inconclusive;
  TheTrend _trend = TheTrend.firstObservation;
  DateTime _discharge, _visit;
  bool _isCritical = false,
      _isEmergency = false,
      _isFollowUp = false,
      _isAbnormal = false;
  double _valueNum = 0, _valueLow = 0, _valueHigh = 0, _valuePrev = 0;
  double _delta = 0, _range = 0;
  int _roomNum, _visitNum;
  static final List<Test> _listTest = List.empty(growable: true);

  Test(
    this._name,
    this._code,
    this._hospital,
    this._unit,
    this._result,
    this._discharge,
    this._visit,
    this._isCritical,
    this._isEmergency,
    this._isFollowUp,
    this._isAbnormal,
    this._valueNum,
    this._valueLow,
    this._valueHigh,
    this._valuePrev,
    this._roomNum,
    this._visitNum,
  ) {
    if (_delta > 0) {
      _trend = TheTrend.increasing;
    } else if (_delta < 0) {
      _trend = TheTrend.decreasing;
    } else {
      _trend = TheTrend.stable;
    }
    _result = (_range > 0) ? TestResult.positive : TestResult.negative;
    _delta = _valueNum - _valuePrev;
    _range = _valueHigh - _valueLow;
  }

  void setName(String name) {
    _name = name;
  }

  void setCode(String code) {
    _code = code;
  }

  void setHospital(String hospital) {
    _hospital = hospital;
  }

  void setUnit(String unit) {
    _unit = unit;
  }

  void setResult(TestResult result) {
    _result = result;
  }

  void setTrend(TheTrend trend) {
    _trend = trend;
  }

  void setDischarge(DateTime discharge) {
    _discharge = discharge;
  }

  void setVisit(DateTime visit) {
    _visit = visit;
  }

  void setEmergency(bool emergency) {
    _isEmergency = emergency;
  }

  void setCritical(bool critical) {
    _isCritical = critical;
  }

  void setAbnormal(bool abnormal) {
    _isAbnormal = abnormal;
  }

  void setFollowUp(bool followup) {
    _isFollowUp = followup;
  }

  void setValueNum(double valueNum) {
    _valueNum = valueNum;
  }

  void setValueHigh(double valueHigh) {
    _valueHigh = valueHigh;
  }

  void setValueLow(double valueLow) {
    _valueLow = valueLow;
  }

  void setValuePrev(double valuePrev) {
    _valuePrev = valuePrev;
  }

  void recalculateDelta() {
    _delta = valueNum - valuePrev;
  }

  void recalculateRange() {
    _range = valueHigh - valueLow;
  }

  void setRoomNum(int roomNum) {
    _roomNum = roomNum;
  }

  void setVisitNum(int visitNum) {
    _visitNum = visitNum;
  }

  String get name => _name;
  String get code => _code;
  String get hospital => _hospital;
  String get unit => _unit;
  bool get isAbornal => _isAbnormal;
  bool get isCritical => _isCritical;
  bool get isEmergency => _isEmergency;
  bool get isFollowUp => _isFollowUp;
  double get valueNum => _valueNum;
  double get valueLow => _valueLow;
  double get valueHigh => _valueHigh;
  double get valuePrev => _valuePrev;
  double get theDelta => _delta;
  double get theRange => _range;
  DateTime get discharged => _discharge;
  DateTime get visited => _visit;
  int get roomNum => _roomNum;
  int get visitNum => _visitNum;
  TestResult get theResults => _result;
  TheTrend get theTrend => _trend;
  static List<Test> get theTests => _listTest;
}

class TestList extends StatefulWidget {
  const TestList({super.key});

  @override
  State<TestList> createState() => _TestListState();
}

class _TestListState extends State<TestList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Tests"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: ListView.builder(
        itemCount: Test.theTests.length,
        itemBuilder: (context, index) {
          if (Test.theTests.isNotEmpty) {
            return Card(
              child: ListTile(
                leading: Text(Test.theTests[index].code),
                title: Text("Name: ${Test.theTests[index].name}"),
                subtitle: Text(
                  "Result: ${Test.theTests[index].theResults},  Trend: ${Test.theTests[index].theTrend}",
                ),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (BuildContext context) => TestEdit(
                                receivedTest: Test.theTests[index],
                                index: index,
                              ),
                        ),
                      );
                    });
                  },
                  icon: Icon(Icons.edit),
                ),
              ),
            );
          }
          return AlertDialog(
            title: Text("Empty List"),
            content: Text("There are no data found in the test list."),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      ),
      bottomSheet: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => TestData()),
            );
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TestData extends StatefulWidget {
  const TestData({super.key});

  @override
  State<TestData> createState() => _TestDataState();
}

class _TestDataState extends State<TestData> {
  late String _theName, _theCode, _theHospital, _unit;
  TestResult _theResult = TestResult.inconclusive;
  late DateTime _discharge, _visit;
  final GlobalKey<FormState> _theKey = GlobalKey<FormState>();
  final ScrollController _theControl = ScrollController();
  bool critical = false, emergency = false, followUp = false, abnormal = false;
  double _value = 0, _valueLow = 0, _valueHigh = 0, _valuePrev = 0;
  final TextEditingController _controllerDate1 = TextEditingController();
  final TextEditingController _controllerDate2 = TextEditingController();
  int _roomNum = 0, _visitNum = 0;

  void _submitForm() {
    if (!_theKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Cannot submit form unless all fields contains a value.",
          ),
          backgroundColor: Colors.red,
        ),
      );
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text("Form Submission Failed"),
              content: Text(
                "Empty fields were found that prevents this form to be submitted.",
              ),
              icon: Icon(Icons.event_busy),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("OK"),
                ),
              ],
            ),
      );
    } else {
      _theKey.currentState!.save();
      final Test theTest = Test(
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
      Test.theTests.add(theTest);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Successfully added a test!"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Test Data"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        controller: _theControl,
        thickness: 5,
        radius: Radius.circular(8),
        child: SingleChildScrollView(
          controller: _theControl,
          child: Form(
            key: _theKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Name"),
                      hintText: "Enter the name of the test",
                      icon: Icon(Icons.abc),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _theName = value;
                      });
                    },
                    validator: (value) => "Field is empty! Please enter name.",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Code"),
                      hintText: "Enter the code of the test",
                      icon: Icon(Icons.code),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _theCode = value;
                      });
                    },
                    validator: (value) => "Field is empty! Please enter code.",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Hospital"),
                      hintText: "Enter the hospital of the test taken in",
                      icon: Icon(Icons.local_hospital),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _theHospital = value;
                      });
                    },
                    validator:
                        (value) =>
                            "Field is empty! Please enter the hospital place of the test.",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: _controllerDate1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Date Visit"),
                      hintText: "Enter the date the patient visit for the test",
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
                    validator: (value) => "Field is empty! Enter any date.",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: _controllerDate2,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Date Discharge"),
                      hintText:
                          "Enter the date the patient was discharged from the test.",
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
                    validator: (value) => "Field is empty! Enter any date.",
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
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Test Unit"),
                      hintText: "Enter the unit of the test values to be used",
                      icon: Icon(Icons.ac_unit),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _unit = value;
                      });
                    },
                    validator: (value) => "Field is empty! Please enter units.",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Lowest Value"),
                      hintText:
                          "Enter the minimum value of the test as numbers",
                      icon: Icon(Icons.arrow_downward),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _valueLow = value as double;
                      });
                    },
                    validator: (value) => "Field is empty! Enter any number.",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Highest Value"),
                      hintText:
                          "Enter the maximum value of the test as numbers",
                      icon: Icon(Icons.arrow_upward),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _valueHigh = value as double;
                      });
                    },
                    validator: (value) => "Field is empty! Enter any number.",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Current Value"),
                      hintText: "Enter the value set for the test as numbers",
                      icon: Icon(Icons.numbers),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _value = value as double;
                      });
                    },
                    validator: (value) => "Field is empty! Enter any number.",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Previous Value"),
                      hintText:
                          "Enter the previous value of the test as numbers",
                      icon: Icon(Icons.arrow_back),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _valuePrev = value as double;
                      });
                    },
                    validator: (value) => "Field is empty! Enter any number.",
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
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Room Number"),
                      hintText: "Enter the room of the test located as number",
                      icon: Icon(Icons.room),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _roomNum = value as int;
                      });
                    },
                    validator: (value) => "Field is empty! Enter any number.",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Visit Number"),
                      hintText: "Enter the number of visits count of the test",
                      icon: Icon(Icons.text_increase),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _visitNum = value as int;
                      });
                    },
                    validator: (value) => "Field is empty! Enter any number.",
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _submitForm();
                    });
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
