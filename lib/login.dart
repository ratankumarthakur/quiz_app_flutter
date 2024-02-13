import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sems/constants.dart';

import 'authfunctions.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String fullname = '';
  bool login = false;

   List<MaterialColor> colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

   TextStyle colorizeTextStyle = TextStyle(
    fontSize: 30.0,
    fontFamily: 'Horizon',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.primary,
      appBar: AppBar(
        elevation: 10,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(11),bottomRight: Radius.circular(11))),
        title: Text(login?'Login Page':"Signup Page"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ======== Full Name ========
              login
                  ? Container()
                  : TextFormField(
                key: ValueKey('fullname'),
                decoration: const InputDecoration(
                  hintText: 'Set user name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter user name';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    fullname = value!;
                  });
                },
              ),

              // ======== Email ========
              TextFormField(
                key: ValueKey('email'),
                decoration: const InputDecoration(
                  hintText: 'Enter email',
                ),
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please Enter valid Email';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    email = value!;
                  });
                },
              ),
              // ======== Password ========
              TextFormField(
                key: ValueKey('password'),
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Enter password',
                ),
                validator: (value) {
                  if (value!.length < 6) {
                    return 'Please enter password of min length 6';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    password = value!;
                  });
                },
              ),
              SizedBox(height: 30,),
              Container(
                height: 55,
                width: 200,
                child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        login
                            ? AuthServices.signinUser(email, password, context)
                            : AuthServices.signupUser(
                            email, password, fullname, context);
                      }else{
                        CircularProgressIndicator();
                      }
                    },
                    child: Text(login ? 'Login' : 'Signup',style: TextStyle(color: Colors.blue),)),
              ),
              SizedBox(height: 10,),
              TextButton(
                  onPressed: () {
                    setState(() {
                      login = !login;
                    });
                  },
                  child: Text(login
                      ? "Don't have an account? Signup"
                      : "Already have an account? Login",style: TextStyle(color: Colors.blue),)),
              SizedBox(height: 10,),
              SizedBox(
                width: 300.0,
                child: Center(
                  child: AnimatedTextKit(pause: Duration(milliseconds: 1),
                    animatedTexts: [
                      ColorizeAnimatedText(speed:Duration(milliseconds: 400),
                        'INNOVATION CELL',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                      ),
                      ColorizeAnimatedText(speed:Duration(milliseconds: 400),
                        'PRESENTS',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                      ),
                      ColorizeAnimatedText(speed:Duration(milliseconds: 1000),
                        'AVINYA',
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                      ),
                    ],
                    isRepeatingAnimation: true,
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
