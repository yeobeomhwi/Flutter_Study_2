// test/filter_test.dart
import 'package:flutter_study2/Day-5/list_filter/filter_service.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('필터링', () {
    test("짝수를 필터링", () {
      final result = filterEvenNumbers([1, 2, 3, 4, 5, 6, 7, 8]);
      expect(result, [2, 4, 6, 8]);
    });
    test("짝수가 없음", () {
      final result = filterEvenNumbers([1, 3, 5, 7]);
      expect(result, []);
    });
    test("빈 리스트 필터링", () {
      final result = filterEvenNumbers([]);
      expect(result, []);
    });
    test("음수 짝수를 필터링", () {
      final result = filterEvenNumbers([1, -2, 3, -4, 5, 6, 7, 8]);
      expect(result, [-2, -4, 6, 8]);
    });
  });
}