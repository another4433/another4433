import "package:medical_app/person.dart";

class User extends Person {
  String _email = "", _password = "";
  static final List<User> _users = List.empty(growable: true);

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

  static List<User> getUsers() {
    return _users;
  }

  static String encrypt(String username, String password) {
    String encryptedUsername = username.split('').reversed.join();
    String encryptedPassword = password.split('').reversed.join();
    String combined = "${encryptedPassword}email$encryptedUsername";
    String test = "";
    for (int i = 0; i < combined.length; i += 5) {
      if (i > 0) {
        for (int j = i - 5; j <= i; j++) {
          test += combined[j];
        }
        if (test == "email" &&
            combined.substring(
                  combined.indexOf(test[0]),
                  combined.indexOf(test[test.length - 1]) + 1,
                ) ==
                "email") {
          String temp = combined[combined.indexOf(test[0])];
          combined.replaceFirst(
            combined[combined.indexOf(test[0])],
            combined[combined.length - 1],
          );
          combined.replaceFirst(
            combined[combined.indexOf(test[test.length - 1])],
            temp,
          );
        }
      }
      test = "";
    }
    return combined;
  }

  static List<String> decrypt(String encrypted) {
    String decrypted = encrypted.split('').reversed.join();
    String decombined = encrypted;
    String test = "";
    for (int i = 0; i < decrypted.length; i += 5) {
      if (i > 0) {
        for (int j = i - 5; j <= i; j++) {
          test += decrypted[j];
        }
        if (test == "email" &&
            decrypted.substring(
                  decrypted.indexOf(test[0]),
                  decrypted.indexOf(test[test.length - 1]) + 1,
                ) ==
                "email") {
          String temp = decombined[decombined.indexOf(test[0])];
          decombined.replaceFirst(
            decombined[decombined.indexOf(test[0])],
            decombined[decombined.length - 1],
          );
          decombined.replaceFirst(
            decombined[decombined.indexOf(test[test.length - 1])],
            temp,
          );
        }
      }
      test = "";
    }
    List<String> theUser = decombined.split("email");
    String theEmail = theUser[1].split('').reversed.join();
    String thePassword = theUser[0].split('').reversed.join();
    List<String> theDetails = [theEmail, thePassword];
    return theDetails;
  }
}
