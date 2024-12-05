// test/async_service_test.dart
import 'package:flutter_study2/Day-5/async/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Async task completes and updates UI', (WidgetTester tester) async {
    // 위젯을 빌드하기 전에 비동기 작업을 테스트합니다.

    // 앱을 빌드
    await tester.pumpWidget(MaterialApp(home: AsyncScreen()));

    // 버튼을 찾아 클릭
    await tester.tap(find.byType(ElevatedButton));

    // 비동기 작업이 완료될 때까지 기다립니다.
    await tester.pumpAndSettle();

    // 비동기 작업이 완료되었는지 결과를 검증
    expect(find.text('Data loaded'), findsOneWidget);
  });
}
