// test/calculator_widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_study2/Day-4/dropdownbutton/main.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('DropdownButton interaction test', (WidgetTester tester) async {
    //DropdownExampleApp을 렌더링
    await tester.pumpWidget(DropdownExampleApp());

    // DropdownButton을 찾고 클릭하여 옵션을 선택
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pump(); // 드롭다운이 열릴때까지 기달립니다.
    // Option 2 선택
    await tester.tap(find.text('Option 2').last);
    await tester.pump();

    // 선택된 옵션이 올바르게 화면에 표시되는지 확인
    expect(find.text('Option 2'), findsOneWidget);
  });
}