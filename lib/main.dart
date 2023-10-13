import 'package:flutter/material.dart';

void main() {
  runApp(SelectionApp());
}

class SelectionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SelectHomeScreen(),
    );
  }
}

class SelectHomeScreen extends StatefulWidget {
  @override
  _SelectHomeScreenState createState() => _SelectHomeScreenState();
}

class _SelectHomeScreenState extends State<SelectHomeScreen> {
  List<ListOfItem> itemList = [
    ListOfItem("Item 1", false),
    ListOfItem("Item 2", false),
    ListOfItem("Item 3", false),
    ListOfItem("Item 4", false),
    ListOfItem("Item 5", false),
  ];

  int selectedCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selection Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(itemList[index].itemName),
              tileColor: itemList[index].isSelected ? Colors.blue : null,
              onTap: () {
                setState(() {
                  itemList[index].isSelected = !itemList[index].isSelected;
                  if (itemList[index].isSelected) {
                    selectedCount++;
                  } else {
                    selectedCount--;
                  }
                });
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Selected Items'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 5),
                    Text('Number of selected items: $selectedCount'),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Close',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}

class ListOfItem {
  final String itemName;
  bool isSelected;

  ListOfItem(this.itemName, this.isSelected);
}
