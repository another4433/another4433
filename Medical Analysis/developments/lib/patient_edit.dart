import 'package:flutter/material.dart';
import 'package:medical_app/patient.dart';
import 'package:medical_app/case.dart';

class PatientEdit extends StatefulWidget {
  const PatientEdit({
    super.key,
    required this.selectedPatient,
    required this.theIndex,
  });

  final int theIndex;
  final Patient selectedPatient;

  @override
  State<PatientEdit> createState() => _PatientEditState();
}

class _PatientEditState extends State<PatientEdit> {
  late String name,
      id,
      nationality,
      gender,
      currency,
      bloodType,
      description,
      medication;
  final ScrollController _controller = ScrollController();
  late DateTime _birthDate;
  double money = 0, heartRate = 0, bodyTemperature = 0, bodyWeight = 0, cid = 0;
  late List<String> _theUnits = ["null", "null", "null"];
  TextEditingController dateControl = TextEditingController();
  late Case retrievedCase;

  @override
  Widget build(BuildContext context) {
    name = widget.selectedPatient.getName();
    id = widget.selectedPatient.getId();
    nationality = widget.selectedPatient.getNationality();
    gender = widget.selectedPatient.getGender();
    currency = widget.selectedPatient.getCurrency();
    bloodType = widget.selectedPatient.bloodTypeDetail;
    description = widget.selectedPatient.descriptionDetail;
    medication = widget.selectedPatient.medicationDetail;
    _birthDate = widget.selectedPatient.getBirthDate();
    _theUnits = widget.selectedPatient.unitDetails;
    money = widget.selectedPatient.getMoney();
    retrievedCase = widget.selectedPatient.caseDetail;
    heartRate = widget.selectedPatient.heartRateDetail;
    bodyTemperature = widget.selectedPatient.bodyTemperatureDetail;
    bodyWeight = widget.selectedPatient.bodyWeightDetail;
    dateControl.text = _birthDate.toString();
    cid = retrievedCase.cid!;
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient Edit Data"),
        backgroundColor: Colors.purpleAccent,
        actions: [
          IconButton(
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
                            Patient.getPatients().remove(
                              widget.selectedPatient,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "That patient has been deleted successfully!",
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (BuildContext context) => PatientList(),
                              ),
                            );
                          },
                          child: Text("Yes"),
                        ),
                        TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Failed to delete that patient!"),
                              ),
                            );
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: Text("No"),
                        ),
                      ],
                    );
                  },
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
        controller: _controller,
        thickness: 5,
        radius: Radius.circular(8),
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("ID"),
                    hintText: id,
                    icon: Icon(Icons.perm_identity),
                  ),
                  onChanged: (value) {
                    setState(() {
                      id = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Name"),
                    hintText: name,
                    icon: Icon(Icons.abc),
                  ),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Nationality"),
                    hintText: nationality,
                    icon: Icon(Icons.flag),
                  ),
                  onChanged: (value) {
                    setState(() {
                      nationality = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Gender"),
                    hintText: gender,
                    icon: Icon(Icons.male),
                  ),
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Currency"),
                    hintText: currency,
                    icon: Icon(Icons.attach_money),
                  ),
                  onChanged: (value) {
                    setState(() {
                      currency = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Money"),
                    hintText: money.toString(),
                    icon: Icon(Icons.money),
                  ),
                  onChanged: (value) {
                    setState(() {
                      money = value as double;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: dateControl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: _birthDate.toString(),
                    labelText: "Birthdate",
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
                          _birthDate = pickedDate;
                          dateControl.text =
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
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Description"),
                    hintText: description,
                    icon: Icon(Icons.text_snippet_sharp),
                  ),
                  onChanged: (value) {
                    setState(() {
                      description = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Medication"),
                    hintText: medication,
                    icon: Icon(Icons.medication_outlined),
                  ),
                  onChanged: (value) {
                    setState(() {
                      medication = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  child: ListTile(
                    title: Text("Blood Type"),
                    subtitle: Text(
                      "Select the blood type from the following: ",
                    ),
                    trailing: DropdownMenu(
                      dropdownMenuEntries: [
                        DropdownMenuEntry(value: "A", label: "A"),
                        DropdownMenuEntry(value: "A-", label: "A-"),
                        DropdownMenuEntry(value: "A+", label: "A+"),
                        DropdownMenuEntry(value: "AB", label: "AB"),
                        DropdownMenuEntry(value: "AB-", label: "AB-"),
                        DropdownMenuEntry(value: "AB+", label: "A+"),
                        DropdownMenuEntry(value: "B", label: "B"),
                        DropdownMenuEntry(value: "B-", label: "B-"),
                        DropdownMenuEntry(value: "B+", label: "B+"),
                        DropdownMenuEntry(value: "O", label: "O"),
                        DropdownMenuEntry(value: "O-", label: "O-"),
                        DropdownMenuEntry(value: "O+", label: "O+"),
                        DropdownMenuEntry(value: "none", label: "None"),
                      ],
                      onSelected: (value) => bloodType = value!,
                      initialSelection: bloodType,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Heart Rate"),
                    hintText: heartRate.toString(),
                    icon: Icon(Icons.monitor_heart),
                  ),
                  onChanged: (value) {
                    setState(() {
                      heartRate = value as double;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Heart Rate Unit"),
                    hintText: _theUnits[0],
                    icon: Icon(Icons.percent),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _theUnits[0] = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Weight"),
                    hintText: bodyWeight.toString(),
                    icon: Icon(Icons.monitor_weight_outlined),
                  ),
                  onChanged: (value) {
                    setState(() {
                      bodyWeight = value as double;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Weight Unit"),
                    hintText: _theUnits[1],
                    icon: Icon(Icons.percent),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _theUnits[1] = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Temperature"),
                    hintText: bodyTemperature.toString(),
                    icon: Icon(Icons.numbers),
                  ),
                  onChanged: (value) {
                    setState(() {
                      bodyTemperature = value as double;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Body Temperature Unit"),
                    hintText: _theUnits[2],
                    icon: Icon(Icons.percent),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _theUnits[2] = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  child: ListTile(
                    title: Text("Case Selector"),
                    subtitle: Text("Select from the following cases:"),
                    trailing: DropdownMenu(
                      dropdownMenuEntries:
                          Case.getCases().map((item) {
                            return DropdownMenuEntry(
                              value: item.cid,
                              label: item.cid.toString(),
                            );
                          }).toList(),
                      onSelected: (value) {
                        setState(() {
                          if (value != null) {
                            cid = value;
                          }
                        });
                      },
                      initialSelection: cid,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: Text("Edit Confirmation"),
                            content: Text(
                              "Are you sure you want to make these changes",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    for (Case element in Case.getCases()) {
                                      if (cid == element.cid) {
                                        retrievedCase = element;
                                        break;
                                      }
                                    }
                                    Patient retrievedPatient = Patient(
                                      name,
                                      id,
                                      _birthDate,
                                      money,
                                      currency,
                                      nationality,
                                      gender,
                                      bloodType,
                                      description,
                                      medication,
                                      bodyWeight,
                                      bodyTemperature,
                                      heartRate,
                                      _theUnits,
                                      retrievedCase,
                                    );
                                    Patient.getPatients()[widget.theIndex] =
                                        retrievedPatient;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "The data of the selected patient has been edited as per your request.",
                                        ),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (BuildContext context) =>
                                                PatientList(),
                                      ),
                                    );
                                  });
                                },
                                child: Text("Yes"),
                              ),
                              TextButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "No changes were made to the patient data!",
                                      ),
                                    ),
                                  );
                                  Navigator.pop(context);
                                },
                                child: Text("No"),
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
