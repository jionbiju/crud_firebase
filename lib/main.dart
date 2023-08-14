import 'package:crud_firebase/screens/adduser.dart';
import 'package:crud_firebase/screens/home.dart';
import 'package:crud_firebase/screens/splash.dart';
import 'package:flutter/material.dart';

void main() {
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
        home: const Splashscreen(),
        
    );
  }
}