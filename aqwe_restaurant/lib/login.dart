import 'main.dart';
import 'package:flutter/material.dart';
import 'firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';

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
  runApp(const MyLogin());
}

class MyLogin extends StatelessWidget {
  const MyLogin({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant with different tabs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lime),
      ),
      home: const MyAccount(title: 'Account Page'),
    );
  }
}

class MyAccount extends StatefulWidget {
  const MyAccount({super.key, required this.title});

  final String title;

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  AuthService theServices = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Center(
            child: Title(
              color: Colors.blueGrey,
              child: Text(
                "AQWE Restaurant",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'sans-serif',
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: controllerEmail,
            decoration: InputDecoration(
              iconColor: Colors.black,
              icon: Icon(Icons.email),
              border: OutlineInputBorder(),
              labelText: "Email",
              hintText: "Enter your email",
            ),
          ),
          SizedBox(height: 5),
          TextField(
            controller: controllerPassword,
            decoration: InputDecoration(
              iconColor: Colors.black,
              icon: Icon(Icons.password),
              border: OutlineInputBorder(),
              labelText: "Password",
              hintText: "Enter your password",
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            child: Text("Continue as a guest"),
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => MyApp()),
                );
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                theServices.createUser(
                  controllerEmail.text,
                  controllerPassword.text,
                  context,
                );
                if (theServices.checker) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => MyApp(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Your account might be created. Try signing in to your account!",
                      ),
                    ),
                  );
                }
              });
            },
            child: Text("Register"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                theServices.signIn(
                  controllerEmail.text,
                  controllerPassword.text,
                  context,
                );
                if (theServices.checker) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => MyApp(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Try signing in to your account again!"),
                    ),
                  );
                }
              });
            },
            child: Text("Sign-In"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                theServices.signInWithGoogle(context);
                if (theServices._isGoogleSignInInitialized &&
                    theServices.checker) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => MyApp(),
                    ),
                  );
                }
              });
            },
            child: Text("Continue with Google"),
          ),
        ],
      ),
      bottomSheet: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  theServices.launchMail();
                });
              },
              child: Text("Contact the restaurant"),
            ),
            Text(
              "If you want to confirm deleting your food, click on the button above and specify it including your current email.",
            ),
          ],
        ),
      ),
    );
  }
}

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get theCurrentUser => _firebaseAuth.currentUser;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  bool _isGoogleSignInInitialized = false, checker = false;

  Future<GoogleSignInAccount?> handleSignIn() async {
    // Check if the platform supports the new authenticate method
    if (_googleSignIn.supportsAuthenticate()) {
      // Use the new `authenticate` method for the sign-in flow:cite[6]
      final GoogleSignInAccount user = await _googleSignIn.authenticate();
      return user;
    }
    // Handle other platforms or fallback methods if needed
    return null;
  }

  Future<User?> createUser(String email, String password, context) async {
    try {
      UserCredential? theUser = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return theUser.user;
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder:
            (BuildContext context) => AlertDialog(
              title: Text("Account Error!"),
              content: Text(e.toString()),
              icon: Icon(Icons.error_outline),
              backgroundColor: Colors.lightGreenAccent,
              iconColor: Colors.black,
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, "OK"),
                  child: Text("OK"),
                ),
              ],
            ),
      );
      return null;
    }
  }

  Future<void> _initializeGoogleSignIn(context) async {
    try {
      await _googleSignIn.initialize();
      _isGoogleSignInInitialized = true;
    } catch (e) {
      showDialog(
        context: context,
        builder:
            (BuildContext context) => AlertDialog(
              title: Text("Google Server Error!"),
              content: Text('Failed to initialize Google Sign-In: $e'),
              icon: Icon(Icons.error_outline),
              backgroundColor: Colors.lightGreenAccent,
              iconColor: Colors.black,
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

  Future<void> _ensureGoogleSignInInitialized(context) async {
    if (!_isGoogleSignInInitialized) {
      await _initializeGoogleSignIn(context);
    }
  }

  Future<String?> getValidAccessToken(GoogleSignInAccount user, context) async {
    try {
      // Define the scopes you need the token for
      const List<String> scopes = <String>[
        'https://www.googleapis.com/auth/fitness.activity.read',
      ];

      // Check for existing authorization for these scopes
      final GoogleSignInClientAuthorization? authorization = await user
          .authorizationClient
          .authorizationForScopes(scopes);

      // If not already authorized, request authorization from the user
      final GoogleSignInClientAuthorization finalAuthorization =
          authorization ??
          await user.authorizationClient.authorizeScopes(scopes);

      return finalAuthorization.accessToken;
    } catch (error) {
      showDialog(
        context: context,
        builder:
            (BuildContext context) => AlertDialog(
              title: Text("Application Error!"),
              content: Text('Failed to get access token: $error'),
              icon: Icon(Icons.error_outline),
              backgroundColor: Colors.lightGreenAccent,
              iconColor: Colors.black,
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, "OK"),
                  child: Text("OK"),
                ),
              ],
            ),
      );
      return null;
    }
  }

  Future<UserCredential?> signInWithGoogle(context) async {
    await _ensureGoogleSignInInitialized(context);

    try {
      // 1. Authenticate with Google:cite[1]:cite[9]
      final GoogleSignInAccount? googleUser = await handleSignIn();

      // 2. Obtain auth details (now synchronous):cite[9]
      final GoogleSignInAuthentication googleAuth = googleUser!.authentication;
      String? theToken = await getValidAccessToken(googleUser, context);

      // 3. Create a Firebase Auth credential:cite[1]
      final credential = GoogleAuthProvider.credential(
        accessToken: theToken,
        idToken: googleAuth.idToken,
      );

      if (googleUser.email != "" && _firebaseAuth.currentUser!.email != null) {
        checker = true;
      }
      // 4. Sign in to Firebase with credentials:cite[1]
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder:
            (BuildContext context) => AlertDialog(
              title: Text("Server Error!"),
              content: Text('Firebase Auth error: ${e.code} - ${e.message}'),
              icon: Icon(Icons.error_outline),
              backgroundColor: Colors.lightGreenAccent,
              iconColor: Colors.black,
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, "OK"),
                  child: Text("OK"),
                ),
              ],
            ),
      );
      return null;
    } on GoogleSignInException catch (e) {
      showDialog(
        context: context,
        builder:
            (BuildContext context) => AlertDialog(
              title: Text("Google Account Error!"),
              content: Text(
                'Google Sign-In error: ${e.code.name} - ${e.description}',
              ),
              icon: Icon(Icons.error_outline),
              backgroundColor: Colors.lightGreenAccent,
              iconColor: Colors.black,
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, "OK"),
                  child: Text("OK"),
                ),
              ],
            ),
      );
      return null;
    }
  }

  Future<User?> signIn(String email, String password, context) async {
    try {
      UserCredential userCredentials = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredentials.user!.email != null) {
        checker = true;
      }
      return (_firebaseAuth.currentUser!.email != "" &&
              userCredentials.user!.email != "")
          ? userCredentials.user
          : null;
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder:
            (BuildContext context) => AlertDialog(
              title: Text("Account Sign-In Error!"),
              content: Text(e.toString()),
              icon: Icon(Icons.error_outline),
              backgroundColor: Colors.lightGreenAccent,
              iconColor: Colors.black,
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, "OK"),
                  child: Text("OK"),
                ),
              ],
            ),
      );
      return null;
    }
  }

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
              iconColor: Colors.black,
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

  Future<void> launchMail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'alimohamedhassan9@outlook.com',
      // You can also pre-fill the subject and body.
      queryParameters: {
        'subject': 'Food_Permenant_Removal_Request',
        'body': 'Hello,_I_have_a_request...',
      },
    );
    await launchUrl(emailUri);
  }
}
