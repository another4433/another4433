enum TestResult { positive, negative, inconclusive }

enum TheTrend { increasing, decreasing, stable, firstObservation }

class Test {
  String name, code, hospital, unit;
  TestResult result = TestResult.inconclusive;
  TheTrend trend = TheTrend.firstObservation;
  DateTime discharge, visit;
  bool isCritical = false,
      isEmergency = false,
      isFollowUp = false,
      isAbnormal = false;
  double valueNum = 0, valueLow = 0, valueHigh = 0, valuePrev = 0;
  double delta = 0, range = 0;
  int roomNum, visitNum;

  Test(
    this.name,
    this.code,
    this.hospital,
    this.unit,
    this.result,
    this.discharge,
    this.visit,
    this.isCritical,
    this.isEmergency,
    this.isFollowUp,
    this.isAbnormal,
    this.valueNum,
    this.valueLow,
    this.valueHigh,
    this.valuePrev,
    this.roomNum,
    this.visitNum,
  ) {
    if (delta > 0) {
      trend = TheTrend.increasing;
    } else if (delta < 0) {
      trend = TheTrend.decreasing;
    } else {
      trend = TheTrend.stable;
    }
    result = (range > 0) ? TestResult.positive : TestResult.negative;
    delta = valueNum - valuePrev;
    range = valueHigh - valueLow;
  }
}
