import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Column(
        children: [
          TextField(controller: num1Controller),
          TextField(controller: num2Controller),
          ElevatedButton(
            onPressed: () {
              setState(() {
                int num1 = int.parse(num1Controller.text);
                int num2 = int.parse(num2Controller.text);
                result = num1 + num2;
              });
            },
            child: Text('계산하기'),
          ),
          Text('결과: $result'),
        ],
      ),
    );
  }
}