import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final bloodGroup=['A+','A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String? selectedbloodgroups;
  final CollectionReference donor=FirebaseFirestore.instance.collection('donor');
  TextEditingController donorname=TextEditingController();
  TextEditingController  donorphone=TextEditingController();
  void adduserdata(){
    final data={
      'name':donorname.text,
      'phone number':donorphone.text.toString(),
      'blood group':selectedbloodgroups,
    };
    donor.add(data);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Donor data added'),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Color.fromARGB(255, 153, 149, 149),
    margin: EdgeInsets.all(10),));
  }


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
           TextField(
            controller: donorname,
              decoration:const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Donor Name' ) ,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
             Padding(
              padding:const EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                controller: donorphone,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration:const InputDecoration(
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
            onPressed: (){
              adduserdata();
            },
            child:const Text('Submit', style: TextStyle(fontSize: 25),)),
          ],
        ),
      ),
    );
  }
}