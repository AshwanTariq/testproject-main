import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../models/user.dart';
import '../../services/auth_service.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final user = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Landing Page'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () async {
              authService
                  .signOut()
                  .whenComplete(() => Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/',
                        (route) => false,
                      ));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello, ${user.email}',
              style: const TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () async {
                try {
                  await authService.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/',
                    (route) => false,
                  );
                } catch (e) {
                  Fluttertoast.showToast(
                      msg: "An error occurred",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
