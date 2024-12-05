import 'package:flutter/material.dart';
import 'calculator.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Calculator'),
        ),
        body: CalculatorScreen(),
      ),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _result = '';

  void _calculateSum() {
    final int num1 = int.tryParse(_controller1.text) ?? 0;
    final int num2 = int.tryParse(_controller2.text) ?? 0;
    final int sum = addNumbers(num1, num2);
    setState(() {
      _result = 'Result: $sum';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _controller1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Enter first number'),
          ),
          TextField(
            controller: _controller2,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Enter second number'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _calculateSum,
            child: Text('Add Numbers'),
          ),
          SizedBox(height: 20),
          Text(
            _result,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}



