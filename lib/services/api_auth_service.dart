import 'dart:convert';

import 'package:http/http.dart' as http;

import 'auth_service.dart';

class ApiAuthService implements AuthService {
  static const _baseUrl = 'https://example.com';

  @override
  Future<bool> signIn(String email, String password) async {
    const url = '$_baseUrl/signin';
    final response = await http.post(Uri.parse(url)
      ,
      body: json.encode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData['success'];
    } else {
      throw Exception('Failed to sign in');
    }
  }

  @override
  Future<bool> signUp(String email, String password) async {
    const url = '$_baseUrl/signup';
    final response = await http.post(
      Uri.parse(url),
      body: json.encode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData['success'];
    } else {
      throw Exception('Failed to sign up');
    }
  }

  @override
  Future<void> signOut() {
    return Future.delayed(Duration(seconds: 2));
  }
}
