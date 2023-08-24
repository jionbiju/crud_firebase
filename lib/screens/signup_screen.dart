import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController usernamecontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  
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
               height: 190,
               width: 190,),
               TextFormField(
                controller: usernamecontroller,
                keyboardType: TextInputType.text,
                decoration:const InputDecoration(
                  prefixIcon: Icon(Icons.account_circle_rounded),
                  prefixIconColor: Colors.red,
                  hintText: 'UserName',
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
                controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
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
                controller: passwordcontroller,
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
              onPressed: (){signupButton(context);}, child: const Text('SignUp',style: TextStyle(
                fontSize: 23,
              ),
              )), 
            ],
          ),
        ),
      ),
    );
  }

signupButton(BuildContext context){
  FirebaseAuth.instance.createUserWithEmailAndPassword(
  email: emailcontroller.text, 
  password: passwordcontroller.text);
  
  Navigator.pushNamed(context, 'skip');
  print('New account created');
  
}
}