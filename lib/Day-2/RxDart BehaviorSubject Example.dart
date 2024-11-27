import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter RxDart Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final _subject = BehaviorSubject<int>.seeded(0);

  @override
  void initState() {
    super.initState();
    // 구독하여 스트림의 데이터를 화면에 출력
    _subject.stream.listen((data) => print('Received: $data'));
  }

  void _increment() {
    _subject.add(_subject.value + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDart BehaviorSubject Example'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          
          stream: _subject.stream,
          initialData: _subject.value,
          builder: (context, snapshot) {
            return Text(
              'Current value: ${snapshot.data}',
              style: TextStyle(fontSize: 24.0),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _subject.close();
    super.dispose();
  }
}
