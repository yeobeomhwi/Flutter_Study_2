import 'dart:async';

Future<String> fetchData() async {
  try {
    await Future.delayed(Duration(seconds: 2));
    return 'Fetched Data';
    // 테스트를 위한 에러 발생 시나리오
    // throw Exception('Failed to fetch data');
  } catch (e) {
    throw Exception('API call failed: $e');
  }
}

void main() {
  final controller = StreamController<String>();

  // Stream 구독 설정
  controller.stream.listen(
    (data) => print('Received data: $data'),
    onError: (error) => print('Error occurred: $error'),
    onDone: () => print('Stream completed'),
  );

  // API 호출 및 데이터 처리
  fetchData()
    .then((data) => controller.add(data))
    .catchError((error) => controller.addError(error))
    .whenComplete(() => controller.close());
}