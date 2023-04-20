import 'dart:async';

import 'auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future<bool> signIn(String email, String password) {
    return Future.delayed(const Duration(seconds: 2), () {
      return email == 'test@test.com' && password == '1234';
    });
  }

  @override
  Future<bool> signUp(String email, String password) {
    return Future.delayed(const Duration(seconds: 2), () {
      return true;
    });
  }

  @override
  Future<void> signOut() {
    return Future.delayed(const Duration(seconds: 2));
  }
}
