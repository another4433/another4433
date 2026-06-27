import 'package:flutter/material.dart';
import 'package:medical_app/user.dart';
import 'package:medical_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileViewing extends StatefulWidget {
  const ProfileViewing({super.key, required this.theService});

  final AuthService theService;

  @override
  State<ProfileViewing> createState() => _ProfileViewingState();
}

class _ProfileViewingState extends State<ProfileViewing> {
  TheUser? selectedUser;
  String id = "not found",
      name = "not found",
      gender = "not found",
      nationality = "not found",
      currency = "not found",
      email = "not found",
      password = "hidden";
  int age = 0;
  DateTime birthDate = DateTime.now();
  double money = 0;
  bool found = false;
  @override
  Widget build(BuildContext context) {
    if (TheUser.getUsers().isNotEmpty) {
      for (TheUser usering in TheUser.getUsers()) {
        if (usering.getEmail() == widget.theService.getCurrentUser()!.email) {
          selectedUser = usering;
          found = true;
          break;
        }
      }
    }
    if (found) {
      id = selectedUser!.getId();
      name = selectedUser!.getName();
      gender = selectedUser!.getGender();
      nationality = selectedUser!.getNationality();
      currency = selectedUser!.getCurrency();
      money = selectedUser!.getMoney();
      age = selectedUser!.getAge();
      birthDate = selectedUser!.getBirthDate();
      password = TheUser.decrypt(selectedUser!.getPassword())[1];
    }
    email = widget.theService.getCurrentUser()!.email!;
    return Scaffold(
      appBar: AppBar(title: Text("Profile View")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(child: ListTile(leading: Text("ID"), title: Text(id))),
            Card(child: ListTile(leading: Text("Name"), title: Text(name))),
            Card(
              child: ListTile(
                leading: Text("Bithdate: "),
                title: Text(birthDate.toString()),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text("Age: "),
                title: Text(age.toString()),
              ),
            ),
            Card(child: ListTile(leading: Text("Gender"), title: Text(gender))),
            Card(
              child: ListTile(leading: Text("Currency"), title: Text(currency)),
            ),
            Card(
              child: ListTile(
                leading: Text("Money: "),
                title: Text(money.toString()),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text("Nationality: "),
                title: Text(nationality),
              ),
            ),
            Card(child: ListTile(leading: Text("Email: "), title: Text(email))),
            Card(
              child: ListTile(leading: Text("Password"), title: Text(password)),
            ),
          ],
        ),
      ),
      bottomSheet: ElevatedButton(
        onPressed: () {
          setState(() {
            widget.theService.signOut();
            widget.theService.theAuth.authStateChanges().listen((User? user) {
              if (user == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("User successfully signed out!"),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => MyApp()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("User Failed to sign out! Try Again."),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            });
          });
        },
        child: Text("Sign Out"),
      ),
    );
  }
}
