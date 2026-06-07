import 'package:flutter/material.dart';
import 'doctor_edit.dart';
import 'person.dart';
import 'patient.dart';
import 'dart:math';

enum DoctorSpecialty {
  generalPractitioner,
  cardiologist,
  dermatologist,
  pediatrician,
  neurologist,
  psychiatrist,
  orthopedicSurgeon,
  gynecologist,
  urologist,
  oncologist,
  ordinary,
  assistant,
  none,
}

class Doctor extends Person {
  String _branch, _workEmail, _workPhone;
  double _dID = 0;
  static Random random = Random();
  final List<Patient> _patients = [];
  static final List<Doctor> _doctors = List.empty(growable: true);
  DoctorSpecialty _specialization = DoctorSpecialty.none;

  Doctor(
    super._name,
    super._id,
    super._birthDate,
    super._money,
    super._currency,
    super._nationality,
    super._gender,
    this._specialization,
    this._branch,
    this._workEmail,
    this._workPhone,
  ) {
    _dID = idGenerator();
  }

  double idGenerator() {
    return random.nextDouble();
  }

  void setSpecialization(DoctorSpecialty specialization) {
    _specialization = specialization;
  }

  void setBranch(String branch) {
    _branch = branch;
  }

  void setWorkEmail(String email) {
    _workEmail = email;
  }

  void setWorkPhone(String phone) {
    _workPhone = phone;
  }

  DoctorSpecialty get specialization => _specialization;
  String get branch => _branch;
  String get workEmail => _workEmail;
  String get workPhone => _workPhone;
  List<Patient> get accessPatients => _patients;
  double get dID => _dID;
  static List<Doctor> getDoctors() {
    return _doctors;
  }
}

class DoctorList extends StatefulWidget {
  const DoctorList({super.key});

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Doctors"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: Doctor.getDoctors().length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Text(Doctor.getDoctors()[index].dID.toString()),
              title: Text(
                "${Doctor.getDoctors()[index].getName()} is ${Doctor.getDoctors()[index].getNationality()}",
              ),
              subtitle: Text(
                "Aged ${Doctor.getDoctors()[index].getAge()} that is known for ${Doctor.getDoctors()[index].specialization}",
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (BuildContext context) => DoctorEdit(
                              receivedDoctor: Doctor.getDoctors()[index],
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
        },
      ),
      bottomSheet: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => DoctorData(),
              ),
            );
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class DoctorData extends StatefulWidget {
  const DoctorData({super.key});
  @override
  State<DoctorData> createState() => _DoctorDataState();
}

