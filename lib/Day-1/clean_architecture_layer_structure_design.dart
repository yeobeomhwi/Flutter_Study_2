// 1. 엔터티(Entity) 클래스 설계

// 엔티티는 순수 비즈니스 로직만 포함해야 하므로 UI 관련 코드는 배제
class User {
  final String name;
  final int age;

  User(this.name, this.age);
}

// 2. 리포지토리(Repository) 인터페이스 설계
abstract class UserRepository {
  void saveUser(User user);
  User? getUser(String name);
}

// 3. 유스케이스(Use Case) 설계
class SaveUserUseCase {
  final UserRepository userRepository;

  SaveUserUseCase(this.userRepository);

  void call(User user) {
    userRepository.saveUser(user);
  }
}

class GetUserUseCase {
  final UserRepository userRepository;

  GetUserUseCase(this.userRepository);

  User? call(String name) {
    return userRepository.getUser(name);
  }
}

// 4. 리포지토리 구현체 설계
class InMemoryUserRepository implements UserRepository {
  final Map<String, User> _storage = {};

  @override
  void saveUser(User user) {
    _storage[user.name] = user;
  }

  @override
  User? getUser(String name) {
    return _storage[name];
  }
}

// 5. main 함수에서 유스케이스 테스트
void main() {
  // 리포지토리 구현체 생성
  final userRepository = InMemoryUserRepository();

  // 유스케이스 생성
  final saveUserUseCase = SaveUserUseCase(userRepository);
  final getUserUseCase = GetUserUseCase(userRepository);

  // 새로운 사용자 저장
  final user = User('John Doe', 30);
  saveUserUseCase(user);

  // 사용자 정보 불러오기
  final retrievedUser = getUserUseCase('John Doe');
  print('Retrieved User: ${retrievedUser?.name}, ${retrievedUser?.age}');
}
