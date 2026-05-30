using System;

public enum AppointmentReason
{
	Consultation,
	FollowUp,
	Surgery,
	Therapy,
	DiagnosticTest,
	Vaccination,
	Emergency,
	Telemedicine,
	None
}

public enum AppointmentTitle
{
	GeneralCheckup,
	SpecialistVisit,
	PreSurgeryConsultation,
	PostSurgeryFollowUp,
	TherapySession,
	DiagnosticImaging,
	VaccinationAppointment,
	EmergencyVisit,
	TelemedicineConsultation,
    None
}

public enum AppointmentStatus
{
	Scheduled,
	Completed,
	Canceled,
	NoShow,
	Rescheduled, 
	None
}

public class Appointment
{
	private Patient Patient;
	private DateTime Schedule;
	private Doctor Doctor;
	private AppointmentReason Reason;
	private AppointmentTitle Title;
	private AppointmentStatus Status;
    private long AID;
	public Appointment()
	{
		Patient = new Patient();
		Doctor = new Doctor();
		Reason = AppointmentReason.None;
		Title = AppointmentTitle.None;
		Status = AppointmentStatus.None;
        AID = 0;
		Schedule = DateTime.MinValue;
	}
	public Appointment(Patient patient, Doctor doctor, DateTime schedule, string reason, string title, string status)
	{
		this.Patient = patient;
		this.Doctor = doctor;
		this.Schedule = schedule;
		this.Reason = Enum.Parse<AppointmentReason>(reason);
		this.Title = Enum.Parse<AppointmentTitle>(title);
		this.Status = Enum.Parse<AppointmentStatus>(status);
		AID = GenerateAID();
    }
	public Patient PatientDetail { get => Patient; set => Patient = value; }
	public Doctor DoctorDetail { get => Doctor; set => Doctor = value; }
	public DateTime ScheduleDetail { get => Schedule; set => Schedule = value; }
	public string ReasonDetail { get => Reason.ToString(); set => Reason = Enum.Parse<AppointmentReason>(value); }
	public string TitleDetail { get => Title.ToString(); set => Enum.Parse<AppointmentTitle>(value); }
	public string StatusDetail { get => Status.ToString(); set => Enum.Parse<AppointmentStatus>(value); }
	public long AIDDetail()
	{
		return AID;
    }
	public void ShowStatus()
	{
		Console.WriteLine("Appointment Status:");
        foreach (AppointmentStatus status in Enum.GetValues(typeof(AppointmentStatus)))
		{
			Console.WriteLine(status);
        }
    }
	public void ShowReason()
	{
		Console.WriteLine("Appointment Reasons:");
        foreach (AppointmentReason reason in Enum.GetValues(typeof(AppointmentReason)))
		{
			Console.WriteLine(reason);
        }
    }
	public void ShowTitle()
	{
		Console.WriteLine("Appointment Titles:");
        foreach (AppointmentTitle title in Enum.GetValues(typeof(AppointmentTitle)))
		{
			Console.WriteLine(title);
        }
    }
    public int GenerateAID()
	{
		Random random = new Random();
		return random.Next(999, 999999999);
    }
    public void ShowAppointment()
    {
		Console.WriteLine("Appointment Details:");
        Console.WriteLine($"Appointment ID: {AIDDetail()}");
		Console.WriteLine($"Patient: {PatientDetail.NameDetail} (PID: {PatientDetail.PIDDetail()})");
		Console.WriteLine($"Doctor: {DoctorDetail.NameDetail} (DID: {DoctorDetail.DIDDetail()})");
		Console.WriteLine($"Schedule: {ScheduleDetail}");
		Console.WriteLine($"Reason: {ReasonDetail}");
		Console.WriteLine($"Title: {TitleDetail}");
		Console.WriteLine($"Status: {StatusDetail}");
    }
}
