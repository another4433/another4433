import 'dart:math';
import 'package:medical_app/person.dart';
import 'package:medical_app/case.dart';
import 'package:medical_app/Doctor.dart';

class Patient extends Person {
  String _bloodType = "", _description = "", _medication = "";
  double _pid = 0;
  static Random random = Random();
  double _bodyWeight = 0, _bodyTemperature = 0, _heartRate = 0;
  List<String> _units = [];
  Case _case;
  Doctor? _primaryDoctor;
  static final List<Patient> _patients = List.empty(growable: true);

  Patient(
    super._name,
    super._id,
    super._birthDate,
    super._money,
    super._currency,
    super._nationality,
    super.gender,
    this._bloodType,
    this._description,
    this._medication,
    this._bodyWeight,
    this._bodyTemperature,
    this._heartRate,
    this._units,
    this._case,
  ) {
    _pid = idGenerator();
  }

  double idGenerator() {
    return random.nextDouble();
  }

  void setBloodType(String bloodType) {
    _bloodType = bloodType;
  }

  void setDescription(String description) {
    _description = description;
  }

  void setMedication(String medication) {
    _medication = medication;
  }

  void setBodyWeight(double bodyWeight) {
    _bodyWeight = bodyWeight;
  }

  void setBodyTemperature(double bodyTemperature) {
    _bodyTemperature = bodyTemperature;
  }

  void setHeartRate(double heartRate) {
    _heartRate = heartRate;
  }

  void setUnits(List<String> units) {
    _units = units;
  }

  void setCase(Case theCase) {
    _case = theCase;
  }

  void setDoctor(Doctor doctor) {
    _primaryDoctor = doctor;
  }

  String get bloodTypeDetail => _bloodType;
  String get descriptionDetail => _description;
  String get medicationDetail => _medication;
  double get pIdentity => _pid;
  double get bodyWeightDetail => _bodyWeight;
  double get bodyTemperatureDetail => _bodyTemperature;
  double get heartRateDetail => _heartRate;
  List<String> get unitDetails => _units;
  Case get caseDetail => _case;
  Doctor? get primaryDoctor => _primaryDoctor;
  static List<Patient> getPatients() {
    return _patients;
  }
}
