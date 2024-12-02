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
        body:HomeScreen(),
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
      body: SingleChildScrollView(
        // SingleChildScrollView를 사용하여 Column 안의 내용이 화면을 초과하면 스크롤할 수 있도록 처리합니다.
        // Column은 기본적으로 모든 자식 위젯의 크기를 제한 없이 배치하려고 합니다.
        // 따라서 화면을 초과하는 내용이 있을 경우 레이아웃 오버플로우가 발생합니다.
        // SingleChildScrollView를 사용하면 이러한 문제를 방지할 수 있습니다.
        child: Column(
            children: [
              Text(
                '이것은 매우 긴 텍스트입니다. ' * 30,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '이것도 매우 긴 텍스트입니다. ' * 30,
                style: TextStyle(fontSize: 20),
              ),
            ]
        ),
      ),
    );
  }
}
