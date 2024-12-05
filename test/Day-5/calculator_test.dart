// test/calculator_test.dart
import 'package:flutter_study2/Day-5/calculator/calculator.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('addNumber Test', () {
    test('정수 합', () {
      expect(addNumbers(1, 2), 3);
    });
    test('음수 1개 정수 1개 합', () {
      expect(addNumbers(-1, 2), 1);
    });
    test('음수 2개 합', () {
      expect(addNumbers(-1, -2), -3);
    });
    test('0 포함', () {
      expect(addNumbers(0, 2), 2);
    });
  });
}