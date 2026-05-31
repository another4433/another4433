namespace medical
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Management management = new Management();
            Person person = new Person();
            User user = new User();
            Patient patient = new Patient();
            Doctor doctor = new Doctor();
            Case Case = new Case();
            Appointment appointment = new Appointment();
            Test test = new Test();
            bool success = false;
            Console.WriteLine("Hello, World!");
            Console.WriteLine("Welcome to the Medical App!");
            Console.WriteLine("Choose from the list:");
            Console.WriteLine("(0) Exit");
            Console.WriteLine("(1) Register");
            Console.WriteLine("(2) Login");
            Console.WriteLine("Enter the number: ");
            int choice = int.Parse(Console.ReadLine()!);
            if (choice == 1)
            {
                Console.WriteLine("Enter your ID: ");
                string id = Console.ReadLine()!;
                Console.WriteLine("Enter your Name: ");
                string name = Console.ReadLine()!;
                Console.WriteLine("Enter your Contact Type: ");
                string contactType = Console.ReadLine()!;
                Console.WriteLine("Enter your Contact Detail: ");
                string contactDetail = Console.ReadLine()!;
                Console.WriteLine("Enter your Currency: ");
                string currency = Console.ReadLine()!;
                Console.WriteLine("Enter the amount of money you have: ");
                double amount = double.Parse(Console.ReadLine()!);
                Console.WriteLine("Enter your Nationality: ");
                string nationality = Console.ReadLine()!;
                Console.WriteLine("Enter your Gender (M/F/T/N): ");
                char gender = char.Parse(Console.ReadLine()!);
                Console.WriteLine("Enter your Date of Birth (YYYY-MM-DD): ");
                DateTime dob = DateTime.Parse(Console.ReadLine()!);
                person = new Person(id, name, contactType, contactDetail, currency, nationality, amount, gender, dob);
                management.AddPerson(person);
                Console.WriteLine("Enter your Password: ");
                string password = Console.ReadLine()!;
                user = new User(id, name, contactType, contactDetail, currency, nationality, amount, gender, dob, password);
                management.AddUser(user);
                Console.WriteLine("Registration successful! You can now log in.");
            }
            while (choice > 0)
            {
                if (choice == 1)
                {
                    Console.WriteLine("Enter your ID: ");
                    string id = Console.ReadLine()!;
                    Console.WriteLine("Enter your Name: ");
                    string name = Console.ReadLine()!;
                    Console.WriteLine("Enter your Contact Type: ");
                    string contactType = Console.ReadLine()!;
                    Console.WriteLine("Enter your Contact Detail: ");
                    string contactDetail = Console.ReadLine()!;
                    Console.WriteLine("Enter your Currency: ");
                    string currency = Console.ReadLine()!;
                    Console.WriteLine("Enter the amount of money you have: ");
                    double amount = double.Parse(Console.ReadLine()!);
                    Console.WriteLine("Enter your Nationality: ");
                    string nationality = Console.ReadLine()!;
                    Console.WriteLine("Enter your Gender (M/F/T/N): ");
                    char gender = char.Parse(Console.ReadLine()!);
                    Console.WriteLine("Enter your Date of Birth (YYYY-MM-DD): ");
                    DateTime dob = DateTime.Parse(Console.ReadLine()!);
                    person = new Person(id, name, contactType, contactDetail, currency, nationality, amount, gender, dob);
                    Console.WriteLine("Enter your Password: ");
                    string password = Console.ReadLine()!;
                    user = new User(id, name, contactType, contactDetail, currency, nationality, amount, gender, dob, password);
                    management.AddPerson(person);
                    management.AddUser(user);
                    Console.WriteLine("Registration successful! You can now log in.");
                }
                else
                {
                    Console.WriteLine("Enter contact type: ");
                    string contactType = Console.ReadLine()!;
                    Console.WriteLine("Enter contact detail: ");
                    string contactDetail = Console.ReadLine()!;
                    Console.WriteLine("Enter password: ");
                    string password = Console.ReadLine()!;
                    for (int i = 0; i < management.Users.Count; i++)
                    {
                        if (management.Users[i].ContactTypeDetail == contactType && management.Users[i].ContactTheDetail == contactDetail && management.Users[i].UserPassword == password)
                        {
                            user = management.Users[i];
                            Console.WriteLine("Login successful! Welcome back, " + management.Users[i].NameDetail + "!");
                            success = true;
                            break;
                        }
                        else if (i == management.Users.Count - 1)
                        {
                            Console.WriteLine("Login failed! Please check your credentials and try again.");
                            success = false;
                            break;
                        }
                    }
                }
                if (success)
                {
                    int option;
                    do
                    {
                        Console.WriteLine("Choose the option below since you have access to the app: ");
                        Console.WriteLine("(0) Exit");
                        Console.WriteLine("(1) View Profile");
                        Console.WriteLine("(2) Add Patient");
                        Console.WriteLine("(3) Add Doctor");
                        Console.WriteLine("(4) Add Case");
                        Console.WriteLine("(5) Add Test");
                        Console.WriteLine("(6) Add Appointment");
                        Console.WriteLine("(7) Assign Test to the Patient");
                        Console.WriteLine("(8) View Patients");
                        Console.WriteLine("(9) View Doctors");
                        Console.WriteLine("(10) View Cases");
                        Console.WriteLine("(11) View Medical Tests");
                        Console.WriteLine("(12) View Appointments");
                        Console.WriteLine("(13) View Last Person Added");
                        Console.WriteLine("(14) View Last User Added");
                        Console.WriteLine("(15) View First Patient Added");
                        Console.WriteLine("(16) View First Doctor Added");
                        Console.WriteLine("(17) View First Case Added");
                        Console.WriteLine("(18) View First Test Added");
                        Console.WriteLine("(19) View First Appointment Added");
                        Console.WriteLine("(20) Clear All Data");
                        Console.WriteLine("(21) Remove Last Person Added");
                        Console.WriteLine("(22) Remove Last User Added");
                        Console.WriteLine("(23) Process First Patient Added");
                        Console.WriteLine("(24) Process First Doctor Added");
                        Console.WriteLine("(25) Process First Case Added");
                        Console.WriteLine("(26) Process First Test Added");
                        Console.WriteLine("(27) Process First Appointment Added");
                        Console.WriteLine("(28) Delete a Person");
                        Console.WriteLine("(29) Delete a User");
                        Console.WriteLine("(30) Delete a Patient");
                        Console.WriteLine("(31) Delete a Doctor");
                        Console.WriteLine("(32) Delete a Case");
                        Console.WriteLine("(33) Delete a Test");
                        Console.WriteLine("(34) Delete an Appointment");
                        Console.WriteLine("(35) Replace a Person");
                        Console.WriteLine("(36) Replace a User");
                        Console.WriteLine("(37) Replace a Patient");
                        Console.WriteLine("(38) Replace a Doctor");
                        Console.WriteLine("(39) Replace a Case");
                        Console.WriteLine("(40) Replace a Test");
                        Console.WriteLine("(41) Replace an Appointment");
                        Console.WriteLine("(42) Search for a Person");
                        Console.WriteLine("(43) Search for a User");
                        Console.WriteLine("(44) Search for a Patient");
                        Console.WriteLine("(45) Search for a Doctor");
                        Console.WriteLine("(46) Search for a Case");
                        Console.WriteLine("(47) Search for a Test");
                        Console.WriteLine("(48) Search for an Appointment");
                        Console.WriteLine("(49) Get a Patient");
                        Console.WriteLine("(50) Get a Doctor");
                        Console.WriteLine("(51) Get a Case");
                        Console.WriteLine("(52) Get a Test Result");
                        Console.WriteLine("(53) Get an Appointment Details");
                        Console.WriteLine("(54) Get Person List Count");
                        Console.WriteLine("(55) Get User List Count");
                        Console.WriteLine("(56) Get Patient List Count");
                        Console.WriteLine("(57) Get Doctor List Count");    
                        Console.WriteLine("(58) Get Case List Count");
                        Console.WriteLine("(59) Get Test List Count");
                        Console.WriteLine("(60) Get Appointment List Count");
                        Console.WriteLine("Enter the number: ");
                        option = int.Parse(Console.ReadLine()!);
                        switch (option)
                        {
                            case 0:
                                success = false;
                                break;
                            case 1:
                                Console.WriteLine("Your profile information:");
                                user!.ShowUser();
                                break;
                            case 2:
                                Console.WriteLine("Enter the patient ID: ");
                                string patientID = Console.ReadLine()!;
                                Console.WriteLine("Enter the patient Name: ");
                                string patientName = Console.ReadLine()!;
                                Console.WriteLine("Enter the patient Contact Type: ");
                                string patientContactType = Console.ReadLine()!;
                                Console.WriteLine("Enter the patient Contact Detail: ");
                                string patientContactDetail = Console.ReadLine()!;
                                Console.WriteLine("Enter the patient Currency: ");
                                string patientCurrency = Console.ReadLine()!;
                                Console.WriteLine("Enter the patient Nationality: ");
                                string patientNationality = Console.ReadLine()!;
                                Console.WriteLine("How much money does the patient have? ");
                                double patientAmount = double.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the patient Gender (M/F/T/N): ");
                                char patientGender = char.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the patient Date of Birth (YYYY-MM-DD): ");
                                DateTime patientDOB = DateTime.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the patient blood type: ");
                                string patientBloodType = Console.ReadLine()!;
                                Console.WriteLine("Enter the patient description: ");
                                string patientDescription = Console.ReadLine()!;
                                Console.WriteLine("Enter the patient medication: ");
                                string patientMedication = Console.ReadLine()!;
                                Console.WriteLine("Enter the patient body weight: ");
                                double patientBodyWeight = double.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the unit used for weight: ");
                                string patientWeightUnit = Console.ReadLine()!;
                                Console.WriteLine("Enter the patient body temperature: ");
                                double patientBodyTemperature = double.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the unit used for temperature: ");
                                string patientTemperatureUnit = Console.ReadLine()!;
                                Console.WriteLine("Enter the patient heart rate: ");
                                double patientHeartRate = double.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the unit used for heart rate: ");
                                string patientHeartRateUnit = Console.ReadLine()!;
                                string[] strings = { patientWeightUnit, patientTemperatureUnit, patientHeartRateUnit };
                                Console.WriteLine("Enter the ID of the case for the patient: ");
                                long patientCaseID = long.Parse(Console.ReadLine()!);
                                Case = management.FindCaseByID(patientCaseID.ToString());
                                Console.WriteLine("Enter the doctor ID for the patient: ");
                                long patientDoctorID = long.Parse(Console.ReadLine()!);
                                doctor = management.FindDoctorByID(patientDoctorID.ToString());
                                patient = new Patient(patientID, patientName, patientContactType, patientContactDetail, patientCurrency, patientNationality, patientAmount, patientGender, patientDOB, patientBloodType, patientDescription, patientMedication, Case, patientBodyWeight, strings, patientHeartRate, patientBodyTemperature, doctor);
                                management.AddPatient(patient);
                                Console.WriteLine("Patient Added.");
                                Console.WriteLine("You will need to look at the patient list to assign test to this patient by taking the index from the list.");
                                break;
                            case 3:
                                Console.WriteLine("Enter the doctor ID: ");
                                string doctorID = Console.ReadLine()!;
                                Console.WriteLine("Enter the doctor Name: ");
                                string doctorName = Console.ReadLine()!;
                                Console.WriteLine("Enter the doctor Contact Type: ");
                                string doctorContactType = Console.ReadLine()!;
                                Console.WriteLine("Enter the doctor Contact Detail: ");
                                string doctorContactDetail = Console.ReadLine()!;
                                Console.WriteLine("Enter the doctor Currency: ");
                                string doctorCurrency = Console.ReadLine()!;
                                Console.WriteLine("Enter the doctor Nationality: ");
                                string doctorNationality = Console.ReadLine()!;
                                Console.WriteLine("How much money does the doctor have? ");
                                double doctorAmount = double.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the doctor Gender (M/F/T/N): ");
                                char doctorGender = char.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the doctor Date of Birth (YYYY-MM-DD): ");
                                DateTime doctorDOB = DateTime.Parse(Console.ReadLine()!);
                                doctor!.ShowSpecializationOptions();
                                Console.WriteLine("Select one of the specialiazation above and Enter the doctor specialty: ");
                                string doctorSpecialty = Console.ReadLine()!;
                                Console.WriteLine("Enter the doctor branch: ");
                                string doctorBranch = Console.ReadLine()!;
                                Console.WriteLine("Enter the doctor work phone number: ");
                                string doctorWorkPhone = Console.ReadLine()!;
                                Console.WriteLine("Enter the doctor work email: ");
                                string doctorWorkEmail = Console.ReadLine()!;
                                Console.WriteLine("How many years of experience does the doctor have? (Enter integer only): ");
                                int doctorExperience = int.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the room number of the doctor: ");
                                int doctorRoomNum = int.Parse(Console.ReadLine()!);
                                doctor = new Doctor(doctorID, doctorName, doctorContactType, doctorContactDetail, doctorCurrency, doctorNationality, doctorAmount, doctorGender, doctorDOB, doctorSpecialty, doctorBranch, doctorWorkPhone, doctorWorkEmail, doctorExperience, doctorRoomNum);
                                management.AddDoctor(doctor);
                                Console.WriteLine("Doctor Added.");
                                break;
                            case 4:
                                Console.WriteLine("Enter the allergy: ");
                                string allergy = Console.ReadLine()!;
                                Console.WriteLine("Enter the symptom: ");
                                string symptom = Console.ReadLine()!;
                                Console.WriteLine("Enter the diagnosis: ");
                                string diagnosis = Console.ReadLine()!;
                                Console.WriteLine("Enter the condition: "); 
                                string condition = Console.ReadLine()!;
                                Console.WriteLine("Enter the hospital: ");
                                string hospital = Console.ReadLine()!;
                                Console.WriteLine("Enter the discovery date (YYYY-MM-DD): ");
                                DateTime discoveryDate = DateTime.Parse(Console.ReadLine()!);
                                Case = new Case(allergy, symptom, condition, hospital, discoveryDate, diagnosis);
                                management.AddCase(Case);
                                Console.WriteLine("Case Added.");
                                break;
                            case 5:
                                Console.WriteLine("Enter the test result: ");
                                string testResult = Console.ReadLine()!;
                                Console.WriteLine("Enter the test name: ");
                                string testName = Console.ReadLine()!;
                                Console.WriteLine("Enter the test code: ");
                                string testCode = Console.ReadLine()!;
                                Console.WriteLine("Enter the discharge date (YYYY-MM-DD): ");
                                DateTime discharge = DateTime.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the visit date (YYYY-MM-DD): ");
                                DateTime visitDate = DateTime.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the room number: ");
                                int roomNum = int.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the visit number: ");
                                int visitNum = int.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the hospital: ");
                                string testHospital = Console.ReadLine()!;
                                Console.WriteLine("Enter the unit used for the test: ");
                                string testUnit = Console.ReadLine()!;
                                Console.WriteLine("Enter the value of the test: ");
                                float valueNum = float.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the low value of the test: ");
                                float valueLow = float.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the high value of the test: ");
                                float valueHigh = float.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the previous value of the test: ");
                                float valuePrev = float.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the ID of the patient for the test: ");
                                string testPatientID = Console.ReadLine()!;
                                patient = management.FindPatientByID(testPatientID);
                                test = new Test(testResult, discharge, visitDate, roomNum, visitNum, testHospital, testName, testCode, testUnit, valueNum, valueLow, valueHigh, valuePrev, patient);
                                management.AddTest(test);
                                Console.WriteLine("Test Added.");
                                break;
                            case 6:
                                Console.WriteLine("Enter the patient ID: ");
                                string appointmentPatientID = Console.ReadLine()!;
                                patient = management.FindPatientByID(appointmentPatientID);
                                Console.WriteLine("Enter the doctor ID: ");
                                string appointmentDoctorID = Console.ReadLine()!;
                                doctor = management.FindDoctorByID(appointmentDoctorID);
                                Console.WriteLine("Enter the appointment date (YYYY-MM-DD): ");
                                DateTime appointmentDate = DateTime.Parse(Console.ReadLine()!);
                                appointment!.ShowReason();
                                Console.WriteLine("Select one of the reasons above and Enter the reason for the appointment: ");
                                string appointmentReason = Console.ReadLine()!;
                                appointment.ShowTitle();
                                Console.WriteLine("Select one of the titles above and Enter the appointment title: ");
                                string appointmentTitle = Console.ReadLine()!;
                                appointment.ShowStatus();
                                Console.WriteLine("Select one of the status above and Enter the appointment status: ");
                                string appointmentStatus = Console.ReadLine()!;
                                appointment = new Appointment(patient, doctor, appointmentDate, appointmentReason, appointmentTitle, appointmentStatus);
                                management.AddAppointment(appointment);
                                Console.WriteLine("Appointment Added.");
                                break;
                            case 7:
                                Console.WriteLine("Enter the index of the selected patient from the patient list (type \"-1\" if you do not know the index): ");
                                int indexPatient = int.Parse(Console.ReadLine()!);
                                if (indexPatient == -1) break;
                                Patient newpatient = management.GetPatient(indexPatient);   
                                Console.WriteLine("Enter the test code for the patient: ");
                                string assignTestCode = Console.ReadLine()!;
                                test = management.FindTestByCode(assignTestCode);
                                newpatient.TestDetail = test;
                                Patient otherPatient = management.ReplacePatient(indexPatient, newpatient);
                                if (otherPatient != management.GetPatient(indexPatient) && otherPatient == management.FindPatientByID(newpatient.PIDDetail().ToString()))
                                {
                                    Console.WriteLine("Test assigned to the patient successfully.");
                                }
                                else
                                {
                                    Console.WriteLine("Failed to assign a test to the patient! Operation aborted.");
                                }
                                break;
                            case 8:
                                management.ShowAllPatients();
                                break;
                            case 9:
                                management.ShowAllDoctors();
                                break;
                            case 10:
                                management.ShowAllCases();
                                break;
                            case 11:
                                management.ShowAllTests();
                                break;
                            case 12:
                                management.ShowAllAppointments();
                                break;
                            case 13:
                                management.GetLastPerson();
                                break;
                            case 14:
                                management.GetLastUser();
                                break;
                            case 15:
                                management.GetPatientFromQueue();
                                break;
                            case 16:
                                management.GetDoctorFromQueue();
                                break;
                            case 17:
                                management.GetCaseFromQueue();
                                break;
                            case 18:
                                management.GetTestFromQueue();
                                break;
                            case 19:
                                management.GetAppointmentFromQueue();
                                break;
                            case 20:
                                management.ClearAllData();
                                break;
                            case 21:
                                management.RemoveLastPerson();
                                break;
                            case 22:
                                management.RemoveLastUser();
                                break;
                            case 23:
                                management.ProcessPatient();
                                break;
                            case 24:
                                management.ProcessDoctor();
                                break;
                            case 25:
                                management.ProcessCase();
                                break;
                            case 26:
                                management.ProcessTest();
                                break;
                            case 27:
                                management.ProcessAppointment();
                                break;
                            case 28:
                                Console.WriteLine("Enter the ID of the person you want to delete: ");
                                person = management.FindPersonByID(Console.ReadLine()!);
                                if (person != null)
                                {
                                    management.DeletePerson(person);
                                    Console.WriteLine("Person deleted.");
                                }
                                else
                                {
                                    Console.WriteLine("Person not found.");
                                }
                                break;
                            case 29:
                                Console.WriteLine("Enter the ID of the user you want to delete: ");
                                user = management.FindUserByID(Console.ReadLine()!);
                                if (user != null)
                                {
                                    management.DeleteUser(user);
                                    Console.WriteLine("User deleted.");
                                }
                                else
                                {
                                    Console.WriteLine("User not found.");
                                }
                                break;
                            case 30:
                                Console.WriteLine("Enter the ID of the patient you want to delete: ");
                                patient = management.FindPatientByID(Console.ReadLine()!);
                                if (patient != null)
                                {
                                    management.DeletePatient(patient);
                                    Console.WriteLine("Patient deleted.");
                                }
                                else
                                {
                                    Console.WriteLine("Patient not found.");
                                }
                                break;
                            case 31:
                                Console.WriteLine("Enter the ID of the doctor you want to delete: ");
                                doctor = management.FindDoctorByID(Console.ReadLine()!);
                                if (doctor != null)
                                {
                                    management.DeleteDoctor(doctor);
                                    Console.WriteLine("Doctor deleted.");
                                }
                                else
                                {
                                    Console.WriteLine("Doctor not found.");
                                }
                                break;
                            case 32:
                                Console.WriteLine("Enter the ID of the case you want to delete: ");
                                Case = management.FindCaseByID(Console.ReadLine()!);
                                if (Case != null)
                                {
                                    management.DeleteCase(Case);
                                    Console.WriteLine("Case deleted.");
                                }
                                else
                                {
                                    Console.WriteLine("Case not found.");
                                }
                                break;
                            case 33:
                                Console.WriteLine("Enter the Code of the test you want to delete: ");
                                test = management.FindTestByCode(Console.ReadLine()!);
                                if (test != null)
                                {
                                    management.DeleteTest(test);
                                    Console.WriteLine("Test deleted.");
                                }
                                else
                                {
                                    Console.WriteLine("Test not found.");
                                }
                                break;
                            case 34:
                                Console.WriteLine("Enter the ID of the appointment you want to delete: ");
                                appointment = management.FindAppointmentByID(Console.ReadLine()!);
                                if (appointment != null)
                                {
                                    management.DeleteAppointment(appointment);
                                    Console.WriteLine("Appointment deleted.");
                                }
                                else
                                {
                                    Console.WriteLine("Appointment not found.");
                                }
                                break;
                            case 35:
                                Console.WriteLine("Enter the index from the person list (type \"-1\" if you do not know the index): ");
                                int personIndex = int.Parse(Console.ReadLine()!);
                                if (personIndex == -1) break;
                                Console.WriteLine("Enter the ID of the new person: ");
                                string id = Console.ReadLine()!;
                                Console.WriteLine("Enter the Name of the new person: ");
                                string name = Console.ReadLine()!;
                                Console.WriteLine("Enter the Contact Type of the new person: ");
                                string contactType = Console.ReadLine()!;
                                Console.WriteLine("Enter the Contact Detail of the new person: ");
                                string contactDetail = Console.ReadLine()!;
                                Console.WriteLine("Enter the Currency of the new person: ");
                                string currency = Console.ReadLine()!;
                                Console.WriteLine("Enter the amount of money that new person have: ");
                                double amount = double.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the Nationality of the new person: ");
                                string nationality = Console.ReadLine()!;
                                Console.WriteLine("Enter the Gender of the new person (M/F/T/N): ");
                                char gender = char.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the Date of Birth of the new person (YYYY-MM-DD): ");
                                DateTime dob = DateTime.Parse(Console.ReadLine()!);
                                person = new Person(id, name, contactType, contactDetail, currency, nationality, amount, gender, dob);
                                Person newPerson = management.ReplacePerson(personIndex, person);
                                if (newPerson != management.GetPerson(personIndex) && newPerson == management.FindPersonByID(person.IDDetail))
                                {
                                    Console.WriteLine("Person replaced successfully.");
                                }
                                else
                                {
                                    Console.WriteLine("Failed to replace a person! Operation aborted.");
                                }
                                break;
                            case 36:
                                Console.WriteLine("Enter the index from the user list (type \"-1\" if you do not know the index): ");
                                int userIndex = int.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the ID of the new user: ");
                                string userid = Console.ReadLine()!;
                                Console.WriteLine("Enter the Name of the new user: ");
                                string username = Console.ReadLine()!;
                                Console.WriteLine("Enter the Contact Type of the new user: ");
                                string usercontactType = Console.ReadLine()!;
                                Console.WriteLine("Enter the Contact Detail of the new user: ");
                                string usercontactDetail = Console.ReadLine()!;
                                Console.WriteLine("Enter the Currency of the new user: ");
                                string usercurrency = Console.ReadLine()!;
                                Console.WriteLine("Enter the amount of money the new user have: ");
                                double useramount = double.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the Nationality of the new user: ");
                                string usernationality = Console.ReadLine()!;
                                Console.WriteLine("Enter the Gender of the new user (M/F/T/N): ");
                                char usergender = char.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the Date of Birth of the new user (YYYY-MM-DD): ");
                                DateTime userdob = DateTime.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the Password of the new user: ");
                                string password = Console.ReadLine()!;
                                user = new User(userid, username, usercontactType, usercontactDetail, usercurrency, usernationality, useramount, usergender, userdob, password);
                                User newUser = management.ReplaceUser(userIndex, user);
                                if (newUser != management.GetUser(userIndex) && newUser == management.FindUserByID(user.IDDetail))
                                {
                                    Console.WriteLine("User replaced successfully.");
                                }
                                else
                                {
                                    Console.WriteLine("Failed to replace a user! Operation aborted.");
                                }
                                break;
                            case 37:
                                Console.WriteLine("Enter the index of the patient list (type \"-1\" if you do not know the index): ");
                                int patientIndex = int.Parse(Console.ReadLine()!);
                                if (patientIndex == -1) break;
                                Console.WriteLine("Enter the patient ID: ");
                                string newpatientID = Console.ReadLine()!;
                                Console.WriteLine("Enter the patient Name: ");
                                string newpatientName = Console.ReadLine()!;
                                Console.WriteLine("Enter the patient Contact Type: ");
                                string newpatientContactType = Console.ReadLine()!;
                                Console.WriteLine("Enter the patient Contact Detail: ");
                                string newpatientContactDetail = Console.ReadLine()!;
                                Console.WriteLine("Enter the patient Currency: ");
                                string newpatientCurrency = Console.ReadLine()!;
                                Console.WriteLine("Enter the patient Nationality: ");
                                string newpatientNationality = Console.ReadLine()!;
                                Console.WriteLine("How much money does the patient have? ");
                                double newpatientAmount = double.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the patient Gender (M/F/T/N): ");
                                char newpatientGender = char.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the patient Date of Birth (YYYY-MM-DD): ");
                                DateTime newpatientDOB = DateTime.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the patient blood type: ");
                                string newpatientBloodType = Console.ReadLine()!;
                                Console.WriteLine("Enter the patient description: ");
                                string newpatientDescription = Console.ReadLine()!;
                                Console.WriteLine("Enter the patient medication: ");
                                string newpatientMedication = Console.ReadLine()!;
                                Console.WriteLine("Enter the patient body weight: ");
                                double newpatientBodyWeight = double.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the unit used for weight: ");
                                string newpatientWeightUnit = Console.ReadLine()!;
                                Console.WriteLine("Enter the patient body temperature: ");
                                double newpatientBodyTemperature = double.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the unit used for temperature: ");
                                string newpatientTemperatureUnit = Console.ReadLine()!;
                                Console.WriteLine("Enter the patient heart rate: ");
                                double newpatientHeartRate = double.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the unit used for heart rate: ");
                                string newpatientHeartRateUnit = Console.ReadLine()!;
                                string[] newstrings = { newpatientWeightUnit, newpatientTemperatureUnit, newpatientHeartRateUnit };
                                Console.WriteLine("Enter the ID of the case for the patient: ");
                                long newpatientCaseID = long.Parse(Console.ReadLine()!);
                                Case = management.FindCaseByID(newpatientCaseID.ToString());
                                Console.WriteLine("Enter the doctor ID for the patient: ");
                                long newpatientDoctorID = long.Parse(Console.ReadLine()!);
                                doctor = management.FindDoctorByID(newpatientDoctorID.ToString());
                                patient = new Patient(newpatientID, newpatientName, newpatientContactType, newpatientContactDetail, newpatientCurrency, newpatientNationality, newpatientAmount, newpatientGender, newpatientDOB, newpatientBloodType, newpatientDescription, newpatientMedication, Case, newpatientBodyWeight, newstrings, newpatientHeartRate, newpatientBodyTemperature, doctor);
                                Patient newPatient2 = management.ReplacePatient(patientIndex, patient);
                                if (newPatient2 != management.GetPatient(patientIndex) && newPatient2 == management.FindPatientByID(patient.PIDDetail().ToString()))
                                {
                                    Console.WriteLine("Patient replaced successfully.");
                                    Console.WriteLine("You will need to look at the patient list to assign test to this patient by taking the index from the list.");
                                }
                                else
                                {
                                    Console.WriteLine("Failed to replace a patient! Operation aborted.");
                                }
                                break;
                            case 38:
                                Console.WriteLine("Enter the index of the doctor list (type \"-1\" if you do not know the index): ");
                                int doctorIndex = int.Parse(Console.ReadLine()!);
                                if (doctorIndex == -1) break;
                                Console.WriteLine("Enter the doctor ID: ");
                                string newdoctorID = Console.ReadLine()!;
                                Console.WriteLine("Enter the doctor Name: ");
                                string newdoctorName = Console.ReadLine()!;
                                Console.WriteLine("Enter the doctor Contact Type: ");
                                string newdoctorContactType = Console.ReadLine()!;
                                Console.WriteLine("Enter the doctor Contact Detail: ");
                                string newdoctorContactDetail = Console.ReadLine()!;
                                Console.WriteLine("Enter the doctor Currency: ");
                                string newdoctorCurrency = Console.ReadLine()!;
                                Console.WriteLine("Enter the doctor Nationality: ");
                                string newdoctorNationality = Console.ReadLine()!;
                                Console.WriteLine("How much money does the doctor have? ");
                                double newdoctorAmount = double.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the doctor Gender (M/F/T/N): ");
                                char newdoctorGender = char.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the doctor Date of Birth (YYYY-MM-DD): ");
                                DateTime newdoctorDOB = DateTime.Parse(Console.ReadLine()!);
                                doctor!.ShowSpecializationOptions();
                                Console.WriteLine("Select one of the specialiazation above and Enter the doctor specialty: ");
                                string newdoctorSpecialty = Console.ReadLine()!;
                                Console.WriteLine("Enter the doctor branch: ");
                                string newdoctorBranch = Console.ReadLine()!;
                                Console.WriteLine("Enter the doctor work phone number: ");
                                string newdoctorWorkPhone = Console.ReadLine()!;
                                Console.WriteLine("Enter the doctor work email: ");
                                string newdoctorWorkEmail = Console.ReadLine()!;
                                Console.WriteLine("How many years of experience does the doctor have? (Enter integer only): ");
                                int newdoctorExperience = int.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the room number of the doctor: ");
                                int newdoctorRoomNum = int.Parse(Console.ReadLine()!);
                                doctor = new Doctor(newdoctorID, newdoctorName, newdoctorContactType, newdoctorContactDetail, newdoctorCurrency, newdoctorNationality, newdoctorAmount, newdoctorGender, newdoctorDOB, newdoctorSpecialty, newdoctorBranch, newdoctorWorkPhone, newdoctorWorkEmail, newdoctorExperience, newdoctorRoomNum);
                                Doctor newDoctor2 = management.ReplaceDoctor(doctorIndex, doctor);
                                if (newDoctor2 != management.GetDoctor(doctorIndex) && newDoctor2 == management.FindDoctorByID(doctor.DIDDetail().ToString()))
                                {
                                    Console.WriteLine("Doctor replaced successfully.");
                                }
                                else
                                {
                                    Console.WriteLine("Failed to replace a doctor! Operation aborted.");
                                }
                                break;
                            case 39:
                                Console.WriteLine("Enter the index of the case list (type \"-1\" if you do not know the index): ");
                                int caseIndex = int.Parse(Console.ReadLine()!);
                                if (caseIndex == -1) break;
                                Console.WriteLine("Enter the allergy: ");
                                string newallergy = Console.ReadLine()!;
                                Console.WriteLine("Enter the symptom: ");
                                string newsymptom = Console.ReadLine()!;
                                Console.WriteLine("Enter the diagnosis: ");
                                string newdiagnosis = Console.ReadLine()!;
                                Console.WriteLine("Enter the condition: ");
                                string newcondition = Console.ReadLine()!;
                                Console.WriteLine("Enter the hospital: ");
                                string newhospital = Console.ReadLine()!;
                                Console.WriteLine("Enter the discovery date (YYYY-MM-DD): ");
                                DateTime newdiscoveryDate = DateTime.Parse(Console.ReadLine()!);
                                Case = new Case(newallergy, newsymptom, newcondition, newhospital, newdiscoveryDate, newdiagnosis);
                                Case newCase = management.ReplaceCase(caseIndex, Case);
                                if (newCase != management.GetCase(caseIndex) && newCase == management.FindCaseByID(newCase.CIDDetail().ToString()))
                                {
                                    Console.WriteLine("Case replaced successfully.");
                                }
                                else
                                {
                                    Console.WriteLine("Failed to replace a case! Operation aborted.");
                                }
                                break;
                            case 40:
                                Console.WriteLine("Enter the index of the test list (type \"-1\" if you do not know the index): ");
                                int testIndex = int.Parse(Console.ReadLine()!);
                                if (testIndex == -1) break;
                                Console.WriteLine("Enter the test result: ");
                                string newtestResult = Console.ReadLine()!;
                                Console.WriteLine("Enter the test name: ");
                                string newtestName = Console.ReadLine()!;
                                Console.WriteLine("Enter the test code: ");
                                string newtestCode = Console.ReadLine()!;
                                Console.WriteLine("Enter the discharge date (YYYY-MM-DD): ");
                                DateTime newdischarge = DateTime.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the visit date (YYYY-MM-DD): ");
                                DateTime newvisitDate = DateTime.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the room number: ");
                                int newroomNum = int.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the visit number: ");
                                int newvisitNum = int.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the hospital: ");
                                string newtestHospital = Console.ReadLine()!;
                                Console.WriteLine("Enter the unit used for the test: ");
                                string newtestUnit = Console.ReadLine()!;
                                Console.WriteLine("Enter the value of the test: ");
                                float newvalueNum = float.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the low value of the test: ");
                                float newvalueLow = float.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the high value of the test: ");
                                float newvalueHigh = float.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the previous value of the test: ");
                                float newvaluePrev = float.Parse(Console.ReadLine()!);
                                Console.WriteLine("Enter the ID of the patient for the test: ");
                                string newtestPatientID = Console.ReadLine()!;
                                patient = management.FindPatientByID(newtestPatientID);
                                test = new Test(newtestResult, newdischarge, newvisitDate, newroomNum, newvisitNum, newtestHospital, newtestName, newtestCode, newtestUnit, newvalueNum, newvalueLow, newvalueHigh, newvaluePrev, patient);
                                management.AddTest(test);
                                break;
                            case 41:
                                Console.WriteLine("Enter the index of the test list (type \"-1\" if you do not know the index): ");
                                int appointmentIndex = int.Parse(Console.ReadLine()!);
                                if (appointmentIndex == -1) break;
                                Console.WriteLine("Enter the patient ID: ");
                                string newappointmentPatientID = Console.ReadLine()!;
                                patient = management.FindPatientByID(newappointmentPatientID);
                                Console.WriteLine("Enter the doctor ID: ");
                                string newappointmentDoctorID = Console.ReadLine()!;
                                doctor = management.FindDoctorByID(newappointmentDoctorID);
                                Console.WriteLine("Enter the appointment date (YYYY-MM-DD): ");
                                DateTime newappointmentDate = DateTime.Parse(Console.ReadLine()!);
                                appointment!.ShowReason();
                                Console.WriteLine("Select one of the reasons above and Enter the reason for the appointment: ");
                                string newappointmentReason = Console.ReadLine()!;
                                appointment.ShowTitle();
                                Console.WriteLine("Select one of the titles above and Enter the appointment title: ");
                                string newappointmentTitle = Console.ReadLine()!;
                                appointment.ShowStatus();
                                Console.WriteLine("Select one of the status above and Enter the appointment status: ");
                                string newappointmentStatus = Console.ReadLine()!;
                                appointment = new Appointment(patient, doctor, newappointmentDate, newappointmentReason, newappointmentTitle, newappointmentStatus);
                                Appointment newAppointment = management.ReplaceAppointment(appointmentIndex, appointment);
                                if (newAppointment != management.GetAppointment(appointmentIndex) && newAppointment == management.FindAppointmentByID(newAppointment.AIDDetail().ToString()))
                                {
                                    Console.WriteLine("Appointment replaced successfully.");
                                }
                                else
                                {
                                    Console.WriteLine("Failed to replace an appointment! Operation aborted.");
                                }
                                break;
                            case 42:
                                Console.WriteLine("Enter the ID of the person: ");
                                person = management.FindPersonByID(Console.ReadLine()!);
                                Console.WriteLine($"Result:\n{person}");
                                break;
                            case 43:
                                Console.WriteLine("Enter the ID of the user: ");
                                user = management.FindUserByID(Console.ReadLine()!);
                                Console.WriteLine($"Result:\n{user}");
                                break;
                            case 44:
                                Console.WriteLine("Enter the ID of the patient: ");
                                patient = management.FindPatientByID(Console.ReadLine()!);
                                Console.WriteLine($"Result:\n{patient}");
                                break;
                            case 45:
                                Console.WriteLine("Enter the ID of the doctor: ");
                                doctor = management.FindDoctorByID(Console.ReadLine()!);
                                Console.WriteLine($"Result:\n{doctor}");
                                break;
                            case 46:
                                Console.WriteLine("Enter the ID of the case: ");
                                Case = management.FindCaseByID(Console.ReadLine()!);
                                Console.WriteLine($"Result:\n{Case}");
                                break;
                            case 47:
                                Console.WriteLine("Enter the Code of the test: ");
                                test = management.FindTestByCode(Console.ReadLine()!);
                                Console.WriteLine($"Result:\n{test}");
                                break;
                            case 48:
                                Console.WriteLine("Enter the ID of the appointment: ");
                                appointment = management.FindAppointmentByID(Console.ReadLine()!);
                                Console.WriteLine($"Result:\n{appointment}");
                                break;
                            case 49:
                                Console.WriteLine("Enter the index from the patient list (type \"-1\" if you do not know the index): ");
                                int patientIndex2 = int.Parse(Console.ReadLine()!);
                                Console.WriteLine($"Result:\n{management.GetPatient(patientIndex2)}");
                                break;
                            case 50:
                                Console.WriteLine("Enter the index from the doctor list (type \"-1\" if you do not know the index): ");
                                int doctorIndex2 = int.Parse(Console.ReadLine()!);
                                Console.WriteLine($"Result:\n{management.GetDoctor(doctorIndex2)}");
                                break;
                            case 51:
                                Console.WriteLine("Enter the index from the case list (type \"-1\" if you do not know the index): ");
                                int caseIndex2 = int.Parse(Console.ReadLine()!);
                                Console.WriteLine($"Result:\n{management.GetCase(caseIndex2)}");
                                break;
                            case 52:
                                Console.WriteLine("Enter the index from the test list (type \"-1\" if you do not know the index): ");
                                int testIndex2 = int.Parse(Console.ReadLine()!);
                                Console.WriteLine($"Result:\n{management.GetTest(testIndex2)}");
                                break;
                            case 53:
                                Console.WriteLine("Enter the index from the appointment list (type \"-1\" if you do not know the index): ");
                                int appointmentIndex2 = int.Parse(Console.ReadLine()!);
                                Console.WriteLine($"Result:\n{management.GetAppointment(appointmentIndex2)}");
                                break;
                            case 54:
                                management.GetPersonCount();
                                break;
                            case 55:
                                management.GetUserCount();
                                break;
                            case 56:
                                management.GetPatientCount();
                                break;
                            case 57:
                                management.GetDoctorCount();
                                break;
                            case 58:
                                management.GetCaseCount();
                                break;
                            case 59:
                                management.GetTestCount();
                                break;
                            case 60:
                                management.GetAppointmentCount();
                                break;
                            default:
                                Console.WriteLine("Invalid option! Please enter a number from the list.");
                                break;
                        }
                    }
                    while (option != 0 && success);
                }
                Console.WriteLine("Hello, World!");
                Console.WriteLine("Welcome to the Medical App!");
                Console.WriteLine("Choose from the list:");
                Console.WriteLine("(0) Exit");
                Console.WriteLine("(1) Register");
                Console.WriteLine("(2) Login");
                Console.WriteLine("Enter the number: ");
                choice = int.Parse(Console.ReadLine()!);
            }
            Console.WriteLine("Exiting the application. Goodbye!");
            Environment.Exit(0);
        }
    }
}
