abstract class AuthService {
  Future<bool> signIn(String email, String password);
  Future<bool> signUp(String email, String password);
  Future<void> signOut();
}
