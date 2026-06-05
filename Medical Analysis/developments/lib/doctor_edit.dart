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
  String? name, id, nationality, gender, branch, workEmail, workPhone, currency;
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
      ),
      body: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        controller: _scrollController,
        thickness: 5,
        radius: Radius.circular(8),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              TextField(
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
              TextField(
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
              TextField(
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
              TextField(
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
              TextField(
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
              TextField(
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
              TextField(
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
              TextField(
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
              TextField(
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
              TextField(
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
            ],
          ),
        ),
      ),
    );
  }
}
