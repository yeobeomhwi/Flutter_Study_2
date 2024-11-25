import 'package:flutter_study2/Day-1/clean_architecture_demo/domain/entities/user.dart';

// Domain Layer - Repository Interfaces
abstract interface class UserRepository {
  User getUser();
}
