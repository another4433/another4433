import 'package:aqwe_restaurant/login.dart';
import 'package:flutter/material.dart';
import 'package:aqwe_restaurant/pizza.dart';
import 'package:aqwe_restaurant/shawarma.dart';
import 'package:aqwe_restaurant/firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDsuTpekSZFyQyQB0Pao2090sVqYB4r7Jc",
      projectId: firebaseConfig.projectId,
      messagingSenderId: firebaseConfig.messagingSenderId,
      appId: "1:824820585467:android:ac7d948266f268d259f15e",
    ),
  );
  runApp(const MyApp());
}

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get theCurrentUser => _firebaseAuth.currentUser;

  Future<void> signOut(context) async {
    try {
      await _firebaseAuth.signOut();
      _firebaseAuth.authStateChanges();
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder:
            (BuildContext context) => AlertDialog(
              title: Text("Account Sign-Out Error!"),
              content: Text(e.toString()),
              icon: Icon(Icons.error_outline),
              backgroundColor: Colors.green,
              iconColor: Colors.white,
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, "OK"),
                  child: Text("OK"),
                ),
              ],
            ),
      );
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant with different tabs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lime),
      ),
      home: const MyHomePage(title: 'AQWE Restaurant'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AuthService theService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    theService.signOut(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => MyLogin(),
                      ),
                    );
                  });
                },
                icon: Icon(Icons.exit_to_app_outlined),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          icon: Icon(Icons.account_balance_outlined),
                          title: Text("Account Information"),
                          content: Text(
                            "Email: ${FirebaseAuth.instance.currentUser!.email}\nPassword: \"HIDDEN\"",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                              child: Text("Ok"),
                            ),
                          ],
                        ),
                  );
                },
                icon: Icon(Icons.person),
              ),
            ],
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.local_pizza, color: Colors.white),
                  child: Text(
                    "Pizza",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  icon: Icon(Icons.food_bank, color: Colors.white),
                  child: Text(
                    "Shawarma/Burger",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(children: [OrderPizza(), AddShawarma()]),
        ),
      ),
    );
  }
}
