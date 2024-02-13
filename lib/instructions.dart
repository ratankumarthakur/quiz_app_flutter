import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sems/constants.dart';
import 'package:sems/question1.dart';

class instructions extends StatefulWidget {
  const instructions({super.key});

  @override
  State<instructions> createState() => _instructionsState();
}

class _instructionsState extends State<instructions> {
  var q;
  getdata() async{                                                              //function that fetches questions
    var s=await FirebaseFirestore.instance.collection("initiate").get();
    return s;
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instructions"),
        centerTitle:true,
        elevation: 10,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(11),bottomRight: Radius.circular(11))),
      ),
      backgroundColor: const Color(0xff81f7d0),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              //const Text("INSTRUCTIONS",style: TextStyle(color: Colors.white,fontSize: 40)),
              const Text("** read carefully **",style: TextStyle(color: Colors.red,fontSize: 20)),
              const SizedBox(height: 20,),
              const Text("1. There are 15 questions in total.",style: TextStyle(fontSize: 20),),SizedBox(height: 10,),
              const Text("2. There is no negative marking.",style: TextStyle(fontSize: 20),),SizedBox(height: 10,),
              const Text("3. Answer to a question once submitted can't be undone.",style: TextStyle(fontSize: 20),),SizedBox(height: 10,),
              const Text("4. It is not mandatory to attempt each question. ",style: TextStyle(fontSize: 20),),SizedBox(height: 10,),
              const Text("5. Participants will be given 5 points if they submit the correct option in under 5 seconds , 3 points if submitted under 10 seconds else 1 point for each correct option choosen.",style: TextStyle(fontSize: 20),),SizedBox(height: 10,),
              const Text("6. Once you end the test you will not be able to do any changes.",style: TextStyle(fontSize: 20),),SizedBox(height: 30,),
          
              FutureBuilder(
                future: getdata(),                                                //calls function that fetches questions
                builder: (context,dynamic snapsnot){
                  if(snapsnot.hasData){
                    q="${snapsnot.data.docs[0]["state"]}";                        //correct answer is stored in q
                    return q=="1"
                        ?
                    ElevatedButton(onPressed: (){
                      constants.timer1=1;
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const question1()));
                    }, child: const Text("Enter quiz"))
                        :
                    Container( decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(111),color: Colors.white
                    ),child: const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text("Quiz starts at 7pm on 9th of February"),
                    )
                    );
                  }else{
                    return const Center(child: CircularProgressIndicator(),);
                  }},),
            ],
          ),
        ),
      ),
    );
  }
}
