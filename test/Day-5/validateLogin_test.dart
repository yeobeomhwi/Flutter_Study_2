// test/validator_test.dart
import 'package:flutter_study2/Day-5/login/validateLogin.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('로그인 유효성 검사 테스트', () {
    test('정상 로그인 성공', () {
      expect(validateLogin('user123', 'password123'), true);
    });

    test('ID 빈칸', () {
      expect(validateLogin('', 'password123'), false);
    });

    test('password 빈칸', () {
      expect(validateLogin('user123', ''), false);
    });

    test('둘 다 빈칸', () {
      expect(validateLogin('', ''), false);
    });

    test('password 6자 이하', () {
      expect(validateLogin('user123', 'pass'), false); // 비밀번호는 6자 이상이어야 함
    });

    test('ID에 공백 포함', () {
      expect(validateLogin('user 123', 'password123'), false); // ID에 공백 포함 안됨
    });

    test('password에 공백 포함', () {
      expect(validateLogin('user123', 'pass word'), false); // 비밀번호에 공백 포함 안됨
    });

    test('password 6자 정확히', () {
      expect(validateLogin('user123', '123456'), true); // 정확히 6자 비밀번호 허용
    });
  });
}
