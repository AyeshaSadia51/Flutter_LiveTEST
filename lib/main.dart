import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;
  void _increase() {
    setState(() {
      count++;
      if (count >= 5) {
        _showDialog();
      }
    });
  }
  void _decrease() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }
  void _showDialog() {
    showDialog(
      context: context, builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Button pressed $count times'),
          actions:[
            TextButton(
              child: Text('Close', style: TextStyle(fontSize: 20),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App', style: TextStyle(fontSize: 24),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count:', style: TextStyle(fontSize: 22),),
            Text('$count', style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
            SizedBox(height: 22),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _increase,
                  child: Text('+', style: TextStyle(fontSize: 30),),
                ),
                SizedBox(width: 22),
                ElevatedButton(
                  onPressed: _decrease,
                  child: Text('-', style: TextStyle(fontSize: 30)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
