import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

// Initialize Firebase
const firebaseConfig = FirebaseOptions(
  apiKey: "AIzaSyDGeen6fUcfp3Fp19bo20n6Iu94S8jrsU8",
  appId: "1:824820585467:web:65fd18841e6e4a2859f15e",
  messagingSenderId: "824820585467",
  projectId: "aqwe-restaurant",
  authDomain: "aqwe-restaurant.firebaseapp.com",
  storageBucket: "aqwe-restaurant.firebasestorage.app",
  measurementId: "G-NPVBHX1XVX",
);

// Initialize Firebase
FirebaseApp app = Firebase.app();
FirebaseFirestore analytics = FirebaseFirestore.instanceFor(app: app);
