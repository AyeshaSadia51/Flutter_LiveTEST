import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedSize = '';

  void _showSnackBar(BuildContext context, String size) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected Size  $size'),
      ),
    );
  }

  void _selectSize(String size) {
    setState(() {
      selectedSize = size;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Size Selector"),
        centerTitle: true,
      ),
      body: Center(
        child: Wrap(
          spacing: 12,
          runSpacing: 15,
          children: [
            SizedBox(
              width: 85,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  _selectSize('S');
                  _showSnackBar(context, 'S');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: 'S' == selectedSize ? Colors.orange : Colors.grey,
                ),
                child: Text('S'),
              ),
            ),
            SizedBox(
              width: 85,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  _selectSize('M');
                  _showSnackBar(context, 'M');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: 'M' == selectedSize ? Colors.orange : Colors.grey,
                ),
                child: Text('M'),
              ),
            ),
            SizedBox(
              width: 85,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  _selectSize('L');
                  _showSnackBar(context, 'L');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: 'L' == selectedSize ? Colors.orange : Colors.grey,
                ),
                child: Text('L'),
              ),
            ),
            SizedBox(
              width: 85,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  _selectSize('XL');
                  _showSnackBar(context, 'L');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: 'XL' == selectedSize ? Colors.orange : Colors.grey,
                ),
                child: Text('XL'),
              ),
            ),
            SizedBox(
              width: 85,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  _selectSize('XXL');
                  _showSnackBar(context, 'XXL');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: 'XXL' == selectedSize ? Colors.orange : Colors.grey,
                ),
                child: Text('XXL'),
              ),
            ),
            SizedBox(
              width: 85,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  _selectSize('XXXL');
                  _showSnackBar(context, 'XXXL');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: 'XXXL' == selectedSize ? Colors.orange : Colors.grey,
                ),
                child: Text('XXXL'),
              ),
            ),
          ],
        ),
      ),
    );
  }

}