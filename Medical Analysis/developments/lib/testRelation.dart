// ignore_for_file: file_names

import 'dart:math';
import 'package:medical_app/patient.dart';
import 'package:medical_app/test.dart';
import 'package:flutter/material.dart';

class TestRelations {
  Patient _patient;
  Test _test;
  double _rID = 0;
  static final List<TestRelations> _testRelationList = [];

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
  static List<TestRelations> get testRelationList => _testRelationList;
}

class TestRelationList extends StatefulWidget {
  const TestRelationList({super.key});

  @override
  State<TestRelationList> createState() => _TestRelationListState();
}

class _TestRelationListState extends State<TestRelationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient-Test Relations'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: ListView.builder(
        itemCount: TestRelations.testRelationList.length,
        itemBuilder: (context, index) {
          if (TestRelations.testRelationList.isNotEmpty) {
            final relation = TestRelations.testRelationList[index];
            return ListTile(
              leading: Text(
                'ID: ${relation.theIdentification.toStringAsFixed(2)}',
              ),
              title: Text('Patient: ${relation.thePatient.pIdentity}'),
              subtitle: Text('Test: ${relation.theTest.code}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    TestRelations.testRelationList.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Relation deleted successfully!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
              ),
            );
          } else {
            return AlertDialog(
              title: const Text('No Relations Found'),
              content: const Text(
                'There are no patient-test relations to display.',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {}); // Refresh the state to show the empty list
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class TestRelationForm extends StatefulWidget {
  const TestRelationForm({super.key});

  @override
  State<TestRelationForm> createState() => _TestRelationFormState();
}

class _TestRelationFormState extends State<TestRelationForm> {
  Patient? _selectedPatient;
  Test? _selectedTest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Patient-Test Relation'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<Patient>(
              decoration: const InputDecoration(labelText: 'Select Patient'),
              items:
                  Patient.getPatients().map((patient) {
                    return DropdownMenuItem<Patient>(
                      value: patient,
                      child: Text(patient.pIdentity.toString()),
                    );
                  }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedPatient = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<Test>(
              decoration: const InputDecoration(labelText: 'Select Test'),
              items:
                  Test.theTests.map((test) {
                    return DropdownMenuItem<Test>(
                      value: test,
                      child: Text(test.code),
                    );
                  }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedTest = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_selectedPatient != null && _selectedTest != null) {
                  final newRelation = TestRelations(
                    _selectedPatient!,
                    _selectedTest!,
                  );
                  TestRelations.testRelationList.add(newRelation);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Relation added successfully!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select both a patient and a test.'),
                      backgroundColor: Colors.grey,
                    ),
                  );
                }
              },
              child: const Text('Add Relation'),
            ),
          ],
        ),
      ),
    );
  }
}
