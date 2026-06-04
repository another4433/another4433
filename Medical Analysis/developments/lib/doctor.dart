// ignore_for_file: file_names
import 'package:medical_app/person.dart';
import 'package:medical_app/patient.dart';
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
