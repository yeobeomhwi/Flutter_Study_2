// lib/async_service.dart
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));  // 2초 동안 지연
  return 'Data loaded';
}