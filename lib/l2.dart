import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sems/constants.dart';

class MyQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LeaderBoard'),centerTitle: true,
      ),
      backgroundColor: constants.primary,
      body: QuizLeaderboard(),
    );
  }
}

class QuizLeaderboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Container(margin: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          width:MediaQuery.of(context).size. width,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
          
              // Get the documents from the snapshot
              final users = snapshot.data!.docs;
          
              // Sort the documents based on score and time taken
              users.sort((a, b) {
                int scoreComparison = b['score'].compareTo(a['score']);
                if (scoreComparison != 0) {
                  return scoreComparison;
                } else {
                  return a['timetaken'].compareTo(b['timetaken']);
                }
              });
          
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  final score = user['score'];
                  final timetaken = user['timetaken'].toString().substring(2,10);
                  final username=user['name'];
                 
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Card(color: index>2?Colors.white:Colors.pink.shade200,elevation: 10,
                      child: ListTile(
                        title: Text(index>2?'$username':'${index+1}. $username'),
                        subtitle: Text('Score: $score'),
                        trailing: Text('Time Taken: $timetaken'),
                        // You can display more user data as needed
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}