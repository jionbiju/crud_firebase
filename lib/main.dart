
import 'package:crud_firebase/screens/home.dart';
import 'package:crud_firebase/screens/signin_screen.dart';
import 'package:crud_firebase/screens/signup_screen.dart';
import 'package:crud_firebase/screens/start1.dart';
import 'package:crud_firebase/screens/start2.dart';
import 'package:crud_firebase/screens/start3.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase/screens/adduser.dart';
import 'package:crud_firebase/screens/splash.dart';
import 'firebase_options.dart';
import 'package:crud_firebase/screens/updatedata.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title:'Blood Donation Page',
      theme: ThemeData(
        primaryColor:Colors.red),
        home: const SignInScreen(),
        routes: {
          '/add':(context) =>const AddUser(),
          'update':(context) => const UpdateDonor(),
          'skip':(context) => const HomeScreen(),
          'tostartscreen2':(context) => const StartScreen2(),
          'tostartscreen3':(context) => const StartScreen3(),
          'tosignup':(context) => const SignUpScreen(),
          
        },
    );
  }
}