import 'dart:math';
import 'patient.dart';
import 'doctor.dart';
import 'package:flutter/material.dart';

class PeopleRelation {
  Patient _selectedPatient;
  Doctor _primaryDoctor;
  double _pID = 0;

  PeopleRelation(this._selectedPatient, this._primaryDoctor) {
    _pID = generateID();
  }

  void setPatient(Patient patient) {
    _selectedPatient = patient;
  }

  void setDoctor(Doctor doctor) {
    _primaryDoctor = doctor;
  }

  double generateID() {
    return Random().nextDouble();
  }

  Patient get thePatient => _selectedPatient;
  Doctor get theDoctor => _primaryDoctor;
  double get identification => _pID;
}

class PeopleRelationList extends StatefulWidget {
  const PeopleRelationList({super.key});

  @override
  State<PeopleRelationList> createState() => _PeopleRelationListState();
}

class _PeopleRelationListState extends State<PeopleRelationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
