using System;

public class Case
{
	private string Allergy, Symptom, Condition, Hospital, Diagnosis;
	private DateTime Discover;
	private long CID;
	private bool CureAvailable = false;
    private static Random Random = new Random();
    public Case()
	{
        Allergy = "NA";
        Symptom = "NA";
        Condition = "NA";
        Hospital = "NA";
        Discover = DateTime.MinValue;
        CID = 0;
        Diagnosis = "NA";
    }
    public Case(string Allergy, string Symptom, string Condition, string Hospital, DateTime Discover, string Diagnosis)
    {
        this.Allergy = Allergy;
        this.Symptom = Symptom;
        this.Condition = Condition;
        this.Hospital = Hospital;
        this.Discover = Discover;
        CID = GenerateID();
        this.Diagnosis = Diagnosis;
    }
    public string AllergyDetail { get => Allergy; set => Allergy = value; }
    public string SymptomDetail { get => Symptom; set => Symptom = value; }
    public string ConditionDetail { get => Condition; set => Condition = value; }
    public string HospitalDetail { get => Hospital; set => Hospital = value; }
    public DateTime DiscoverDetail { get => Discover; set => Discover = value; }
    public string DiagnosisDetail { get => Diagnosis; set => Diagnosis = value; }
    public long CIDDetail()
    {
        return CID;
    }
    public bool CureAvailableDetail
    {
        get => CureAvailable; set => CureAvailable = value;
    }
    public int CalculateCaseAge()
    {
        int age = DateTime.Now.Year - Discover.Year;
        if (DateTime.Now.DayOfYear < Discover.DayOfYear)
            age--;
        return age;
    }
    public int GenerateID()
    {
        return Random.Next(999, 999999999);
    }
    public void ShowCase()
    {
        Console.WriteLine("Case Details:");
        Console.WriteLine($"CID: {CIDDetail()}");
        Console.WriteLine($"Allergy: {AllergyDetail}");
        Console.WriteLine($"Symptom: {SymptomDetail}");
        Console.WriteLine($"Diagnosis: {DiagnosisDetail}");
        Console.WriteLine($"Condition: {ConditionDetail}");
        Console.WriteLine($"Hospital: {HospitalDetail}");
        Console.WriteLine($"Discover Date: {DiscoverDetail.ToShortDateString()}");
        Console.WriteLine($"Is Cure Available? {(CureAvailableDetail ? "Yes" : "No")}");
    }
}
