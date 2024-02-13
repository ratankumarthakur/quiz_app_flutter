import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sems/constants.dart';

class AuthServices {
  static signupUser(
      String email, String password, String name, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      await FirestoreServices.saveUser(name, email, userCredential.user!.uid,constants.score,"90:00:00.000000");
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration Successful')));
      print("Registration Successful");
      Fluttertoast.showToast(
          msg: "Registration Successful",
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Provided is too weak')));
        print("Password Provided is too weak");
        Fluttertoast.showToast(
            msg: "Password Provided is too weak",
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      } else if (e.code == 'email-already-in-use') {
        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email Provided already Exists')));
        print("Email Provided already Exists");
        Fluttertoast.showToast(
            msg: "Email Provided already Exists",
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    } catch (e) {
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      print(e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  static signinUser(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('You are Logged in')));
      Fluttertoast.showToast(
          msg: "You are Logged in",
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No user Found with this Email");
        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No user Found with this Email')));
        Fluttertoast.showToast(
            msg: "No user Found with this Email",
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      } else if (e.code == 'wrong-password') {
        print("wrong-password");
        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password did not match')));
        Fluttertoast.showToast(
            msg: "Password did not match",
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }
  }
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  static signupUser2(
      String email, String password, String name, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      await FirestoreServices2.saveUser2(name, email, userCredential.user!.uid,"rejected");
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration Successful')));
      print("Registration Successful");
      Fluttertoast.showToast(
          msg: "Registration Successful",
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password Provided is too weak')));
        print("Password Provided is too weak");
        Fluttertoast.showToast(
            msg: "Password Provided is too weak",
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      } else if (e.code == 'email-already-in-use') {
        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email Provided already Exists')));
        print("Email Provided already Exists");
        Fluttertoast.showToast(
            msg: "Email Provided already Exists",
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    } catch (e) {
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      print(e.toString());
      Fluttertoast.showToast(
          msg: e.toString(),
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  static signinUser2(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('You are Logged in')));
      Fluttertoast.showToast(
          msg: "You are Logged in",
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No user Found with this Email");
        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No user Found with this Email')));
        Fluttertoast.showToast(
            msg: "No user Found with this Email",
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      } else if (e.code == 'wrong-password') {
        print("wrong-password");
        //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password did not match')));
        Fluttertoast.showToast(
            msg: "Password did not match",
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }
  }
}
class FirestoreServices2 {
  static saveUser2(String name, email, uid,String result) async {
    await FirebaseFirestore.instance
        .collection('users2')
        .doc(uid)
        .set({'email': email, 'name': name,'uid':uid,'result':result});
  }
}
class FirestoreServices {
  static saveUser(String name, email, uid,int score,var time) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'email': email, 'name': name,'uid':uid,'score':score,'timetaken':time});
  }
}
class AuthService{
  signin_google()async{
    final GoogleSignInAccount? gUser=await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth=await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
