import 'auth_service.dart';

class ApiAuthServiceGoogle implements AuthService {
  @override
  Future<bool> signIn(String email, String password) async {
    try {
     await Future.delayed(Duration(seconds: 1));
     return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> signInWithGoogle() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<void> signOut() async {
    // implement logic here
  }

  @override
  Future<bool> signUp(String email, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
