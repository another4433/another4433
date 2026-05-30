using System;

public class User : Person
{
    private string Password;
    public User() : base()
    {
        Password = "NA";
    }
    public User(string ID, string Name, string ContactType, string ContactDetail, string Currency, string Nationality, double Amount, char Gender, DateTime DOB, string Password) : base(ID, Name, ContactType, ContactDetail, Currency, Nationality, Amount, Gender, DOB)
    {
        this.Password = Password;
    } 
    public string UserPassword
    {
        get => Password; set => Password = value;
    }
    public bool ForgetPassword(string ID, string NewPassword)
    {
        if (IDDetail == ID)
        {
            Password = NewPassword;
            return true;
        }
        return false;
    }
    public bool ChangePassword(string OldPassword, string NewPassword)
    {
        if (Password == OldPassword)
        {
            Password = NewPassword;
            return true;
        }
        return false;
    }
    public void ShowUser()
    {
        base.Display();
        Console.WriteLine($"Password: {UserPassword}");
    }
}
