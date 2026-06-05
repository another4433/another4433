import 'package:flutter/material.dart';

enum TestResult { positive, negative, inconclusive }

enum TheTrend { increasing, decreasing, stable, firstObservation }

class Test {
  String _name, _code, _hospital, _unit;
  TestResult _result = TestResult.inconclusive;
  TheTrend _trend = TheTrend.firstObservation;
  DateTime _discharge, _visit;
  bool _isCritical = false,
      _isEmergency = false,
      _isFollowUp = false,
      _isAbnormal = false;
  double _valueNum = 0, _valueLow = 0, _valueHigh = 0, _valuePrev = 0;
  double _delta = 0, _range = 0;
  int _roomNum, _visitNum;

  Test(
    this._name,
    this._code,
    this._hospital,
    this._unit,
    this._result,
    this._discharge,
    this._visit,
    this._isCritical,
    this._isEmergency,
    this._isFollowUp,
    this._isAbnormal,
    this._valueNum,
    this._valueLow,
    this._valueHigh,
    this._valuePrev,
    this._roomNum,
    this._visitNum,
  ) {
    if (_delta > 0) {
      _trend = TheTrend.increasing;
    } else if (_delta < 0) {
      _trend = TheTrend.decreasing;
    } else {
      _trend = TheTrend.stable;
    }
    _result = (_range > 0) ? TestResult.positive : TestResult.negative;
    _delta = _valueNum - _valuePrev;
    _range = _valueHigh - _valueLow;
  }

  void setName(String name) {
    _name = name;
  }

  void setCode(String code) {
    _code = code;
  }

  void setHospital(String hospital) {
    _hospital = hospital;
  }

  void setUnit(String unit) {
    _unit = unit;
  }

  void setResult(TestResult result) {
    _result = result;
  }

  void setTrend(TheTrend trend) {
    _trend = trend;
  }

  void setDischarge(DateTime discharge) {
    _discharge = discharge;
  }

  void setVisit(DateTime visit) {
    _visit = visit;
  }

  void setEmergency(bool emergency) {
    _isEmergency = emergency;
  }

  void setCritical(bool critical) {
    _isCritical = critical;
  }

  void setAbnormal(bool abnormal) {
    _isAbnormal = abnormal;
  }

  void setFollowUp(bool followup) {
    _isFollowUp = followup;
  }

  void setValueNum(double valueNum) {
    _valueNum = valueNum;
  }

  void setValueHigh(double valueHigh) {
    _valueHigh = valueHigh;
  }

  void setValueLow(double valueLow) {
    _valueLow = valueLow;
  }

  void setValuePrev(double valuePrev) {
    _valuePrev = valuePrev;
  }

  void recalculateDelta() {
    _delta = valueNum - valuePrev;
  }

  void recalculateRange() {
    _range = valueHigh - valueLow;
  }

  void setRoomNum(int roomNum) {
    _roomNum = roomNum;
  }

  void setVisitNum(int visitNum) {
    _visitNum = visitNum;
  }

  String get name => _name;
  String get code => _code;
  String get hospital => _hospital;
  String get unit => _unit;
  bool get isAbornal => _isAbnormal;
  bool get isCritical => _isCritical;
  bool get isEmergency => _isEmergency;
  bool get isFollowUp => _isFollowUp;
  double get valueNum => _valueNum;
  double get valueLow => _valueLow;
  double get valueHigh => _valueHigh;
  double get valuePrev => _valuePrev;
  double get theDelta => _delta;
  double get theRange => _range;
  DateTime get discharged => _discharge;
  DateTime get visited => _visit;
  int get roomNum => _roomNum;
  int get visitNum => _visitNum;
  TestResult get theResults => _result;
  TheTrend get theTrend => _trend;
}

class TestList extends StatefulWidget {
  const TestList({super.key});

  @override
  State<TestList> createState() => _TestListState();
}

class _TestListState extends State<TestList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
