import 'package:flutter/material.dart';

void main() {
  runApp(DropdownExampleApp());
}

class DropdownExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DropdownExample(),
    );
  }
}

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String selectedOption = "Option 1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Test'),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: selectedOption,
            items: <String>['Option 1', 'Option 2', 'Option 3']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedOption = newValue!;
              });
            },
          ),
          Text('선택된 옵션: $selectedOption'),
        ],
      ),
    );
  }
}