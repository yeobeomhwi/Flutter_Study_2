import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const platform = MethodChannel('com.example.app/channel');
  String _message = 'Native로부터 응답 대기중...';

  Future<void> _getNativeMessage() async {
    try {
      final String result = await platform.invokeMethod('getNativeMessage');
      setState(() {
        _message = result;
      });
    } on PlatformException catch (e) {
      setState(() {
        _message = "네이티브 메소드 호출 실패: ${e.message}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_message),
            ElevatedButton(
              onPressed: _getNativeMessage,
              child: const Text('네이티브 메소드 호출'),
            ),
          ],
        ),
      ),
    );
  }
}