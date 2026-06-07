// ignore_for_file: file_names

import 'dart:math';
import 'patient.dart';
import 'test.dart';
import 'package:flutter/material.dart';

class TestRelations {
  Patient _patient;
  Test _test;
  double _rID = 0;

  TestRelations(this._patient, this._test) {
    _rID = calculateID();
  }

  void setPatient(Patient patient) {
    _patient = patient;
  }

  void setTest(Test test) {
    _test = test;
  }

  double calculateID() {
    return Random().nextDouble();
  }

  Patient get thePatient => _patient;
  Test get theTest => _test;
  double get theIdentification => _rID;
}

class TestRelationList extends StatefulWidget {
  const TestRelationList({super.key});

  @override
  State<TestRelationList> createState() => _TestRelationListState();
}

class _TestRelationListState extends State<TestRelationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
