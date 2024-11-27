import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const EventChannel timeChannel = EventChannel('samples.flutter.dev/time');
  String _currentTime = 'Unknown';

  @override
  void initState() {
    super.initState();
    timeChannel.receiveBroadcastStream().listen(
      (dynamic time) {
        setState(() {
          _currentTime = time.toString();
        });
      },
      onError: (dynamic error) {
        setState(() {
          _currentTime = 'Error: ${error.message}';
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Channel Example'),
      ),
      body: Center(
        child: Text(
          '현재 시간: $_currentTime',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}