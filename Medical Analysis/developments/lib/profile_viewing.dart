import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_app/user.dart';

class ProfileViewing extends StatefulWidget {
  const ProfileViewing({super.key, required this.retrievedUser});

  final User retrievedUser;

  @override
  State<ProfileViewing> createState() => _ProfileViewingState();
}

class _ProfileViewingState extends State<ProfileViewing> {
  TheUser? selectedUser;
  @override
  Widget build(BuildContext context) {
    if (TheUser.getUsers().isNotEmpty) {
      for (TheUser usering in TheUser.getUsers()) {
        if (usering.getEmail() == widget.retrievedUser.email) {
          selectedUser = usering;
        }
      }
    }
    return Scaffold(
      appBar: AppBar(title: Text("Profile View")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: Text("ID"),
                title: Text(selectedUser!.getId()),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text("Name"),
                title: Text(selectedUser!.getName()),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text("Bithdate"),
                title: Text(selectedUser!.getBirthDate().toString()),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text("Age"),
                title: Text(selectedUser!.getAge().toString()),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text("Gender"),
                title: Text(selectedUser!.getGender()),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text("Currency"),
                title: Text(selectedUser!.getCurrency()),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text("Money"),
                title: Text(selectedUser!.getMoney().toString()),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text("Nationality"),
                title: Text(selectedUser!.getNationality()),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text("Email"),
                title: Text(selectedUser!.getEmail()),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text("Password"),
                title: Text(
                  TheUser.decrypt(selectedUser!.getPassword())[1].toString(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
