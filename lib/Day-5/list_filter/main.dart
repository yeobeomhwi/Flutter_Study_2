import 'package:flutter/material.dart';
import 'filter_service.dart';

void main() {
  runApp(FilterApp());
}

class FilterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Even Numbers Filter'),
        ),
        body: FilterScreen(),
      ),
    );
  }
}

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final TextEditingController _controller = TextEditingController();
  List<int> _filteredNumbers = [];

  void _filterNumbers() {
    final List<int> numbers = _controller.text
        .split(',')
        .map((e) => int.tryParse(e.trim()) ?? 0)
        .toList();

    setState(() {
      _filteredNumbers = filterEvenNumbers(numbers);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'Enter numbers separated by commas',
              hintText: 'e.g., 1, 2, 3, 4, 5',
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _filterNumbers,
            child: Text('Filter Even Numbers'),
          ),
          SizedBox(height: 20),
          Text(
            'Filtered Even Numbers: ${_filteredNumbers.join(', ')}',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}



