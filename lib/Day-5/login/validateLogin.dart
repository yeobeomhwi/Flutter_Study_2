// lib/validator.dart
bool validateLogin(String username, String password) {

  if (username.isEmpty || password.isEmpty || password.length < 6 || username.contains(' ') || password.contains(' ')) {
    return false;
  }
  return true;
}
