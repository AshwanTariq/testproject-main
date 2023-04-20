

import 'package:flutter/material.dart';
import 'package:jobtest/services/api_auth_service.dart';
import 'package:jobtest/services/auth_service.dart';
import 'package:jobtest/services/mock_auth_service.dart';
import 'package:jobtest/views/landing/landing_page.dart';
import 'package:jobtest/views/login/login_page.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => User()),
        Provider<AuthService>(
          create: (_) => ApiAuthService(),
        ),
        Provider<MockAuthService>(
          create: (_) => MockAuthService(),
        ),
      ],
      child: MaterialApp(
        title: 'Login Demo',

        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/landing': (context) => LandingPage(),
        },
      ),
    );
  }
}
