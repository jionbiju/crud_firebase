import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final bloodGroup=['A+','A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String? selectedbloodgroups;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.red,
        title:const Text('Add Donors'),
      ),
      body: Padding(
        padding:const EdgeInsets.all(8.0),
        child: Column(
          children: [
           const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Donor Name' ) ,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Mobile Number' ) ,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: DropdownButtonFormField(
              decoration:const InputDecoration(
                label:Text('Select Blood Group'),
              ),  
              items:
              bloodGroup.map((e) => DropdownMenuItem(
              value: e,
              child: Text(e),
              ))
              .toList(), onChanged: (val){
                selectedbloodgroups=val;
              }),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
            style:const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.red),
              minimumSize: MaterialStatePropertyAll(Size(double.infinity, 50)),
            ),
            onPressed: (){},
            child:const Text('Submit', style: TextStyle(fontSize: 25),)),
          ],
        ),
      ),
    );
  }
}