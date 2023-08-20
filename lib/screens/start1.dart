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
            
            const Text('SAVE LIFE',
            style: TextStyle(
            color: Colors.red,
            fontSize: 45,
            fontWeight: FontWeight.w900,
            decorationThickness: BorderSide.strokeAlignOutside,
                    ),),
          const SizedBox(
              height: 7,
            ),
          const Text('Blood donation plays a crucial role in saving lives by providing essential blood components to patients in need, ensuring timely medical treatments, and promoting community solidarity through a simple yet impactful act.',
          textAlign: TextAlign.center,
          style: TextStyle(
          fontSize: 19
          ),),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 TextButton(
                  style: TextButton.styleFrom(
                    side:const BorderSide(width: 0.6),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  onPressed: (){
                  Navigator.pushNamed(context, 'skip');},
                 child:const Text('skip',style: TextStyle(fontSize: 15),)),
          
          
                 ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, 'tostartscreen2');
                  }, child:const Text('Next'))
              ],
            ),
          ),
          ],
        ),
      ),
      
    );
  }
}