import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AnimatedContainer Demo'),
        ),
        body: ColorAnimationDemo(),
      ),
    );
  }
}

class ColorAnimationDemo extends StatefulWidget {
  @override
  _ColorAnimationDemoState createState() => _ColorAnimationDemoState();
}

class _ColorAnimationDemoState extends State<ColorAnimationDemo> {
  Color _currentColor = Colors.blue;

  // 색상을 무작위로 변경하는 함수
  void _changeColor() {
    setState(() {
      _currentColor = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RepaintBoundary(
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: 200,
              height: 200,
              color: _currentColor,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _changeColor,
            child: const Text('Change Color'),
          ),
        ],
      ),
    );
  }
}
