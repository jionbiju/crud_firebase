import 'package:crud_firebase/screens/home.dart';
import 'package:crud_firebase/screens/start1.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    gotohome(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Image.asset('assets/images/initial_screen.png',
      height: 400,
      width: 400,)
      ,),
    
    );
  }

  Future<void> gotohome(BuildContext context) async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>StartScreen1()));
  }
}