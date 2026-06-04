using System;

public class Management
{
	List<Person> Persons;
	public List<User> Users;
	List<Patient> Patients;
	List<Case> Cases;
	List<Doctor> Doctors;
	List<Appointment> Appointments;
	List<Test> Tests;
    TheStack<Person> PersonStack;
	TheStack<User> UserStack;
	TheQueue<Patient> PatientQueue;
	TheQueue<Doctor> DoctorQueue;
	TheQueue<Case> CaseQueue;
	TheQueue<Appointment> AppointmentQueue;
	TheQueue<Test> TestsQueue;
	public Management()
	{
		Persons = new List<Person>();
		Users = new List<User>();
		Patients = new List<Patient>();
		PatientQueue = new TheQueue<Patient>();
		Cases = new List<Case>();
		Doctors = new List<Doctor>();
		Appointments = new List<Appointment>();
		CaseQueue = new TheQueue<Case>();
		AppointmentQueue = new TheQueue<Appointment>();
		DoctorQueue = new TheQueue<Doctor>();
		Appointments = new List<Appointment>(); 
		PersonStack = new TheStack<Person>();
		UserStack = new TheStack<User>();
		Tests = new List<Test>();
		TestsQueue = new TheQueue<Test>();
    }
	public void AddPerson(Person person)
	{
		Persons.Add(person);
		PersonStack.Push(person);
    }
	public void AddUser(User user)
	{
		Users.Add(user);
		UserStack.Push(user);
    }
	public void AddPatient(Patient patient)
	{
		Patients.Add(patient);
		PatientQueue.Enqueue(patient);
    }
	public void AddCase(Case theCase)
	{
		Cases.Add(theCase);
		CaseQueue.Enqueue(theCase);
    }
	public void AddDoctor(Doctor doctor)
	{
		Doctors.Add(doctor);
		DoctorQueue.Enqueue(doctor);
    }
	public void AddAppointment(Appointment appointment)
	{
		Appointments.Add(appointment);
		AppointmentQueue.Enqueue(appointment);
    }
	public void AddTest(Test test)
	{
		Tests.Add(test);
		TestsQueue.Enqueue(test);
    }	
    public void ShowAllPersons()
	{
		foreach (Person person in Persons)
		{
			person.Display();
			Console.WriteLine();
		}
    }
	public void ShowAllUsers()
	{
		foreach (User user in Users)
		{
			user.ShowUser();
			Console.WriteLine();
        }
    }
	public void ShowAllPatients()
	{
		foreach (Patient patient in Patients)
		{
			patient.ShowPatient();
			Console.WriteLine();
        }
    }
	public void ShowAllCases()
	{
		foreach (Case theCase in Cases)
		{
			theCase.ShowCase();
			Console.WriteLine();
        }
    }
	public void ShowAllDoctors()
	{
		foreach (Doctor doctor in Doctors)
		{
			doctor.ShowDoctor();
			Console.WriteLine();
        }
    }
	public void ShowAllAppointments()
	{
		foreach (Appointment appointment in Appointments)
		{
			appointment.ShowStatus();
			Console.WriteLine();
        }
    }
	public void ShowAllTests()
	{
		foreach (Test test in Tests)
		{
			test.ShowTest();
			Console.WriteLine();
		}
    }
    public void DeletePerson(Person item)
	{
		Persons.Remove(item);
    }
	public void DeleteUser(User item)
	{
		Users.Remove(item);
    }
	public void DeletePatient(Patient item)
	{
		Patients.Remove(item);
    }
	public void DeleteCase(Case item)
	{
		Cases.Remove(item);
    }
	public void DeleteDoctor(Doctor item)
	{
		Doctors.Remove(item);
    }
	public void DeleteAppointment(Appointment item)
	{
		Appointments.Remove(item);
    }
	public void DeleteTest(Test item)
	{
		Tests.Remove(item);
    }
    public void ClearAllData()
	{
		Persons.Clear();
		Users.Clear();
		Patients.Clear();
		Cases.Clear();
		Doctors.Clear();
		Appointments.Clear();
		Tests.Clear();
        PersonStack.Clear();
		UserStack.Clear();
		PatientQueue.Clear();
		DoctorQueue.Clear();
		CaseQueue.Clear();
		AppointmentQueue.Clear();
		TestsQueue.Clear();
    }
	public Person RemoveLastPerson()
	{
		return PersonStack.Pop();
    }
	public User RemoveLastUser()
	{
		return UserStack.Pop();
    }
	public Patient ProcessPatient()
	{
		Console.WriteLine("Patient to be removed: " + PatientQueue.Peek().NameDetail);
        return PatientQueue.Dequeue();
    }
	public Doctor ProcessDoctor()
	{
		Console.WriteLine("Doctor to be removed: " + DoctorQueue.Peek().NameDetail);
		return DoctorQueue.Dequeue();
    }
	public Case ProcessCase()
	{
		Console.WriteLine("Case to be removed: " + CaseQueue.Peek().CIDDetail());
		return CaseQueue.Dequeue();
    }
	public Appointment ProcessAppointment()
	{
		Console.WriteLine("Appointment to be removed: " + AppointmentQueue.Peek().AIDDetail());
		return AppointmentQueue.Dequeue();
    }
	public Test ProcessTest()
	{
		Console.WriteLine("Test to be removed: " + TestsQueue.Peek().TestNameDetail);
		return TestsQueue.Dequeue();
    }
    public Person GetPerson(int index)
	{
		if (index < 0 || index >= Persons.Count)
		{
			throw new IndexOutOfRangeException("Index is out of range.");
        }
        return Persons[index];
    }
	public User GetUser(int index)
	{
		if (index < 0 || index >= Users.Count)
		{
			throw new IndexOutOfRangeException("Index is out of range.");
        }
        return Users[index];
    }
	public Patient GetPatient(int index)
	{
		if (index < 0 || index >= Patients.Count)
		{
			throw new IndexOutOfRangeException("Index is out of range.");
		}
		return Patients[index];
    }
	public Case GetCase(int index)
	{
		if (index < 0 || index >= Cases.Count)
		{
			throw new IndexOutOfRangeException("Index is out of range.");
		}
		return Cases[index];
    }
	public Doctor GetDoctor(int index)
	{
		if (index < 0 || index >= Doctors.Count)
		{
			throw new IndexOutOfRangeException("Index is out of range.");
        }
		return Doctors[index];
    }
	public Appointment GetAppointment(int index)
	{
		if (index < 0 || index >= Appointments.Count)
		{
			throw new IndexOutOfRangeException("Index is out of range.");
        }
		return Appointments[index];
    }
	public Test GetTest(int index)
	{
		if (index < 0 || index >= Tests.Count)
		{
			throw new IndexOutOfRangeException("Index is out of range.");
		}
		return Tests[index];
    }
    public int GetPersonCount()
	{
		return Persons.Count;
    }
	public int GetUserCount()
	{
		return Users.Count;
    }
	public int GetPatientCount()
	{
		return Patients.Count;
    }
	public int GetCaseCount()
	{
		return Cases.Count;
    }
	public int GetDoctorCount()
	{
		return Doctors.Count;
    }
	public int GetAppointmentCount()
	{
		return Appointments.Count;
    }
	public int GetTestCount()
	{
		return Tests.Count;
    }
    public Person FindPersonByID(string id)
	{
		return Persons.Find(p => p.IDDetail == id)!;
    }
	public User FindUserByID(string id)
	{
		return Users.Find(u => u.IDDetail == id)!;
    }
	public Patient FindPatientByID(string id)
	{
		return Patients.Find(p => p.PIDDetail().ToString() == id)!;
    }
	public Case FindCaseByID(string id)
	{
		return Cases.Find(c => c.CIDDetail().ToString() == id)!;
    }
	public Doctor FindDoctorByID(string id)
	{
		return Doctors.Find(d => d.DIDDetail().ToString() == id)!;
    }
	public Appointment FindAppointmentByID(string id)
	{
		return Appointments.Find(a => a.AIDDetail().ToString() == id)!;
    }
	public Test FindTestByCode(string code)
	{
		return Tests.Find(t => t.TestCodeDetail == code)!;
    }
    public Person GetLastPerson()
	{
		return PersonStack.Peek();
    }
	public User GetLastUser()
	{
		return UserStack.Peek();
    }
	public Patient GetPatientFromQueue()
	{
		return PatientQueue.Peek();
    }
	public Doctor GetDoctorFromQueue()
	{
		return DoctorQueue.Peek();
    }
	public Case GetCaseFromQueue()
	{
		return CaseQueue.Peek();
    }
	public Appointment GetAppointmentFromQueue()
	{
		return AppointmentQueue.Peek();
    }
	public Test GetTestFromQueue()
	{
		return TestsQueue.Peek();
    }

