import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Debugging',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Debugging Example'),
        ),
        body: HomeScreen(),
      ),
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Layout Explorer'),),
        body: ListView.builder(itemCount: 100, itemBuilder: (context, index) {
          return ListTile(
            title: Text('아이템 ${index}'),
          );
        }
        ),
    );
  }
}
