import 'package:flutter/material.dart';
import 'async_service.dart';

void main() {
  runApp(AsyncApp());
}

class AsyncApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Async Operation Example'),
        ),
        body: AsyncScreen(),
      ),
    );
  }
}

class AsyncScreen extends StatefulWidget {
  @override
  _AsyncScreenState createState() => _AsyncScreenState();
}

class _AsyncScreenState extends State<AsyncScreen> {
  String _result = 'Press the button to start async task';
  bool _isLoading = false;

  Future<void> _startAsyncTask() async {
    setState(() {
      _isLoading = true;
    });

    final result = await fetchData();

    setState(() {
      _result = result;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _result,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _startAsyncTask,
              child: Text('Start Async Task'),
            ),
          ],
        ),
      ),
    );
  }
}



