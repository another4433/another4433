using System;

public enum TestResult
{
    Normal,
    Abnormal,
    Critical,
    Inconclusive,
    Pending
}

public enum Trend
{
    Increasing, // Greater than 0 less than 1
    Decreasing, // Less than 0 greater than -1
    Stable, // Equal to 0
    Fluctuating, // Greater than or equal to 1 or less than or equal to -1
    First_Observation // No values to compare
}

public class Test
{
    private TestResult TestResult;
    private DateTime Discharge, VisitDate;
    private int RoomNum, VisitNum;
    private string Hospital, TestName, TestCode, Unit;
    private float ValueNum, ValueLow, ValueHigh, ValuePrev;
    private bool IsAbnormal, IsCritical;
    private readonly float Delta;
    private Trend ResultTrend;
    private Patient Patient = new Patient();
    public Test()
	{
        TestResult = TestResult.Normal;
        ResultTrend = Trend.First_Observation;
        Discharge = VisitDate = DateTime.MinValue;
        RoomNum = VisitNum = 0;
        Hospital = TestName = TestCode = Unit = string.Empty;
        ValueNum = ValueLow = ValueHigh = ValuePrev = 0.0f;
        IsAbnormal = IsCritical = false;
        Delta = 0.01f; // Default delta for trend analysis
    }
    public Test(string testResult, DateTime discharge, DateTime visitDate, int roomNum, int visitNum, string hospital, string testName, string testCode, string unit, float valueNum, float valueLow, float valueHigh, float valuePrev, Patient patient)
    {
        TestResult = Enum.Parse<TestResult>(testResult);
        Discharge = discharge;
        VisitDate = visitDate;
        RoomNum = roomNum;
        VisitNum = visitNum;
        Hospital = hospital;
        TestName = testName;
        TestCode = testCode;
        Unit = unit;
        ValueNum = valueNum;
        ValueLow = valueLow;
        ValueHigh = valueHigh;
        ValuePrev = valuePrev;
        IsAbnormal = valueNum < valueLow || valueNum > valueHigh;
        IsCritical = valueNum < valueLow * 0.5f || valueNum > valueHigh * 1.5f; // Example critical thresholds
        Delta = ValueNum - ValuePrev;
        ResultTrend = AnalyzeTrend();
        Patient = patient;
    }
    private Trend AnalyzeTrend()
    {
        if (ValuePrev == 0 && ValueNum == 0) return Trend.First_Observation; // No previous value to compare
        else if (Delta > 0 && Delta <= 1) return Trend.Increasing;
        else if (Delta < 0 && Delta >= -1) return Trend.Decreasing;
        else if (Delta == 0) return Trend.Stable;
        return Trend.Fluctuating;
    }
    public string TestResultDetail { get => TestResult.ToString(); set => TestResult = Enum.Parse<TestResult>(value); }
    public DateTime DischargeDetail { get => Discharge; set => Discharge = value; }
    public DateTime VisitDateDetail { get => VisitDate; set => VisitDate = value; }
    public int RoomNumDetail { get => RoomNum; set => RoomNum = value; }
    public int VisitNumDetail { get => VisitNum; set => VisitNum = value; }
    public string HospitalDetail { get => Hospital; set => Hospital = value; }
    public string TestNameDetail { get => TestName; set => TestName = value; }
    public string TestCodeDetail { get => TestCode; set => TestCode = value; }
    public string UnitDetail { get => Unit; set => Unit = value; }
    public float ValueNumDetail { get => ValueNum; set => ValueNum = value; }
    public float ValueLowDetail { get => ValueLow; set => ValueLow = value; }
    public float ValueHighDetail { get => ValueHigh; set => ValueHigh = value; }
    public float ValuePrevDetail { get => ValuePrev; set => ValuePrev = value; }
    public bool IsAbnormalDetail { get => IsAbnormal; set => IsAbnormal = value; }
    public bool IsCriticalDetail { get => IsCritical; set => IsCritical = value; }
    public Trend ResultTrendDetail { get => ResultTrend; }
    public Patient PatientDetail { get => Patient; set => Patient = value; }
    public int CalculateStayDuration()
    {
        return (DateTime.Now - Discharge).Days;
    }
    public void ShowTest()
    {
        Console.WriteLine($"Patient ID: {PatientDetail.IDDetail}");
        Console.WriteLine($"Patient Name: {PatientDetail.NameDetail}");
        Console.WriteLine($"Patient Age: {PatientDetail.AgeDetail}");
        Console.WriteLine($"Patient Gender: {PatientDetail.GenderDetail}");
        Console.WriteLine("=== Test Details ===");
        Console.WriteLine($"Test Name: {TestNameDetail}");
        Console.WriteLine($"Test Code: {TestCodeDetail}");
        Console.WriteLine($"Hospital: {HospitalDetail}");
        Console.WriteLine($"Visit Date: {VisitDateDetail}");
        Console.WriteLine($"Discharge Date: {DischargeDetail}");
        Console.WriteLine($"Stay Duration: {CalculateStayDuration()} days");
        Console.WriteLine($"Room Number: {RoomNumDetail}");
        Console.WriteLine($"Visit Number: {VisitNumDetail}");
        Console.WriteLine($"Result: {TestResultDetail}");
        Console.WriteLine($"Abnormal: {(IsAbnormalDetail ? "Yes" : "No")}");
        Console.WriteLine($"Critical: {(IsCriticalDetail ? "Yes" : "No")}");
        Console.WriteLine($"Value: {ValueNumDetail} {UnitDetail} (Normal Range: {ValueLowDetail}-{ValueHighDetail})");
        Console.WriteLine($"Previous Value: {ValuePrevDetail} {UnitDetail}");
        Console.WriteLine($"Delta: {Delta} {UnitDetail}");
        Console.WriteLine($"Trend: {ResultTrendDetail}");
    }
}
