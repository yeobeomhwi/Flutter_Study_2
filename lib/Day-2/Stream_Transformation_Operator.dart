import 'dart:async';

void main() {
  // StreamController 생성
  final StreamController<int> controller = StreamController<int>();

  // Stream에 변환 및 필터링 연산자 적용
  final Stream<int> transformedStream = controller.stream
      .map((value) => value * 2) // 각 값을 2배로 변환
      .where((value) => value % 2 == 0); // 변환된 값 중 짝수만 필터링

  // 스트림 구독 및 결과 출력
  transformedStream.listen((data) {
    print("Filtered data: $data");
  });
  
  // 1부터 5까지의 숫자를 스트림에 전송
  for (int i = 1; i <= 5; i++) {
    controller.add(i);
  }

  // 스트림 종료
  controller.close();
}
