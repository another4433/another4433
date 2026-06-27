import 'dart:math';
import 'package:medical_app/person.dart';
import 'package:medical_app/case.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/patient_edit.dart';

class Patient extends Person {
  String _bloodType = "", _description = "", _medication = "";
  double _pid = 0;
  static Random random = Random();
  double _bodyWeight = 0, _bodyTemperature = 0, _heartRate = 0;
  List<String> _units = [];
  Case _case;
  static final List<Patient> _patients = List.empty(growable: true);

  Patient(
    super._name,
    super._id,
    super._birthDate,
    super._money,
    super._currency,
    super._nationality,
    super.gender,
    this._bloodType,
    this._description,
    this._medication,
    this._bodyWeight,
    this._bodyTemperature,
    this._heartRate,
    this._units,
    this._case,
  ) {
    _pid = idGenerator();
  }

  double idGenerator() {
    return random.nextDouble();
  }

  void setBloodType(String bloodType) {
    _bloodType = bloodType;
  }

  void setDescription(String description) {
    _description = description;
  }

  void setMedication(String medication) {
    _medication = medication;
  }

  void setBodyWeight(double bodyWeight) {
    _bodyWeight = bodyWeight;
  }

  void setBodyTemperature(double bodyTemperature) {
    _bodyTemperature = bodyTemperature;
  }

  void setHeartRate(double heartRate) {
    _heartRate = heartRate;
  }

  void setUnits(List<String> units) {
    _units = units;
  }

  void setCase(Case theCase) {
    _case = theCase;
  }

  String get bloodTypeDetail => _bloodType;
  String get descriptionDetail => _description;
  String get medicationDetail => _medication;
  double get pIdentity => _pid;
  double get bodyWeightDetail => _bodyWeight;
  double get bodyTemperatureDetail => _bodyTemperature;
  double get heartRateDetail => _heartRate;
  List<String> get unitDetails => _units;
  Case get caseDetail => _case;
  static List<Patient> getPatients() {
    return _patients;
  }
}

