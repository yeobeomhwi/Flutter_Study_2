import 'package:flutter/material.dart';

void main() {
  runApp(AsyncExampleApp());
}

class AsyncExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AsyncExample(),
    );
  }
}

class AsyncExample extends StatefulWidget {
  @override
  _AsyncExampleState createState() => _AsyncExampleState();
}

class _AsyncExampleState extends State<AsyncExample> {
  String message = '대기 중';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Async Task Example'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              // 비동기 작업 실행
              await Future.delayed(Duration(seconds: 3));
              setState(() {
                message = '작업 완료';
              });
            },
            child: Text('작업 시작'),
          ),
          Text(message),
        ],
      ),
    );
  }
}