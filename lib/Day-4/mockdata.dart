// 1. MockDatabaseService 클래스 작성
class MockDatabaseService {
  // 데이터 저장 대신 출력하는 메서드
  void saveData(String data) {
    print('Mock save: $data');
  }
}

// 2. UserRepository 인터페이스 정의
abstract class UserRepository {
  void saveUser(String name);
}

// 3. UserRepositoryImpl에 MockDatabaseService 주입
class UserRepositoryImpl implements UserRepository {
  final MockDatabaseService service;

  // 생성자에서 MockDatabaseService를 의존성 주입
  UserRepositoryImpl(this.service);

  @override
  void saveUser(String name) {
    // 이름을 MockDatabaseService에 저장
    service.saveData('User: $name');
  }
}

// 4. main 함수에서 MockDatabaseService로 테스트
void main() {
  // MockDatabaseService 인스턴스를 생성
  final mockDatabaseService = MockDatabaseService();

  // UserRepositoryImpl에 MockDatabaseService 주입
  final userRepository = UserRepositoryImpl(mockDatabaseService);

  // saveUser 메서드 호출
  userRepository.saveUser('Alice');

  // 출력 예시: Mock save: User: Alice
}
