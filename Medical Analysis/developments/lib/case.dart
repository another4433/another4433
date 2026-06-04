import 'dart:math';

class Case {
  String _allergy, _symptom, _condition, _hospital, _diagnosis;
  DateTime _discover;
  double? cid;
  bool _cureavailable = false;
  static Random random = Random();
  static final List<Case> _cases = List.empty(growable: true);

  Case(
    this._allergy,
    this._symptom,
    this._condition,
    this._hospital,
    this._diagnosis,
    this._discover,
    this._cureavailable,
  ) {
    cid = idGenerator();
  }

  double idGenerator() {
    return random.nextDouble();
  }

  void setAllergy(String allergy) {
    _allergy = allergy;
  }

  void setSymptom(String symptom) {
    _symptom = symptom;
  }

  void setCondition(String condition) {
    _condition = condition;
  }

  void setHospital(String hospital) {
    _hospital = hospital;
  }

  void setDiagnosis(String diagnosis) {
    _diagnosis = diagnosis;
  }

  void setCureAvailable(bool cureAvailable) {
    _cureavailable = cureAvailable;
  }

  void setDiscover(DateTime discover) {
    _discover = discover;
  }

  String get allergy => _allergy;
  String get symptom => _symptom;
  String get condition => _condition;
  String get hospital => _hospital;
  String get disgnosis => _diagnosis;
  bool get isCureAvailable => _cureavailable;
  DateTime get discovery => _discover;
  static List<Case> getCases() {
    return _cases;
  }
}
