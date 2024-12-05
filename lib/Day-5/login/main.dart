import 'package:flutter/material.dart';
import 'package:flutter_study2/Day-5/login/validateLogin.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login Validator'),
        ),
        body: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _validationResult = '';

  void _validateLogin() {
    final String username = _usernameController.text;
    final String password = _passwordController.text;
    final bool isValid = validateLogin(username, password);
    setState(() {
      _validationResult = isValid ? 'Login Successful' : 'Invalid Login';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(labelText: 'Username'),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _validateLogin,
            child: Text('Validate Login'),
          ),
          SizedBox(height: 20),
          Text(
            _validationResult,
            style: TextStyle(fontSize: 20, color: _validationResult == 'Login Successful' ? Colors.green : Colors.red),
          ),
        ],
      ),
    );
  }
}



