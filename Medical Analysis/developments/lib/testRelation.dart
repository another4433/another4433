import 'package:medical_app/patient.dart';
import 'package:medical_app/test.dart';

class TestRelations {
  Patient _patient;
  Test _test;

  TestRelations(this._patient, this._test);

  void setPatient(Patient patient) {
    _patient = patient;
  }

  void setTest(Test test) {
    _test = test;
  }

  Patient get thePatient => _patient;
  Test get theTest => _test;
}
