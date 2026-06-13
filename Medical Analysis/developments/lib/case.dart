import 'dart:math';
import 'package:flutter/material.dart';

class Case {
  String _allergy, _symptom, _condition, _hospital, _diagnosis;
  DateTime _discover;
  double? cid;
  bool _cureavailable = false;
  static Random random = Random();
  static final List<Case> _cases = List.empty(growable: true);

  Case(
    this._allergy,
    this._symptom,
    this._condition,
    this._hospital,
    this._diagnosis,
    this._discover,
    this._cureavailable,
  ) {
    cid = idGenerator();
  }

  double idGenerator() {
    return random.nextDouble();
  }

  void setAllergy(String allergy) {
    _allergy = allergy;
  }

  void setSymptom(String symptom) {
    _symptom = symptom;
  }

  void setCondition(String condition) {
    _condition = condition;
  }

  void setHospital(String hospital) {
    _hospital = hospital;
  }

  void setDiagnosis(String diagnosis) {
    _diagnosis = diagnosis;
  }

  void setCureAvailable(bool cureAvailable) {
    _cureavailable = cureAvailable;
  }

  void setDiscover(DateTime discover) {
    _discover = discover;
  }

  String get allergy => _allergy;
  String get symptom => _symptom;
  String get condition => _condition;
  String get hospital => _hospital;
  String get disgnosis => _diagnosis;
  bool get isCureAvailable => _cureavailable;
  DateTime get discovery => _discover;
  static List<Case> getCases() {
    return _cases;
  }
}

class CaseList extends StatefulWidget {
  const CaseList({super.key});

  @override
  State<CaseList> createState() => _CaseListState();
}

class _CaseListState extends State<CaseList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Cases"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: ListView.builder(
        itemCount: Case.getCases().length,
        itemBuilder: (context, index) {
          if (Case.getCases().isNotEmpty) {
            return Card(
              child: ListTile(
                leading: Text(Case.getCases()[index].cid.toString()),
                title: Text(
                  "Discovered on ${Case.getCases()[index].discovery} at ${Case.getCases()[index].hospital}",
                ),
                subtitle: Text(
                  "Cure availability = ${Case.getCases()[index].isCureAvailable} with symptom ${Case.getCases()[index].symptom}",
                ),
              ),
            );
          }
          return AlertDialog(
            title: Text("Empty List"),
            content: Text("There are no data found in the cases list."),
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
              MaterialPageRoute(builder: (BuildContext context) => CaseData()),
            );
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CaseData extends StatefulWidget {
  const CaseData({super.key});

  @override
  State<CaseData> createState() => _CaseDataState();
}

class _CaseDataState extends State<CaseData> {
  TextEditingController symptomControl = TextEditingController();
  TextEditingController conditionControl = TextEditingController();
  TextEditingController allergyControl = TextEditingController();
  TextEditingController hospitalControl = TextEditingController();
  TextEditingController diagnoseControl = TextEditingController();
  TextEditingController dateControl = TextEditingController();
  DateTime? actualDate;
  bool thecure = false;
  final ScrollController _scrollController = ScrollController();
  GlobalKey<FormState> theKey = GlobalKey<FormState>();

  void _submitForm() {
    if (!theKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Cannot submit form unless all fields contains a value",
          ),
        ),
      );
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Form Submission Failed"),
            content: Text(
              "Empty fields were found that prevent this form to be submitted.",
            ),
            icon: Icon(Icons.event_busy),
          );
        },
      );
    } else {
      theKey.currentState!.save();
      Case theCase = Case(
        allergyControl.text,
        symptomControl.text,
        conditionControl.text,
        hospitalControl.text,
        diagnoseControl.text,
        actualDate!,
        thecure,
      );
      Case.getCases().add(theCase);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Case data created successfully!")),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Cases"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        trackVisibility: true,
        thickness: 5,
        radius: Radius.circular(8),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: symptomControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Symptom"),
                    hintText: "Enter the symptom for the case",
                  ),
                  validator: (value) => "Please enter a symptom",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: conditionControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Condition"),
                    hintText: "Enter the condition of the case",
                  ),
                  validator: (value) => "Please enter a condition",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: hospitalControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Hospital"),
                    hintText: "Enter the hospital the case was discovered",
                  ),
                  validator: (value) => "Please enter a hospital",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: diagnoseControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Diagnosis"),
                    hintText: "Enter the diagnosis for the case",
                  ),
                  validator: (value) => "Please enter a diagnose",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: allergyControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Allergy"),
                    hintText: "Any Allergies? What is it?",
                  ),
                  validator: (value) => "Just type yes or no",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Is the cure available?"),
                    ),
                    Switch(
                      value: thecure,
                      onChanged: (value) {
                        setState(() {
                          thecure = value;
                        });
                      },
                      padding: EdgeInsets.all(8),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: dateControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Discovery"),
                    hintText: "Enter a date for case discovery",
                  ),
                  validator: (value) => "Please enter a date",
                  onChanged: (value) {
                    setState(() {
                      showDatePicker(
                        context: context,
                        firstDate: DateTime(1000),
                        lastDate: DateTime(3000),
                        initialDate: DateTime.now(),
                      ).then((pickedDate) {
                        actualDate = pickedDate;
                        dateControl.text =
                            pickedDate!.toIso8601String().split('T')[0];
                      });
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _submitForm();
                    });
                  },
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
