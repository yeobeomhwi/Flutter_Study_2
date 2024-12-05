import 'package:flutter/material.dart';
import 'package:flutter_study2/Day-4/calculator/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Calculator adds two numbers', (WidgetTester tester) async {
    // CalculatorApp을 렌더링합니다.
    await tester.pumpWidget(CalculatorApp());

    // 두 개의 TextField에 숫자 입력
    await tester.enterText(find.byType(TextField).first, '5'); // 첫 번째 TextField에 5 입력
    await tester.enterText(find.byType(TextField).at(1), '3'); // 두 번째 TextField에 3 입력

    // 계산 버튼 클릭
    await tester.tap(find.byType(ElevatedButton)); // 버튼 클릭
    await tester.pump(); // 위젯이 반영될 때까지 기다립니다.

    // 결과 확인
    expect(find.text('결과: 8'), findsOneWidget); // 계산 결과가 '결과: 8'로 표시되는지 확인
  });
}
