using System;

public enum DoctorSpecialty
{
    GeneralPractitioner,
    Cardiologist,
    Dermatologist,
    Pediatrician,
    Neurologist,
    Psychiatrist,
    OrthopedicSurgeon,
    Gynecologist,
    Urologist,
    Oncologist,
	None
}

public class Doctor : Person
{
	private string Branch, WorkPhone, WorkEmail;
	private int Experience, RoomNum;
	private long DID;
	private List<Patient> Patients = new List<Patient>();
    private static Random Random = new Random();
	private DoctorSpecialty Specialization;
    public Doctor()
	{
		Branch = String.Empty;
		WorkEmail = String.Empty;
		WorkPhone = String.Empty;
		Experience = 0;
		RoomNum = 0;
		DID = 0;
		Specialization = DoctorSpecialty.None;
    }
	public Doctor(string ID, string Name, string ContactType, string ContactDetail, string Currency, string Nationality, double Amount, char Gender, DateTime DOB, string Speciality, string Branch, string WorkPhone, string WorkEmail, int Experience, int RoomNum) : base(ID, Name, ContactType, ContactDetail, Currency, Nationality, Amount, Gender, DOB)
	{
		this.Branch = Branch;
		this.WorkEmail = WorkEmail;
		this.WorkPhone = WorkPhone;
		this.Experience = (Experience < 0) ? 0 : Experience;
		this.RoomNum = (RoomNum < 0) ? 0 : RoomNum;
		DID = GenerateDID();
        Specialization = Enum.Parse<DoctorSpecialty>(Speciality);
    }
	public void ShowSpecializationOptions()
	{
		Console.WriteLine("Available Specializations:");
		foreach (DoctorSpecialty specialty in Enum.GetValues(typeof(DoctorSpecialty)))
		{
			Console.WriteLine($"- {specialty}");
        }
    }
	public string SpecializationDetail { get => Specialization.ToString(); set => Specialization = Enum.Parse<DoctorSpecialty>(value); }
    public string BranchDetail { get => Branch; set => Branch = value; }
	public int Room { get => RoomNum; set => RoomNum = value; }
	public string WorkPhoneDetail { get => WorkPhone; set => WorkPhone = value; }
	public string WorkEmailDetail { get => WorkEmail; set => WorkEmail = value; }
	public int ExperienceDetail { get => Experience; set => Experience = value; }
	public long DIDDetail()
	{
		return this.DID;
	}
	public int GenerateDID()
	{
		return Random.Next(999, 999999999);
    }
    public List<Patient> PatientsDetail { get => Patients; set => Patients = value; }
	public void ShowDoctor()
	{
		base.Display();
		Console.WriteLine($"DID: {DIDDetail()}");
        Console.WriteLine($"Specialization: {SpecializationDetail}");
		Console.WriteLine($"Branch: {BranchDetail}");
		Console.WriteLine($"Work Phone: {WorkPhoneDetail}");
		Console.WriteLine($"Work Email: {WorkEmailDetail}");
		Console.WriteLine($"Experience: {ExperienceDetail} years");
		Console.WriteLine($"Room Number: {Room}");
		Console.WriteLine("Selected Patients:");
		foreach (Patient patient in PatientsDetail)
		{
			patient.ShowPatient();
			Console.WriteLine();
		}
    }
}
