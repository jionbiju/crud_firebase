import 'package:flutter/material.dart';

class StartScreen2 extends StatelessWidget {
  const StartScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(child: Image.asset('assets/images/image2.png',
            height: 500,
            width: 550,),),
            
            const Text('DONATE BLOOD',
            style: TextStyle(
            color: Colors.red,
            fontSize: 45,
            fontWeight: FontWeight.w900,
            decorationThickness: BorderSide.strokeAlignOutside,
                    ),),
          const SizedBox(
              height: 7,
            ),
          const Text("Every drop counts. Be a lifesaver. Donate blood today and make a difference in someone's tomorrow",
          textAlign: TextAlign.center,
          style: TextStyle(
          fontSize: 19
          ),),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 TextButton(
                  style: TextButton.styleFrom(
                    side:const BorderSide(width: 0.6),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  onPressed: (){
                  Navigator.pushNamed(context, 'tosignin');},
                 child:const Text('skip',style: TextStyle(fontSize: 15),)),
                    
                    
                 ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, 'tostartscreen3');
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