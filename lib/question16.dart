import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sems/constants.dart';
import 'package:sems/question3.dart';
import 'package:sems/scorepage.dart';
import 'package:sems/question1.dart';
import 'package:sems/question11.dart';
import 'package:sems/question12.dart';
import 'package:sems/question13.dart';
import 'package:sems/question14.dart';
import 'package:sems/question15.dart';
import 'package:sems/question2.dart';
import 'package:sems/question4.dart';
import 'package:sems/question5.dart';
import 'package:sems/question6.dart';
import 'package:sems/question7.dart';
import 'package:sems/question8.dart';
import 'package:sems/question9.dart';

class question16 extends StatefulWidget {
  const question16({super.key});

  @override
  State<question16> createState() => _question16State();
}
late DateTime globalendTime;
class _question16State extends State<question16> {
  int lastcount=0;
  //static DateTime end=DateTime(Duration.microsecondsPerDay);
  //static String formattedDate1="";
  getdata() async{                                                              //function that fetches questions
    var s=await FirebaseFirestore.instance.collection("questions").get();
    return s;
  }

  gdata() async{                                                                //function that fetches solutions/options
    var s=await FirebaseFirestore.instance.collection("solutions").get();
    return s;
  }
  static String s115="";                                                                //stores user solution
  static String q="";                                                                  //stores correct answer

  static String s1="";
  static String s2="";                                                                 //these four are temporary storages
  static String s3="";
  static String s4="";                                                               //keeps first submitted constants.ans15wer

  late DateTime startTime15;
  late DateTime endTime15;

