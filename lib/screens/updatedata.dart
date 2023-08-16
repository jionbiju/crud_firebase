import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UpdateDonor extends StatefulWidget {
  const UpdateDonor({super.key});

  @override
  State<UpdateDonor> createState() => _UpdateDonorState();
}

class _UpdateDonorState extends State<UpdateDonor> {
  final bloodGroup=['A+','A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String? selectedbloodgroups;
  final CollectionReference donor=FirebaseFirestore.instance.collection('donor');
  TextEditingController donorname=TextEditingController();
  TextEditingController  donorphone=TextEditingController();
  


  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_nullable_for_final_variable_declarations
    final Map<dynamic ,dynamic>? arg=ModalRoute.of(context)!.settings.arguments as Map ;
    
    
    return  Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.red,
        title:const Text('Update Donor Details'),
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
              print(arg);
            },
            child:const Text('Upadate', style: TextStyle(fontSize: 25),)),
          ],
        ),
      ),
    );
  }
}