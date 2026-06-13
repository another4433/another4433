import 'package:flutter/material.dart';
import 'package:medical_app/case.dart';

class CaseEdit extends StatefulWidget {
  const CaseEdit({
    super.key,
    required this.retrievedCase,
    required this.theIndex,
  });

  final int theIndex;
  final Case retrievedCase;

  @override
  State<CaseEdit> createState() => _CaseEditState();
}

class _CaseEditState extends State<CaseEdit> {
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

  @override
  Widget build(BuildContext context) {
    symptomControl.text = widget.retrievedCase.symptom;
    conditionControl.text = widget.retrievedCase.condition;
    allergyControl.text = widget.retrievedCase.allergy;
    hospitalControl.text = widget.retrievedCase.hospital;
    diagnoseControl.text = widget.retrievedCase.disgnosis;
    actualDate = widget.retrievedCase.discovery;
    thecure = widget.retrievedCase.isCureAvailable;
    return Scaffold(
      appBar: AppBar(
        title: Text("Case Data Edit"),
        backgroundColor: Colors.purpleAccent,
        actions: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Case Delete Confirmation"),
                      content: Text("Are you sure that you want to delete?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              Case.getCases().remove(widget.retrievedCase);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Case data deleted successfully!",
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => CaseList(),
                                ),
                              );
                            });
                          },
                          child: Text("Yes"),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: Text("No"),
                        ),
                      ],
                    );
                  },
                );
              });
            },
            child: Icon(Icons.delete),
          ),
        ],
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
                child: TextField(
                  controller: symptomControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Symptom"),
                    hintText: symptomControl.text,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: conditionControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Condition"),
                    hintText: conditionControl.text,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: hospitalControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Hospital"),
                    hintText: hospitalControl.text,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: diagnoseControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Diagnosis"),
                    hintText: diagnoseControl.text,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: allergyControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Allergy"),
                    hintText: allergyControl.text,
                  ),
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
                    hintText: actualDate.toString(),
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
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Confirmation"),
                          content: Text(
                            "Are you sure you want to make these changes?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  Case theCase = Case(
                                    allergyControl.text,
                                    symptomControl.text,
                                    conditionControl.text,
                                    hospitalControl.text,
                                    diagnoseControl.text,
                                    actualDate!,
                                    thecure,
                                  );
                                  Case.getCases()[widget.theIndex] = theCase;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "The data of the selected case has been edited as per your request.",
                                      ),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (BuildContext context) => CaseList(),
                                    ),
                                  );
                                });
                              },
                              child: Text("Yes"),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "No changes were made to that case data!",
                                      ),
                                    ),
                                  );
                                  Navigator.pop(context);
                                });
                              },
                              child: Text("No"),
                            ),
                          ],
                        );
                      },
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