  int _timerSeconds = 11;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
    startTime15 = DateTime.now();
    //globalStartTime = startTime15;
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timerSeconds > 0) {
          _timerSeconds--;
        } else {
          _timer.cancel();
          // Display the "Can't get more than 1" text here
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget fun2(){                                                                //returns question widget
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.pink.shade100,
                    borderRadius: BorderRadius.circular(11)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: FutureBuilder(
                    future: getdata(),                                                  //calls function that fetches questions
                    builder: (context,dynamic snapsnot){
                      if(snapsnot.hasData){
                        q="${snapsnot.data.docs[14]["s"]}";                  //correct constants.ans15wer is stored in q
                        return Text("${snapsnot.data.docs[14]["q"]}",style: const TextStyle(fontSize: 25),);       //displays question1
                      }else{
                        return const Center(child: CircularProgressIndicator(),);
                      }
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: GestureDetector(onTap: (){
                setState(() {
                  s115=s1;
                  if(constants.aa15=="Submit"){
                    constants.option_color151=Colors.pink.shade200;
                    constants.option_color152=Colors.white;
                    constants.option_color153=Colors.white;
                    constants.option_color154=Colors.white;
                  }
                });
              },
                child: Container(width: double.infinity,
                  decoration: BoxDecoration(
                      color: constants.option_color151,
                      borderRadius: BorderRadius.circular(11)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: FutureBuilder(
                      future: gdata(),                                                    //calls function that fetches solutions
                      builder: (context,dynamic snapsnot){
                        if(snapsnot.hasData){
                          s1="${snapsnot.data.docs[14]["s1"]}";
                          return Text(s1,style: const TextStyle(fontSize: 18),);
                        }else{
                          return const Center(child: CircularProgressIndicator(),);
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: GestureDetector(onTap: (){
                setState(() {
                  s115=s2;
                  if(constants.aa15=="Submit"){
                    constants.option_color152=Colors.pink.shade200;
                    constants.option_color151=Colors.white;
                    constants.option_color153=Colors.white;
                    constants.option_color154=Colors.white;
                  }
                });
              },
                child: Container(width: double.infinity,
                  decoration: BoxDecoration(
                      color: constants.option_color152,
                      borderRadius: BorderRadius.circular(11)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: FutureBuilder(
                      future: gdata(),                                                    //calls function that fetches solutions
                      builder: (context,dynamic snapsnot){
                        if(snapsnot.hasData){
                          s2="${snapsnot.data.docs[14]["s2"]}";
                          return Text(s2,style: const TextStyle(fontSize: 18),);
                        }else{
                          return const Center(child: CircularProgressIndicator(),);
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: GestureDetector(onTap: (){
                setState(() {
                  s115=s3;
                  if(constants.aa15=="Submit"){
                    constants.option_color153=Colors.pink.shade200;
                    constants.option_color152=Colors.white;
                    constants.option_color151=Colors.white;
                    constants.option_color154=Colors.white;
                  }
                });
              },
                child: Container(width: double.infinity,
                  decoration: BoxDecoration(
                      color: constants.option_color153,
                      borderRadius: BorderRadius.circular(11)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: FutureBuilder(
                      future: gdata(),                                                    //calls function that fetches solutions
                      builder: (context,dynamic snapsnot){
                        if(snapsnot.hasData){
                          s3="${snapsnot.data.docs[14]["s3"]}";
                          return Text(s3,style: const TextStyle(fontSize: 18),);
                        }else{
                          return const Center(child: CircularProgressIndicator(),);
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: GestureDetector(onTap: (){
                setState(() {
                  s115=s4;
                  if(constants.aa15=="Submit"){
                    constants.option_color154=Colors.pink.shade200;
                    constants.option_color152=Colors.white;
                    constants.option_color153=Colors.white;
                    constants.option_color151=Colors.white;
                  }
                });
              },
                child: Container(width: double.infinity,
                  decoration: BoxDecoration(
                      color: constants.option_color154,
                      borderRadius: BorderRadius.circular(11)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: FutureBuilder(
                      future: gdata(),                                                    //calls function that fetches solutions
                      builder: (context,dynamic snapsnot){
                        if(snapsnot.hasData){
                          s4="${snapsnot.data.docs[14]["s4"]}";
                          return Text(s4,style: const TextStyle(fontSize: 18),);
                        }else{
                          return const Center(child: CircularProgressIndicator(),);
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),Row(mainAxisAlignment: MainAxisAlignment.end,children: [
              SizedBox(width: 100,height: 40,
                child: MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(111)),
                    color: constants.button_color15,onPressed: (){
                  setState(() {
                    endTime15 = DateTime.now();

                    if(s115!=""){
                      constants.aa15="Submitted";
                      constants.button_color15=Colors.pink.shade200;
                    }
                  });
                  constants.count15++;
                  if(s115==""){
                    Fluttertoast.showToast(
                        msg: "Select any one option , no -ve marking",
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    constants.count15--;
                  }
                  else if(constants.count15>1){
                    print("already submitted");
                    print(constants.ans15);
                    //final  constants.ans15=s;
                  }
                  else if(constants.count15==1){
                    setState(() {
                      constants.ans15=s115;
                    });
                    print(constants.ans15);
                    if (startTime15 != null && endTime15 != null ) {
                      Duration timeTaken = endTime15.difference(startTime15);

                      // Adjust score based on time taken
                      if (timeTaken.inSeconds <= 5 && constants.ans15==q) {
                        constants.score += 5;
                      } else if (timeTaken.inSeconds <= 10 && constants.ans15==q) {
                        constants.score += 3;
                      } else if(timeTaken.inSeconds > 10 && constants.ans15==q){
                        constants.score += 1;
                      }

                      print('Time taken: ${timeTaken.inSeconds} seconds');
                      print('Score: ${constants.score}');
                    }

                    if(constants.ans15==q){
                      print("true");
                      //constants.score++;
                    }else{
                      print("false");
                    }
                  }
                },
                    child: Text(constants.aa15,style: const TextStyle(color: Colors.blue),)),
              ),
              const SizedBox(width: 10,),
              SizedBox(width: 150,height: 40,
                child: MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(111)),
                    color: Colors.blue,onPressed: (){
                      setState(() {
                        globalendTime=DateTime.now();
                        constants.endtest=1;
                        Duration timeTaken = globalendTime.difference(globalStartTime);

                        //end = DateTime.now();
                        //constants.formattedDate1 = DateFormat('kk:mm:ss').format(end);
                        //print(constants.formattedDate1);
                        //print(DateTime.parse(constants.formattedDate1).difference(DateTime.parse(constants.formattedDate2)));
                        lastcount++;
                        if(lastcount==1){
                          final int last=constants.score;
                          update("users", "score", last,"timetaken",timeTaken.toString());
                        }
                      });

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const scorepage()));},
                    child:const Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("End the contest",style: TextStyle(color: Colors.white),),
                        SizedBox(width: 3,),
                        Icon(Icons.arrow_forward_ios_outlined,size: 15,color: Colors.white,)
                      ],
                    ) ),
              ),
              const SizedBox(width: 18,),
            ],),
            SizedBox(height: 20,),
            Text(_timerSeconds==0?'Could not get more than 1 points now':'$_timerSeconds',style: TextStyle(fontSize: 20),)

          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return constants.endtest==1
        ?
    Scaffold(
      backgroundColor:constants.primary ,
      body: const Center(child: Text("Contest ended",style: TextStyle(fontSize: 30),),),
    )
        :Scaffold(
        appBar: AppBar(
          title: const Text("Question 15"),
          centerTitle: true,
        ),drawer: Drawer(backgroundColor: Colors.white,width: 250,
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: constants.primary,
                height:250,
                child: Center(child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.list,size: 20,),
                    const SizedBox(width: 10,),
                    Text("Question panel",style: TextStyle(color: Colors.grey.shade800,fontSize: 20),)
                  ],
                )),
              ),
              ListTile(
                leading: Icon(Icons.circle,size: 15,color: constants.ans1!=""?Colors.green:Colors.grey,),
                title: const Text("Question 1"),
                subtitle:Text(constants.ans1!=""?"Submitted":"Not Submitted"),
                trailing: const Icon(Icons.arrow_forward_ios_outlined,size: 15,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>question1()));
                },),
              ListTile(
                leading: Icon(Icons.circle,size: 15,color: constants.ans2!=""?Colors.green:Colors.grey,),
                title: const Text("Question 2"),
                subtitle:Text(constants.ans2!=""?"Submitted":"Not Submitted"),
                trailing: const Icon(Icons.arrow_forward_ios_outlined,size: 15,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>question2()));
                },),
              ListTile(
                leading: Icon(Icons.circle,size: 15,color: constants.ans3!=""?Colors.green:Colors.grey,),
                title: const Text("Question 3"),
                subtitle:Text(constants.ans3!=""?"Submitted":"Not Submitted"),
                trailing: const Icon(Icons.arrow_forward_ios_outlined,size: 15,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>question3()));
                },),
              ListTile(
                leading: Icon(Icons.circle,size: 15,color: constants.ans4!=""?Colors.green:Colors.grey,),
                title: const Text("Question 4"),
                subtitle:Text(constants.ans4!=""?"Submitted":"Not Submitted"),
                trailing: const Icon(Icons.arrow_forward_ios_outlined,size: 15,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>question4()));
                },),
              ListTile(
                leading: Icon(Icons.circle,size: 15,color: constants.ans5!=""?Colors.green:Colors.grey,),
                title: const Text("Question 5"),
                subtitle:Text(constants.ans5!=""?"Submitted":"Not Submitted"),
                trailing: const Icon(Icons.arrow_forward_ios_outlined,size: 15,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>question5()));
                },),
              ListTile(
                leading: Icon(Icons.circle,size: 15,color: constants.ans6!=""?Colors.green:Colors.grey,),
                title: const Text("Question 6"),
                subtitle:Text(constants.ans6!=""?"Submitted":"Not Submitted"),
                trailing: const Icon(Icons.arrow_forward_ios_outlined,size: 15,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>question6()));
                },),
              ListTile(
                leading: Icon(Icons.circle,size: 15,color: constants.ans7!=""?Colors.green:Colors.grey,),
                title: const Text("Question 7"),
                subtitle:Text(constants.ans7!=""?"Submitted":"Not Submitted"),
                trailing: const Icon(Icons.arrow_forward_ios_outlined,size: 15,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>question7()));
                },),
              ListTile(
                leading: Icon(Icons.circle,size: 15,color: constants.ans8!=""?Colors.green:Colors.grey,),
                title: const Text("Question 8"),
                subtitle:Text(constants.ans8!=""?"Submitted":"Not Submitted"),
                trailing: const Icon(Icons.arrow_forward_ios_outlined,size: 15,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>question8()));
                },),
              ListTile(
                leading: Icon(Icons.circle,size: 15,color: constants.ans9!=""?Colors.green:Colors.grey,),
                title: const Text("Question 9"),
                subtitle:Text(constants.ans9!=""?"Submitted":"Not Submitted"),
                trailing: const Icon(Icons.arrow_forward_ios_outlined,size: 15,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>question9()));
                },),
              ListTile(
                leading: Icon(Icons.circle,size: 15,color: constants.ans10!=""?Colors.green:Colors.grey,),
                title: const Text("Question 10"),
                subtitle:Text(constants.ans10!=""?"Submitted":"Not Submitted"),
                trailing: const Icon(Icons.arrow_forward_ios_outlined,size: 15,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>question11()));
                },),
              ListTile(
                leading: Icon(Icons.circle,size: 15,color: constants.ans11!=""?Colors.green:Colors.grey,),
                title: const Text("Question 11"),
                subtitle:Text(constants.ans11!=""?"Submitted":"Not Submitted"),
                trailing: const Icon(Icons.arrow_forward_ios_outlined,size: 15,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>question12()));
                },),
              ListTile(
                leading: Icon(Icons.circle,size: 15,color: constants.ans12!=""?Colors.green:Colors.grey,),
                title: const Text("Question 12"),
                subtitle:Text(constants.ans12!=""?"Submitted":"Not Submitted"),
                trailing: const Icon(Icons.arrow_forward_ios_outlined,size: 15,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>question13()));
                },),
              ListTile(
                leading: Icon(Icons.circle,size: 15,color: constants.ans13!=""?Colors.green:Colors.grey,),
                title: const Text("Question 13"),
                subtitle:Text(constants.ans13!=""?"Submitted":"Not Submitted"),
                trailing: const Icon(Icons.arrow_forward_ios_outlined,size: 15,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>question14()));
                },),
              ListTile(
                leading: Icon(Icons.circle,size: 15,color: constants.ans14!=""?Colors.green:Colors.grey,),
                title: const Text("Question 14"),
                subtitle:Text(constants.ans14!=""?"Submitted":"Not Submitted"),
                trailing: const Icon(Icons.arrow_forward_ios_outlined,size: 15,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>question15()));
                },),
              ListTile(
                leading: Icon(Icons.circle,size: 15,color: constants.ans15!=""?Colors.green:Colors.grey,),
                title: const Text("Question 15"),
                subtitle:Text(constants.ans15!=""?"Submitted":"Not Submitted"),
                trailing: const Icon(Icons.arrow_forward_ios_outlined,size: 15,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>question16()));
                },)
            ],
          ),
        )
    ),
        backgroundColor: constants.primary,
        body: fun2()
    );
  }
  update(String collName, field, var newFieldValue,field2,var tote ) async {
    final firebaseuser = await FirebaseAuth.instance.currentUser!;
    await FirebaseFirestore.instance
        .collection(collName)
        .doc(firebaseuser.uid)
        .update({field: newFieldValue,field2:tote});
    print('Fields Updated');
  }
}
