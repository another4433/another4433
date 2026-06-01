import "package:medical_app/person.dart";

class User extends Person {
  String _email = "", _password = "";

  User(
    super._name,
    super._id,
    super._birthDate,
    super._money,
    super._currency,
    super._nationality,
    super._gender,
    this._email,
    this._password,
  );

  void setEmail(String email) {
    _email = email;
  }

  void setPassword(String password) {
    _password = password;
  }

  String getEmail() {
    return _email;
  }

  String getPassword() {
    return _password;
  }
}