class PatientList extends StatefulWidget {
  const PatientList({super.key});

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Patients"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: ListView.builder(
        itemCount: Patient.getPatients().length,
        itemBuilder: (context, index) {
          if (Patient.getPatients().isNotEmpty) {
            return Card(
              child: ListTile(
                leading: Text(Patient.getPatients()[index].getId()),
                title: Text(Patient.getPatients()[index].getName()),
                subtitle: Text(Patient.getPatients()[index].descriptionDetail),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (BuildContext context) => PatientEdit(
                                selectedPatient: Patient.getPatients()[index],
                                theIndex: index,
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
            content: Text("There are no data found in the patient list."),
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
              MaterialPageRoute(
                builder: (BuildContext context) => PatientData(),
              ),
            );
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class PatientData extends StatefulWidget {
  const PatientData({super.key});

  @override
  State<PatientData> createState() => _PatientDataState();
}

class _PatientDataState extends State<PatientData> {
  late String name,
      id,
      nationality,
      gender,
      currency,
      bloodType,
      description,
      medication;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final ScrollController _controller = ScrollController();
  DateTime? _birthDate;
  double money = 0, heartRate = 0, bodyTemperature = 0, bodyWeight = 0, cid = 0;
  final List<String> _theUnits = ["null", "null", "null"];
  TextEditingController dateControl = TextEditingController();

  void _submitForm() {
    if (!_key.currentState!.validate()) {
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
      _key.currentState!.save();
      Case? selectedCase;
      for (Case theCase in Case.getCases()) {
        if (cid == theCase.cid) {
          selectedCase = theCase;
          break;
        }
      }
      Patient thePatient = Patient(
        name,
        id,
        _birthDate!,
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
        selectedCase!,
      );
      Patient.getPatients().add(thePatient);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Successfully added a patient!"),
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
        title: Text("Add Patient Data"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        thickness: 5,
        controller: _controller,
        radius: Radius.circular(8),
        child: SingleChildScrollView(
          controller: _controller,
          child: Form(
            key: _key,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("ID"),
                      hintText: "Enter the ID of the patient",
                      icon: Icon(Icons.perm_identity),
                    ),
                    onChanged: (value) {
                      setState(() {
                        id = value;
                      });
                    },
                    validator: (value) => "Field is empty! Please enter the ID",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Name"),
                      hintText: "Enter the name of the patient",
                      icon: Icon(Icons.abc),
                    ),
                    onChanged: (value) {
                      setState(() {
                        name = value;
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
                      label: Text("Nationality"),
                      hintText: "Enter the nationality of the patient",
                      icon: Icon(Icons.flag),
                    ),
                    onChanged: (value) {
                      setState(() {
                        nationality = value;
                      });
                    },
                    validator:
                        (value) =>
                            "Field is empty! Please enter the nationality.",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Gender"),
                      hintText: "Enter the gender of the patient",
                      icon: Icon(Icons.male),
                    ),
                    onChanged: (value) {
                      setState(() {
                        gender = value;
                      });
                    },
                    validator: (value) => "Field is empty! Please enter gender",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Currency"),
                      hintText: "Enter the currency of the patient",
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
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Money"),
                      hintText: "Enter the money of the patient",
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
                  child: TextFormField(
                    controller: dateControl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter the birthdate as (yyyy-mm-dd)",
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
                    validator:
                        (value) => "Field is empty! Please enter the date",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Description"),
                      hintText: "Enter the description of the patient",
                      icon: Icon(Icons.text_snippet_sharp),
                    ),
                    onChanged: (value) {
                      setState(() {
                        description = value;
                      });
                    },
                    validator:
                        (value) =>
                            "Field is empty! Please enter the description.",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Medication"),
                      hintText: "Enter the medication of the patient",
                      icon: Icon(Icons.medication_outlined),
                    ),
                    onChanged: (value) {
                      setState(() {
                        medication = value;
                      });
                    },
                    validator:
                        (value) => "Field is empty! Please enter medication.",
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
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Heart Rate"),
                      hintText: "Enter the heart rate of the patient",
                      icon: Icon(Icons.monitor_heart),
                    ),
                    onChanged: (value) {
                      setState(() {
                        heartRate = value as double;
                      });
                    },
                    validator:
                        (value) =>
                            "Field is empty! Please enter the heart rate.",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Heart Rate Unit"),
                      hintText: "Enter the heart rate unit of the patient",
                      icon: Icon(Icons.percent),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _theUnits[0] = value;
                      });
                    },
                    validator:
                        (value) =>
                            "Field is empty! Please enter the heart rate unit.",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Weight"),
                      hintText: "Enter the weight of the patient",
                      icon: Icon(Icons.monitor_weight_outlined),
                    ),
                    onChanged: (value) {
                      setState(() {
                        bodyWeight = value as double;
                      });
                    },
                    validator:
                        (value) => "Field is empty! Please enter weight.",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Weight Unit"),
                      hintText: "Enter the weight unit of the patient",
                      icon: Icon(Icons.percent),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _theUnits[1] = value;
                      });
                    },
                    validator:
                        (value) =>
                            "Field is empty! Please enter the body weight unit.",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    child: Column(
                      children: [
                        Text(
                          "Move the slider below to indicate the body temperature of the patient: ",
                        ),
                        Slider(
                          min: 0,
                          max: 300,
                          divisions: 100,
                          value: bodyTemperature,
                          onChanged: (value) {
                            setState(() {
                              bodyTemperature = value;
                            });
                          },
                        ),
                        Text(bodyTemperature.toString()),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Body Temperature Unit"),
                      hintText: "Enter body temperature unit of the patient",
                      icon: Icon(Icons.percent),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _theUnits[2] = value;
                      });
                    },
                    validator:
                        (value) =>
                            "Field is empty! Please enter the body temperature unit.",
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
                      ),
                    ),
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
      ),
    );
  }
}
