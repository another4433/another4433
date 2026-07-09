import 'dart:math';
import 'package:medical_app/patient.dart';
import 'package:medical_app/doctor.dart';
import 'package:flutter/material.dart';

class PeopleRelation {
  Patient _selectedPatient;
  Doctor _primaryDoctor;
  double _pID = 0;
  static final List<PeopleRelation> _relationList = [];

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
  static List<PeopleRelation> get relationList => _relationList;
}

class PeopleRelationList extends StatefulWidget {
  const PeopleRelationList({super.key});

  @override
  State<PeopleRelationList> createState() => _PeopleRelationListState();
}

class _PeopleRelationListState extends State<PeopleRelationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient-Doctor Relations'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: ListView.builder(
        itemCount: PeopleRelation.relationList.length,
        itemBuilder: (context, index) {
          if (PeopleRelation.relationList.isNotEmpty) {
            final relation = PeopleRelation.relationList[index];
            return ListTile(
              leading: Text(
                'ID: ${relation.identification.toStringAsFixed(2)}',
              ),
              title: Text('Patient: ${relation.thePatient.pIdentity}'),
              subtitle: Text('Doctor: ${relation.theDoctor.dID}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    PeopleRelation.relationList.removeAt(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Relation deleted successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  });
                },
              ),
            );
          } else {
            return AlertDialog(
              title: const Text('No Relations Found'),
              content: const Text(
                'There are no patient-doctor relations to display.',
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
      bottomSheet: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PeopleRelationForm(),
              ),
            );
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PeopleRelationForm extends StatefulWidget {
  const PeopleRelationForm({super.key});

  @override
  State<PeopleRelationForm> createState() => _PeopleRelationFormState();
}

class _PeopleRelationFormState extends State<PeopleRelationForm> {
  Patient? _selectedPatient;
  Doctor? _selectedDoctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Patient-Doctor Relation'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            DropdownButtonFormField<Doctor>(
              decoration: const InputDecoration(labelText: 'Select Doctor'),
              items:
                  Doctor.getDoctors().map((doctor) {
                    return DropdownMenuItem<Doctor>(
                      value: doctor,
                      child: Text(doctor.dID.toString()),
                    );
                  }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDoctor = value;
                });
              },
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                if (_selectedPatient != null && _selectedDoctor != null) {
                  final newRelation = PeopleRelation(
                    _selectedPatient!,
                    _selectedDoctor!,
                  );
                  PeopleRelation.relationList.add(newRelation);
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
                      content: Text(
                        'Please select both a patient and a doctor.',
                      ),
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
