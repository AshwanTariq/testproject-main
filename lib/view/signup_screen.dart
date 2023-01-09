import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/widgets/global_data.dart';
import '../utils/colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  // Create a global key for the form
  final _formKey = GlobalKey<FormState>();

  // Create controllers for the email and password fields
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordControllerReWrite = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SIGN UP',),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Icon(
                  Icons.verified_user_rounded,
                  size: 150,
                  color: primaryColor,
                ),
                const SizedBox(
                  height: 100,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration:getInputDecoration("Email"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  decoration:  getInputDecoration("Password"),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
              const  SizedBox(height: 10.0),
                TextFormField(
                  controller: _passwordControllerReWrite,
                  decoration: getInputDecoration("Enter again"),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Re enter a password';
                    }
                    return null;
                  },
                ),
               const SizedBox(height: 16.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {

                        }
                      },
                      child: const Text('Sign up')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
