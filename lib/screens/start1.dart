import 'package:flutter/material.dart';

class StartScreen1 extends StatelessWidget {
  const StartScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(child: Image.asset('assets/images/image 1.png',
            height: 500,
            width: 550,),),
            const Text('SAVE LIFE',style: TextStyle(
            color: Colors.red,
            fontSize: 40,
            fontWeight: FontWeight.w900,
          ),),
          const Text('Blood donation plays a crucial role in saving lives by providing essential blood components to patients in need, ensuring timely medical treatments, and promoting community solidarity through a simple yet impactful act.',
          style: TextStyle(
            fontSize: 18,
          ),),
          ],
        ),
      ),
      
    );
  }
}