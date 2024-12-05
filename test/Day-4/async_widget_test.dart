// test/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_study2/Day-4/async/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Async task test', (WidgetTester tester) async {
    // 앱 렌더링
    await tester.pumpWidget(AsyncExampleApp());

    // "작업 시작" 버튼 클릭
    await tester.tap(find.byType(ElevatedButton));

    // 3초 동안 기다리면서 애니메이션이 완료되기를 대기
    await tester.pump(Duration(seconds: 3));


    // "작업 완료" 메시지가 화면에 표시되는지 확인
    expect(find.text('작업 완료'), findsOneWidget);
  });
}
