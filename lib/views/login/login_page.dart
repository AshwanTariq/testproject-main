import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../../services/auth_service.dart';
import '../../services/mock_auth_service.dart';
import '../shared/toast_message.dart';

import 'login_button.dart';
import 'login_button_with_google.dart';
import 'login_form.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  void _handleLogin(BuildContext context, User user) async {
    final authService = Provider.of<MockAuthService>(context, listen: false);
    setState(() {
      _isLoading = true;
    });
    try {
      final success = await authService.signIn(user.email, user.password);
      setState(() {
        _isLoading = false;
      });
      print(success);
      if (success) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/landing',
          (_) => false,
        );
      } else {
        showToast(
          'Invalid credentials',
          Colors.red,
          Colors.white,
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print(e.toString());
      showToast(
        'An error occurred ',
        Colors.red,
        Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Builder(
                      builder: (context) {
                        return LoginForm(
                          onLogin: (user) => _handleLogin(context, user),
                        );
                      }
                    ),
                    SizedBox(height: 20.0),
                    LoginButtonWithGoogle()
                  ],
                ),
              ),
      ),
    );
  }
}
