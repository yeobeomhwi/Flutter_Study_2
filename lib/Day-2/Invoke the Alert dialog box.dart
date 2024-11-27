import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  static const methodChannel = MethodChannel('ALERT_DIALOG');
  Future<void> showDialogNative(String message) async {
    try {
      await methodChannel.invokeMethod('showDialog', message);
    } on PlatformException catch (e) {
      print("Failed to call native dialog: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Native Alert Dialog'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter message'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialogNative(_controller.text);
            },
            child: Text('Show Dialog'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: HomeScreen()));
}
