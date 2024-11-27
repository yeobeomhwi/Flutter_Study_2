import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Number Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '랜덤 숫자 생성기'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const EventChannel _eventChannel = EventChannel('samples.flutter.dev/random');
  static const MethodChannel _methodChannel = MethodChannel('samples.flutter.dev/random_control');
  
  String _randomNumber = '버튼을 눌러 시작하세요';
  bool _isGenerating = false;

  @override
  void initState() {
    super.initState();
    _eventChannel.receiveBroadcastStream().listen(
      (dynamic number) {
        setState(() {
          _randomNumber = '랜덤 숫자: $number';
        });
      },
      onError: (dynamic error) {
        setState(() {
          _randomNumber = '에러: ${error.message}';
        });
      },
    );
  }

  Future<void> _toggleGeneration() async {
    try {
      if (_isGenerating) {
        await _methodChannel.invokeMethod('stopRandom');
      } else {
        await _methodChannel.invokeMethod('startRandom');
      }
      setState(() {
        _isGenerating = !_isGenerating;
      });
    } on PlatformException catch (e) {
      print("Failed to toggle random generation: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _randomNumber,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleGeneration,
              child: Text(_isGenerating ? '정지' : '시작'),
            ),
          ],
        ),
      ),
    );
  }
}