import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sems/instructions.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  String myemail="";
  var q;
  final currentuser = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(11),bottomRight: Radius.circular(11))),
        title: Text("Home page"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout)),

        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/logo.png",height: 300,width: 300,fit: BoxFit.fill,),
              FutureBuilder<String?>(
                future: fetchUsername(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError || snapshot.data == null) {
                    return Text('Welcome to the club',style: TextStyle(fontSize: 25),);
                  } else {
                    return Center(
                      child: Text('Welcome: ${snapshot.data}',style: TextStyle(fontSize: 25)),
                    );
                  }
                },
              ),
              
              const SizedBox(height: 50,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const instructions()));
          
              }
                , child: const Text("Take part in quiz",style: TextStyle(color: Colors.blue),)),
          
            ],
          ),
        ),
      ),
    );
  }
  Future<String?> fetchUsername() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      DocumentSnapshot userSnapshot =
      await FirebaseFirestore.instance.collection('users').doc(currentUser.uid).get();

      return userSnapshot.exists ? userSnapshot['name'] : null;
    }

    return null;
  }
}

//final auth = FirebaseAuth.instance;
//     UserCredential userCredential;
//     try {
//       if (isLoginPage) {
//         userCredential = await auth.signInWithEmailAndPassword(
//             email: email, password: password);
//       } else {
//         userCredential = await auth.createUserWithEmailAndPassword(
//             email: email, password: password);
//         String? uid = userCredential.user?.uid;