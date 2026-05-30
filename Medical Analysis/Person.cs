using System;

public class Person
{
	private string ID, Name, ContactType, ContactinDetail, Currency, Nationality;
	private int Age;
	private double Amount;
	private char Gender;
	private DateTime DOB;
	public Person()
	{
		ID = 0.ToString();
        Name = "NA";
        ContactType = "NA";
		Currency = "";
        Nationality = "NA";
        ContactinDetail = "NA";
        Age = 0;
        Amount = 0.0;
        Gender = 'N';
        DOB = DateTime.MinValue;
    }
    public Person(string ID, string Name, string ContactType, string ContactinDetail, string Currency, string Nationality, double Amount, char Gender, DateTime DOB)
    {
        this.ID = ID;
        this.Name = Name;
        this.ContactType = ContactType;
        this.ContactinDetail = ContactinDetail;
        this.Currency = Currency;
        this.Gender = Gender;
        this.Age = CalculateAge(DOB);
        this.DOB = DOB;
        this.Amount = (Amount < 0) ? 0 : Amount;
        this.Nationality = Nationality;
    }
    public string IDDetail { get => ID; set => ID = value; }
    public string NameDetail { get => Name; set => Name = value; }
    public string ContactTypeDetail { get => ContactType; set => ContactType = value; }
    public string ContactTheDetail { get => ContactinDetail; set => ContactinDetail = value; }
    public string CurrencyDetail { get => Currency; set => Currency = value; }
    public string NationalityDetail { get => Nationality; set => Nationality = value; }
    public int AgeDetail { get => Age; set => Age = value; }
    public double AmountDetail
    {
        get => Amount; set => Amount = value;
    }
    public char GenderDetail
    {
        get => Gender; set => Gender = value;
    }
    public DateTime DOBDetail
    {
        get => DOB; set => DOB = value;
    }
    public int CalculateAge(DateTime Attempt)
    {
        int age = DateTime.Now.Year - Attempt.Year;
        if (DateTime.Now.DayOfYear < DOB.DayOfYear)
            age--;
        return age;
    }
    public override string ToString()
    {
        return $"Person Details:\n ID: {IDDetail}\n Name: {NameDetail}\n ContactType: {ContactTypeDetail}\n ContactDetail: {ContactTheDetail}\n Date of birth: {DOBDetail}\n Age: {AgeDetail}\n Gender: {GenderDetail}\n Money: {CurrencyDetail} {AmountDetail}\n Nationality: {NationalityDetail}";
    }
    public void Display()
    {
        Console.WriteLine(this.ToString());
    }
}
