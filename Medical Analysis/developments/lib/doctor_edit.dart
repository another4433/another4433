import 'package:flutter/material.dart';
import 'package:medical_app/doctor.dart';
import 'package:medical_app/patient.dart';

class DoctorEdit extends StatefulWidget {
  const DoctorEdit({super.key, required this.receivedDoctor});

  final Doctor receivedDoctor;

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
  @override
  Widget build(BuildContext context) {
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
          child: Column(children: [Text("Editing Page Under construction")]),
        ),
      ),
    );
  }
}
