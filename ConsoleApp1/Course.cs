using System;

namespace Proparation;

public class Course
{
	private string _name, _code, _letter;
	private double _credits;
    public Course()
	{
		_name = "Unknown";
		_code = "0000";
		_letter = "F";
		_credits = 0.0;
    }
	public Course(string name, string code, string letter)
	{
		this._name = name;
		this._code = code;
		this._letter = letter;
		_credits = 0.0;
    }
	public string Name
	{
		get { return _name; }
		set { _name = value; }
    }
	public string Code
	{
		get { return _code; }
		set { _code = value; }
    }
	public string Letter
	{
		get { return _letter; }
		set { _letter = value; }
    }
	public double Credits
	{
		get { return _credits; }
		set
		{
			if (value < 0.0)
				throw new ArgumentOutOfRangeException("Credits cannot be negative.");
			_credits = value;
        }
    }
	public override string ToString()
	{
		return $"{_name} ({_code}) - Grade: {_letter}, Credits: {_credits}";
    }
	public override bool Equals(object? obj)
	{
		return obj is Course course &&
			   _name == course._name &&
			   _code == course._code &&
			   _letter == course._letter &&
			   _credits == course._credits;
    }
	public override int GetHashCode()
	{
		return HashCode.Combine(_name, _code, _letter, _credits);
    }
	public void Display()
	{
		Console.WriteLine($"Course Name: {_name}");
		Console.WriteLine($"Course Code: {_code}");
		Console.WriteLine($"Letter Grade: {_letter}");
		Console.WriteLine($"Credits: {_credits}");
    }
}