class _DoctorDataState extends State<DoctorData> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? name, id, nationality, gender, branch, workEmail, workPhone, currency;
  double money = 0, patientID = 0;
  DateTime? birthDate;
  DoctorSpecialty specialiazation = DoctorSpecialty.none;
  TextEditingController birthController = TextEditingController();
  Doctor? _theDoctor;
  String selecting = "None";
  List<bool> selections = [false, false, false];
  int selectedIndex = -1;
  Patient? selectedPatient;

  void submitForm() {
    if (!_formKey.currentState!.validate()) {
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
        builder: (context) {
          return AlertDialog(
            title: Text("Form Submission Failed"),
            content: Text(
              "Empty field were found that prevents this form to be submitted.",
            ),
            icon: Icon(Icons.event_busy),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      _formKey.currentState!.save();
      _theDoctor = Doctor(
        name!,
        id!,
        birthDate!,
        money,
        currency!,
        nationality!,
        gender!,
        specialiazation,
        branch!,
        workEmail!,
        workPhone!,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Successfully created doctor data!"),
          backgroundColor: Colors.green,
        ),
      );
      if (selecting == "Yes") {
        for (Patient thePatient in Patient.getPatients()) {
          if (patientID != 0 && thePatient.pIdentity == patientID) {
            selectedPatient = thePatient;
          }
        }
        if (selectedPatient != null) {
          _theDoctor!.accessPatients.add(selectedPatient!);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("A patient has been assigned to a doctor.")),
          );
        }
      }
      Doctor.getDoctors().add(_theDoctor!);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Successfully added doctor to the list!"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    }
    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Doctor Data"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        trackVisibility: true,
        radius: Radius.circular(8),
        thickness: 5,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter the ID of the doctor",
                      labelText: "ID",
                      icon: Icon(Icons.perm_identity_outlined),
                    ),
                    onChanged: (value) {
                      setState(() {
                        id = value;
                      });
                    },
                    validator: (value) => "Field is empty! Please enter the id",
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter the Name of the doctor",
                      labelText: "Name",
                      icon: Icon(Icons.text_rotation_none_outlined),
                    ),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    validator: (value) => "Field is empty! Please enter name.",
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter the Nationality of the doctor",
                      labelText: "Nationality",
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
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter the Gender of the doctor",
                      labelText: "Gender",
                      icon: Icon(Icons.male),
                    ),
                    onChanged: (value) {
                      setState(() {
                        gender = value;
                      });
                    },
                    validator: (value) => "Field is empty! Please enter gender",
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText:
                          "Enter the branch of the hospital the doctor work in",
                      labelText: "Hospital Branch",
                      icon: Icon(Icons.work),
                    ),
                    onChanged: (value) {
                      setState(() {
                        branch = value;
                      });
                    },
                    validator: (value) => "Field is empty! Please enter branch",
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter the work phone number of the doctor",
                      labelText: "Phone Number",
                      icon: Icon(Icons.phone),
                    ),
                    onChanged: (value) {
                      setState(() {
                        workPhone = value;
                      });
                    },
                    validator:
                        (value) =>
                            "Field is empty! Please enter the phone number of the doctor.",
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter the work Email of the doctor",
                      labelText: "Email",
                      icon: Icon(Icons.email),
                    ),
                    onChanged: (value) {
                      setState(() {
                        workEmail = value;
                      });
                    },
                    validator: (value) => "Field is empty! Please enter email.",
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter the currency of money the doctor use",
                      labelText: "Money Currency",
                      icon: Icon(Icons.percent),
                    ),
                    onChanged: (value) {
                      setState(() {
                        currency = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter the amount of money the doctor have",
                      labelText: "Money Amount",
                      icon: Icon(Icons.attach_money),
                    ),
                    onChanged: (value) {
                      setState(() {
                        money = value as double;
                      });
                    },
                  ),
                  TextFormField(
                    controller: birthController,
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
                            birthDate = pickedDate;
                            birthController.text =
                                pickedDate.toIso8601String().split('T')[0];
                          }
                        });
                      });
                    },
                    validator:
                        (value) =>
                            "Field is empty! Please enter the birthdate of the doctor.",
                  ),
                  Card(
                    child: Column(
                      children: [
                        Text(
                          "Select the specialization of the doctor below: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ListTile(
                          title: Text(DoctorSpecialty.cardiologist.toString()),
                          leading: Radio(
                            value: DoctorSpecialty.cardiologist,
                            groupValue: specialiazation,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  specialiazation = value;
                                }
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(DoctorSpecialty.dermatologist.toString()),
                          leading: Radio(
                            value: DoctorSpecialty.dermatologist,
                            groupValue: specialiazation,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  specialiazation = value;
                                }
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(
                            DoctorSpecialty.generalPractitioner.toString(),
                          ),
                          leading: Radio(
                            value: DoctorSpecialty.generalPractitioner,
                            groupValue: specialiazation,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  specialiazation = value;
                                }
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(DoctorSpecialty.gynecologist.toString()),
                          leading: Radio(
                            value: DoctorSpecialty.gynecologist,
                            groupValue: specialiazation,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  specialiazation = value;
                                }
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(DoctorSpecialty.neurologist.toString()),
                          leading: Radio(
                            value: DoctorSpecialty.neurologist,
                            groupValue: specialiazation,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  specialiazation = value;
                                }
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(DoctorSpecialty.oncologist.toString()),
                          leading: Radio(
                            value: DoctorSpecialty.oncologist,
                            groupValue: specialiazation,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  specialiazation = value;
                                }
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(
                            DoctorSpecialty.orthopedicSurgeon.toString(),
                          ),
                          leading: Radio(
                            value: DoctorSpecialty.orthopedicSurgeon,
                            groupValue: specialiazation,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  specialiazation = value;
                                }
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(DoctorSpecialty.pediatrician.toString()),
                          leading: Radio(
                            value: DoctorSpecialty.pediatrician,
                            groupValue: specialiazation,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  specialiazation = value;
                                }
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(DoctorSpecialty.psychiatrist.toString()),
                          leading: Radio(
                            value: DoctorSpecialty.psychiatrist,
                            groupValue: specialiazation,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  specialiazation = value;
                                }
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(DoctorSpecialty.assistant.toString()),
                          leading: Radio(
                            value: DoctorSpecialty.assistant,
                            groupValue: specialiazation,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  specialiazation = value;
                                }
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(DoctorSpecialty.ordinary.toString()),
                          leading: Radio(
                            value: DoctorSpecialty.ordinary,
                            groupValue: specialiazation,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  specialiazation = value;
                                }
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(DoctorSpecialty.urologist.toString()),
                          leading: Radio(
                            value: DoctorSpecialty.urologist,
                            groupValue: specialiazation,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  specialiazation = value;
                                }
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(DoctorSpecialty.none.toString()),
                          leading: Radio(
                            value: DoctorSpecialty.none,
                            groupValue: specialiazation,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  specialiazation = value;
                                }
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  ToggleButtons(
                    isSelected: selections,
                    onPressed: (index) {
                      setState(() {
                        selections[index] = !selections[index];
                        if (selectedIndex > -1) {
                          selections[selectedIndex] =
                              !selections[selectedIndex];
                        }
                        if (index == 0) {
                          selecting = "Yes";
                        } else if (index == 1) {
                          selecting = "No";
                        } else if (index == 2) {
                          selecting = "Maybe";
                        }
                        selectedIndex = index;
                      });
                    },
                    children: [Text("Yes"), Text("No"), Text("Maybe")],
                  ),
                  Card(
                    child: ListTile(
                      title: Text("Patient List Starter"),
                      subtitle: Text(
                        "Choose from the followings to add a patient (If you selected \"Yes\"): ",
                      ),
                      trailing: DropdownMenu(
                        dropdownMenuEntries:
                            Patient.getPatients().map((item) {
                              return DropdownMenuEntry(
                                value: item.pIdentity,
                                label: item.pIdentity.toString(),
                              );
                            }).toList(),
                        onSelected: (value) {
                          setState(() {
                            if (value != null) {
                              patientID = value;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        submitForm();
                      });
                    },
                    child: Text("Submit"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
