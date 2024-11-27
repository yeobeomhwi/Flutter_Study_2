import 'dart:async';

void main() {
  // 1. StreamController 생성
  final controller = StreamController<int>();

  // 2. 구독 설정
  controller.stream.listen(
    (data) => print('Received: $data')
    );

  // 3. 데이터 전송
  Future<void> sendData() async {
    for(int i = 0; i < 5; i++){
      await Future.delayed(Duration(seconds: 1));
      controller.add(i);
    }
    await controller.close();
  }
  
  sendData();
}
