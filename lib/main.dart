import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jobtest/utils/session_controller.dart';
import 'package:jobtest/view/dashboard_screen.dart';
import 'package:jobtest/view/login_screen.dart';
import 'package:jobtest/view/splash_screen.dart';
import 'package:jobtest/view_model/car_provider/car_provider.dart';
import 'package:path_provider/path_provider.dart';

import 'package:path/path.dart';
import 'package:provider/provider.dart';

import 'models/car/car_model.dart';

void main() async {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CarProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ThemeData themeData = ThemeData(
    primarySwatch: Colors.purple,
  );
  UserSession session = UserSession();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      home: FutureBuilder<bool>(
          future: session.isLoggedIn(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashScreen();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                bool? flag = snapshot.data;
                if (flag == true) {
                  return Dashboard();
                } else {
                  return LoginScreen();
                }
              }
              if (snapshot.hasError) {
                return const Scaffold(
                    body: Center(
                  child: Text("ERROR"),
                ));
              }
            }
            return const Scaffold(
                body: Center(
              child: Text("ERROR LAST CALL RETURN"),
            ));
          }),
    );
  }
}
