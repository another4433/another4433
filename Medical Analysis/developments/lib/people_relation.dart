import 'package:medical_app/patient.dart';
import 'package:medical_app/doctor.dart';

class PeopleRelation {
  Patient _selectedPatient;
  Doctor _primaryDoctor;

  PeopleRelation(this._selectedPatient, this._primaryDoctor);

  void setPatient(Patient patient) {
    _selectedPatient = patient;
  }

  void setDoctor(Doctor doctor) {
    _primaryDoctor = doctor;
  }

  Patient get thePatient => _selectedPatient;
  Doctor get theDoctor => _primaryDoctor;
}
