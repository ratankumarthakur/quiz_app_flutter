import 'package:flutter/material.dart';
import 'package:sems/constants.dart';
import 'package:sems/question1.dart';
import 'package:sems/question11.dart';
import 'package:sems/question12.dart';
import 'package:sems/question13.dart';
import 'package:sems/question14.dart';
import 'package:sems/question15.dart';
import 'package:sems/question16.dart';
import 'package:sems/question2.dart';
import 'package:sems/question3.dart';
import 'package:sems/question4.dart';
import 'package:sems/question5.dart';
import 'package:sems/question6.dart';
import 'package:sems/question7.dart';
import 'package:sems/question8.dart';
import 'package:sems/question9.dart';
import 'l2.dart';

class scorepage extends StatefulWidget {
  const scorepage({super.key});

  @override
  State<scorepage> createState() => _scorepageState();
}
Duration timeTaken = globalendTime.difference(globalStartTime);
class _scorepageState extends State<scorepage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constants.primary,
      appBar: AppBar(
        title: const Text("Score"),
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
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your score is : ${constants.score.toString()}",style: TextStyle(fontSize: 40),),
            SizedBox(height: 20,),
            //Text(constants.ans5),
            Container(height: 50,width: 200,
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MyQuizScreen()));
              }, child: Text("Leader board")),
            ),SizedBox(height: 20,),
            //if (globalStartTime != null && globalendTime != null ){
              //Text(globalStartTime.toString()),
            //}
            Text('Time taken: ${timeTaken.inSeconds} seconds')
          ],
        ),
      ),
    );
  }

}

