class Person {
  String _name = "", _id = "", _currency = "", _nationality = "", _gender = "";
  int _age = 0;
  DateTime _birthDate = DateTime.now();
  double _money = 0.0;
  static final List<Person> _people = List.empty(growable: true);
  Person(
    this._name,
    this._id,
    this._birthDate,
    this._money,
    this._currency,
    this._nationality,
    this._gender,
  ) {
    _age = calculateAge();
  }

  String getName() {
    return _name;
  }

  String getId() {
    return _id;
  }

  void setName(String name) {
    _name = name;
  }

  void setId(String id) {
    _id = id;
  }

  void setAge(int age) {
    _age = age;
  }

  void setBirthDate(DateTime birthDate) {
    _birthDate = birthDate;
  }

  void setMoney(double money) {
    _money = money;
  }

  void setCurrency(String currency) {
    _currency = currency;
  }

  void setGender(String gender) {
    _gender = gender;
  }

  void setNationality(String nationality) {
    _nationality = nationality;
  }

  int getAge() {
    return _age;
  }

  DateTime getBirthDate() {
    return _birthDate;
  }

  double getMoney() {
    return _money;
  }

  String getCurrency() {
    return _currency;
  }

  String getNationality() {
    return _nationality;
  }

  String getGender() {
    return _gender;
  }

  int calculateAge() {
    DateTime currentDate = DateTime.now();
    return currentDate.year - _birthDate.year;
  }

  DateTime birthDateToDatetime() {
    return _birthDate;
  }

  static List<Person> getPeople() {
    return _people;
  }
}
