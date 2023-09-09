import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: HomeScreen(),
      title: 'LiveTEST APP',
    );
  }
}

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white,

        appBar: AppBar(

          centerTitle: true,
          title: Text('Profile', style: TextStyle(
              fontSize: 26
          ),),
          backgroundColor: Colors.pinkAccent,

        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 43,
              backgroundColor: Colors.purple,
              child: Icon(
                Icons.person, size: 80, color: Colors.white,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Jhon Doe', style: TextStyle(
                    fontSize: 35,
                    color: Colors.pinkAccent
                ),)
              ],

            ),

            Text('Flutter Batch 4 ',
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 28
                ),

            ),

          ],
        )
    );
  }
}