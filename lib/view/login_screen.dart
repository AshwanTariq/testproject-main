
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobtest/view/dashboard_screen.dart';
import 'package:jobtest/view/signup_screen.dart';
import 'package:path_provider/path_provider.dart';

import '../data/widgets/global_data.dart';
import '../models/user/auth_model.dart';
import '../utils/colors.dart';
import '../utils/session_controller.dart';
import 'package:path/path.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  UserAuthentication auth = UserAuthentication(email: '', password: '');
  UserSession session = UserSession();

  Future<void> fetchingData(BuildContext context) {
    return Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.face,
                  size: 150,
                  color: primaryColor,
                ),
                const SizedBox(
                  height: 100,
                ),
                TextFormField(
                  decoration: getInputDecoration("Email"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    auth.email = value;
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: getInputDecoration("Password"),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    auth.password = value;
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {



                          // Save the user's session data
                          await session.saveUserSession().then((value) {
                            showSnackBar(
                                context,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text("Authenticating..."),
                                    CircularProgressIndicator(),
                                  ],
                                ));

                            fetchingData(context).then((value) {
                              ScaffoldMessenger.of(context).clearSnackBars();
                              if (auth.email == "ashwan@123" &&
                                  auth.password == "123456789") {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Dashboard(),
                                    ),
                                    (Route<dynamic> route) => false);
                              } else {
                                showSnackBar(context, Text("Try Again"));
                              }
                            });
                          });


                        }
                      },
                      child: const Text('Sign in')),
                ),
                const SizedBox(height: 10.0),
                TextButton(
                  child: const Text('Sign up'),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupScreen())),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
