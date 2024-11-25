import 'package:flutter_study2/clean_architecture_demo/domain/entities/user.dart';
import 'package:flutter_study2/clean_architecture_demo/domain/repositories/user_repository.dart';

// Presentation Layer - Controllers
class UserController {
  final UserRepository repository;
  UserController(this.repository);

  User getUser() {
    return repository.getUser();
  }
}
