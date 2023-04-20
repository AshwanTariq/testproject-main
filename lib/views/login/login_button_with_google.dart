
import 'package:flutter/material.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../services/api_auth_service_google.dart';
import '../../services/auth_service.dart';

import '../shared/toast_message.dart';

class LoginButtonWithGoogle extends StatelessWidget {
  const LoginButtonWithGoogle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authServiceGoogle = ApiAuthServiceGoogle();

    return GoogleAuthButton(
      onPressed: () async {
        try {
          final user = await authServiceGoogle.signInWithGoogle();
          if (user != null) {
            showToast(
              "Logged in successfully ",
              Colors.green,
              Colors.white,
            );
          }
        } catch (e) {
          showToast(
            "Failed to log in with Google: ${e.toString()}",
            Colors.red,
            Colors.white,
          );
        }
      },


    );
  }
}
