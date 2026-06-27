import 'package:flutter/material.dart';
import 'package:medical_app/doctor.dart';
import 'package:medical_app/patient.dart';

class DoctorEdit extends StatefulWidget {
  const DoctorEdit({
    super.key,
    required this.receivedDoctor,
    required this.theIndex,
  });

  final Doctor receivedDoctor;
  final int theIndex;

  @override
  State<DoctorEdit> createState() => _DoctorEditState();
}

class _DoctorEditState extends State<DoctorEdit> {
  final ScrollController _scrollController = ScrollController();
  late String name,
      id,
      nationality,
      gender,
      branch,
      workEmail,
      workPhone,
      currency;
  double money = 0, patientID = 0;
  DateTime? birthDate;
  DoctorSpecialty specialiazation = DoctorSpecialty.none;
  TextEditingController birthController = TextEditingController();
  String selecting = "None";
  List<bool> selections = [false, false, false];
  int selectedIndex = -1;
  Patient? selectedPatient;
  Doctor? newDoctor;
  @override
  Widget build(BuildContext context) {
    name = widget.receivedDoctor.getName();
    id = widget.receivedDoctor.getId();
    nationality = widget.receivedDoctor.getNationality();
    gender = widget.receivedDoctor.getGender();
    branch = widget.receivedDoctor.branch;
    workEmail = widget.receivedDoctor.workEmail;
    workPhone = widget.receivedDoctor.workPhone;
    currency = widget.receivedDoctor.getCurrency();
    money = widget.receivedDoctor.getMoney();
    birthDate = widget.receivedDoctor.getBirthDate();
    specialiazation = widget.receivedDoctor.specialization;
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor Data Edit Page"),
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
                            Doctor.getDoctors().remove(widget.receivedDoctor);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "That doctor has been deleted successfully!",
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => DoctorList(),
                              ),
                            );
                          },
                          child: Text("Yes"),
                        ),
                        TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Failed to delete that doctor!"),
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
        controller: _scrollController,
        thickness: 5,
        radius: Radius.circular(8),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("ID"),
                      icon: Icon(Icons.perm_identity),
                      hintText: id,
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
                      icon: Icon(Icons.text_format_outlined),
                      hintText: name,
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
                      icon: Icon(Icons.flag),
                      hintText: nationality,
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
                      icon: Icon(Icons.male),
                      hintText: gender,
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
                      icon: Icon(Icons.percent),
                      hintText: currency,
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
                      icon: Icon(Icons.attach_money),
                      hintText: money.toString(),
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Branch"),
                      icon: Icon(Icons.work),
                      hintText: branch,
                    ),
                    onChanged: (value) {
                      setState(() {
                        branch = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Work Email"),
                      icon: Icon(Icons.email),
                      hintText: workEmail,
                    ),
                    onChanged: (value) {
                      setState(() {
                        workEmail = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("ID"),
                      icon: Icon(Icons.phone),
                      hintText: workPhone,
                    ),
                    onChanged: (value) {
                      setState(() {
                        workPhone = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: birthController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Birthdate"),
                      icon: Icon(Icons.date_range_outlined),
                      hintText: birthDate.toString(),
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
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
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ToggleButtons(
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
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    child: Column(
                      children: [
                        ListTile(
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
                        TextButton(
                          onPressed: () {
                            setState(() {
                              bool found = false;
                              for (Patient thePatient
                                  in widget.receivedDoctor.accessPatients) {
                                if (thePatient.pIdentity == patientID) {
                                  selectedPatient = thePatient;
                                  found = true;
                                  break;
                                }
                                if (found) {
                                  widget.receivedDoctor.accessPatients.add(
                                    selectedPatient!,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "A patient has been assigned to the doctor.",
                                      ),
                                    ),
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Adding Patient Failed"),
                                        content: Text(
                                          "An error occured preventing the patient to be assigned to the doctor.",
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
                                }
                              }
                            });
                          },
                          child: Text("Add Patient"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
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
                                    newDoctor = Doctor(
                                      name,
                                      id,
                                      birthDate!,
                                      money,
                                      currency,
                                      nationality,
                                      gender,
                                      specialiazation,
                                      branch,
                                      workEmail,
                                      workPhone,
                                    );
                                    for (Patient thePatient
                                        in widget
                                            .receivedDoctor
                                            .accessPatients) {
                                      newDoctor!.accessPatients.add(thePatient);
                                    }
                                    Doctor.getDoctors()[widget.theIndex] =
                                        newDoctor!;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "The data of the selected doctor has been edited as per your request.",
                                        ),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (BuildContext context) =>
                                                DoctorList(),
                                      ),
                                    );
                                  },
                                  child: Text("Yes"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Changes were not applied to that doctor because they were aborted by your request.",
                                        ),
                                      ),
                                    );
                                    Navigator.pop(context);
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
