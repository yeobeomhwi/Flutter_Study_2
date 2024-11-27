import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('StreamBuilder Example')),
        body: StreamNumberWidget(),
      ),
    );
  }
}

class StreamNumberWidget extends StatelessWidget {
  final Stream<int> _stream = (() {
    final controller = StreamController<int>();
    int count = 0;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(count > 10) {
        timer.cancel();
      } else {
        controller.add(count++);
      }
    });

    return controller.stream;
  })();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          return Center(child: Text('Number: ${snapshot.data}'));
        } else {
          return Center(child: Text('No Data'));
        }
      },
    );
  }
}