    public Person ReplacePerson(int index, Person newPerson)
	{
		if (index < 0 || index >= Persons.Count)
		{
			throw new IndexOutOfRangeException("Index is out of range.");
		}
		Person oldPerson = Persons[index];
		Persons[index] = newPerson;
		PersonStack.Push(GetPerson(index));
		return oldPerson;
    }
	public User ReplaceUser(int index, User newUser)
	{
		if (index < 0 || index >= Users.Count)
		{
			throw new IndexOutOfRangeException("Index is out of range.");
        }
		User oldUser = Users[index];
		Users[index] = newUser;
		UserStack.Push(GetUser(index));
        return oldUser;
    }
	public Patient ReplacePatient(int index, Patient newPatient)
	{
		if (index < 0 || index >= Patients.Count)
		{
			throw new IndexOutOfRangeException("Index is out of range.");
        }
		Patient oldPatient = Patients[index];
		Patients[index] = newPatient;
		PatientQueue.Enqueue(GetPatient(index));
        return oldPatient;
    }
	public Case ReplaceCase(int index, Case newCase)
	{
		if (index < 0 || index >= Cases.Count)
		{
			throw new IndexOutOfRangeException("Index is out of range.");
        }
		Case oldCase = Cases[index];
		Cases[index] = newCase;
		CaseQueue.Enqueue(GetCase(index));
        return oldCase;
    }
	public Doctor ReplaceDoctor(int index, Doctor newDoctor)
	{
		if (index < 0 || index >= Doctors.Count)
		{
			throw new IndexOutOfRangeException("Index is out of range.");
        }
		Doctor oldDoctor = Doctors[index];
		Doctors[index] = newDoctor;
		DoctorQueue.Enqueue(GetDoctor(index));
        return oldDoctor;
    }
	public Appointment ReplaceAppointment(int index, Appointment newAppointment)
	{
		if (index < 0 || index >= Appointments.Count)
		{
			throw new IndexOutOfRangeException("Index is out of range.");
        }
		Appointment oldAppointment = Appointments[index];
		Appointments[index] = newAppointment;
		AppointmentQueue.Enqueue(GetAppointment(index));
        return oldAppointment;
    }
	public Test ReplaceTest(int index, Test newTest)
	{
		if (index < 0 || index >= Tests.Count)
		{
			throw new IndexOutOfRangeException("Index is out of range.");
        }
		Test oldTest = Tests[index];
		Tests[index] = newTest;
		TestsQueue.Enqueue(GetTest(index));
		return oldTest;
    }
}
