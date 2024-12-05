// lib/filter_service.dart
List<int> filterEvenNumbers(List<int> numbers) {
  return numbers.where((number) => number.isEven).toList();
}