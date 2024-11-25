import 'package:flutter_study2/clean_architecture_demo/domain/entities/user.dart';
import 'package:flutter_study2/clean_architecture_demo/domain/repositories/user_repository.dart';

// Data Layer - Repository Implementations
class UserRepositoryImpl implements UserRepository {
  @override
  User getUser() {
    // 실제로는 데이터베이스나 API에서 데이터를 가져올 것입니다
    return User(name: 'John Doe', age: 25);
  }
}
