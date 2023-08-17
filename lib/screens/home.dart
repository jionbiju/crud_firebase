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
       stream:donor.orderBy('name').snapshots() ,
       builder:(context, AsyncSnapshot snapshot) {
         if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot donorsnap=snapshot.data.docs[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 166, 167, 168),
                        blurRadius: 10,
                        spreadRadius: 15,
                      ),
                    ],
                  ),
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.red,
                            child: Text(donorsnap['blood group'],style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),),
                          ), 
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
                      Row(
                        children: [
                          IconButton(onPressed: (){
                            Navigator.pushNamed(context, 'update',
                            arguments: {
                              'name':donorsnap['name'],
                              'phone number':donorsnap['phone number'].toString(),
                              'blood group':donorsnap['blood group'],
                              'id':donorsnap.id,
                            },);
                          },
                          icon: Icon(Icons.edit),
                          iconSize: 25,
                          color: Colors.blue,
                          hoverColor: Colors.red,),
                          IconButton(onPressed: (){}, 
                          icon: Icon(Icons.delete),
                          color: const Color.fromARGB(255, 255, 17, 0),
                          iconSize: 25,),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },);
         }
         return Container();
       },),
    );
  }
}
