import 'package:flutter/material.dart';

void main() {
  runApp(SelectionApp());
}

class SelectionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SelectHomeScreen(),
    );
  }
}

class SelectHomeScreen extends StatelessWidget {
  const SelectHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
    );
  }
}
