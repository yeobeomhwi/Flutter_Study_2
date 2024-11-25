import 'package:flutter_study2/clean_architecture_demo/domain/entities/user.dart';

// Domain Layer - Repository Interfaces
abstract class UserRepository {
  User getUser();
}