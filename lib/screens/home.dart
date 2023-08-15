import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CollectionReference donor=FirebaseFirestore.instance.collection('donor');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title:const Text('Blood Donation App'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, '/add');
      },
      backgroundColor: Colors.red,
      child:const Icon(Icons.add,size: 35,),),
      body: StreamBuilder(
       stream:donor.snapshots() ,
       builder:(context, AsyncSnapshot snapshot) {
         if(snapshot.hasData){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot donorsnap=snapshot.data.docs[index];
                return Container(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.red,
                          child: Text(donorsnap['blood group'],style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),),
                        ), 
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text(donorsnap['name'],style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),),
                        Text(donorsnap['phone number'].toString(),style: TextStyle(
                          fontSize: 19,
                        ),),
                      ],),
                    ],
                  ),
                );
              },),
          );
         }
         return Container();
       },),
    );
  }
}
