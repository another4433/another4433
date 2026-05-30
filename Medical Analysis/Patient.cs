using System;

public class Patient : Person
{
	private string BloodType, Description, Medication;
    private long PID;
    private Case TheCase;
    private static Random Random = new Random();
    private double BodyWeight, BodyTemperature, HeartRate; // Added BodyWeight property
    private string[] Units = new string[3];
    public Patient() : base()
    {
        BloodType = "NA";
        Description = "NA";
        Medication = "NA";
        PID = 0;
        TheCase = new Case();
        BodyWeight = 0.0;
        BodyTemperature = 0.0;
        HeartRate = 0.0;
    }
    public Patient(string ID, string Name, string ContactType, string ContactDetail, string Currency, string National, double Amount, char Gender, DateTime DOB, string BloodType, string Description, string Medication, DateTime Discharge, int RoomNum, Case ThatCase, double BodyWeight, string[] units, double HeartRate, double BodyTemperature) : base(ID, Name, ContactType, ContactDetail, Currency, National, Amount, Gender, DOB)
    {
        this.BloodType = BloodType;
        this.Description = Description;
        this.Medication = Medication;
        PID = GenerateID();
        TheCase = ThatCase;
        Units = units;
        this.BodyWeight = (BodyWeight < 0) ? 0 : BodyWeight;
        this.HeartRate = (HeartRate < 0) ? 0 : HeartRate;
        this.BodyTemperature = BodyTemperature;
    }
    public string BloodTypeDetail { get => BloodType; set => BloodType = value; }
    public string DescriptionDetail { get => Description; set => Description = value; }
    public string MedicationDetail { get => Medication; set => Medication = value; }
    public long PIDDetail()
    {
        return PID;
    }
    public Case TheCaseDetail { get => TheCase; set => TheCase = value; }
    public int GenerateID()
    {
        return Random.Next(999, 999999999);
    }
    public double BodyWeightDetail { get => BodyWeight; set => BodyWeight = (value < 0) ? 0 : value; }
    public double BodyTemperatureDetail { get => BodyTemperature; set => BodyTemperature = value; }
    public double HeartRateDetail { get => HeartRate; set => HeartRate = (value < 0) ? 0 : value; }
    public string[] UnitsDetail { get => Units; set => Units = value; }
    public void ShowPatient()
    {
        base.Display();
        Console.WriteLine($"PID: {PIDDetail()}");
        Console.WriteLine($"Blood Type: {BloodTypeDetail}");
        Console.WriteLine($"Description: {DescriptionDetail}");
        Console.WriteLine($"Medication: {MedicationDetail}");
        Console.WriteLine($"Body Weight: {BodyWeightDetail} {UnitsDetail[0]}");
        Console.WriteLine($"Body Temperature: {BodyTemperatureDetail} {UnitsDetail[1]}");
        Console.WriteLine($"Heart Rate: {HeartRateDetail} {UnitsDetail[2]}");
        TheCaseDetail.ShowCase();
    }
}
