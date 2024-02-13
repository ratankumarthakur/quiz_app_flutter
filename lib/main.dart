import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sems/imagetest.dart';
import 'package:sems/imagetest2.dart';
import 'package:sems/imagetest3.dart';
import 'package:sems/imagetest4.dart';
import 'package:sems/imagetest5.dart';
import 'package:sems/imagetest6.dart';
import 'package:sems/login.dart';
import 'package:sems/question1.dart';
import 'home.dart';
import 'l2.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //name: "sems",                      // use // for chrome
      options: const FirebaseOptions(
          apiKey: "AIzaSyArwn6dKr7ppJkjOE45VfQ9OCRih9nClag",
          appId: "1:61768828498:android:b76f9de2883171f460018b",
          messagingSenderId:"61768828498",
          projectId: "sems-4c37f")
  );
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home:StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder:(context,snapshot){
              if(snapshot.hasData){
                return  home();
              }else{
                return  LoginForm();
              }
            }
        )
    );
  }
}
