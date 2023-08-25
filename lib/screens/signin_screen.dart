

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/initial_screen.png',
              height:190,
              width: 190 ,),
               TextFormField(
                controller: emailController,
                keyboardType: TextInputType.text,
                decoration:const InputDecoration(
                  prefixIcon: Icon(Icons.account_circle_rounded),
                  prefixIconColor: Colors.red,
                  hintText: 'Email',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 0, 191, 249),
                      strokeAlign: BorderSide.strokeAlignInside,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration:const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  prefixIconColor: Colors.red,
                  hintText: 'Password',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 0, 191, 249),
                      strokeAlign: BorderSide.strokeAlignInside,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
              style: ButtonStyle(
                minimumSize:const MaterialStatePropertyAll(Size(double.infinity, 45)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
               RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                      )
                   )
                ),
              onPressed: (){loginButton(context);}, child: const Text('Login',style: TextStyle(
                fontSize: 23,
              ),)),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Text("Don't have account?"),
                TextButton(onPressed: (){Navigator.pushNamed(context, 'tosignup');}, child:const Text('Sign Up'))
              ],),
            ],
          ),
        ),
      ),
    );
  }
  loginButton(BuildContext context){
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text).then((value){
        print('logined');
        Navigator.pushNamed(context, 'skip');
      }).onError((error, stackTrace) {
        print("Error ${error.toString()}");
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invalid Email or Password'),
         behavior: SnackBarBehavior.floating,
         backgroundColor: Color.fromARGB(255, 255, 0, 0),
         margin: EdgeInsets.all(15),));
      });
      
      
  }
}