import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../../services/auth_service.dart';
import '../shared/toast_message.dart';
import 'login_button.dart';




class LoginForm extends StatefulWidget {
  const LoginForm({Key? key, required this.onLogin}) : super(key: key);

  final Function(dynamic) onLogin;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
              validator: (value) {
                if (value=="") {
                  return 'Please enter your email in text field';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding:const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration:const InputDecoration(
                hintText: 'Enter your password',
              ),
              validator: (value) {
                if (value=="") {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
          ),
          LoginButton(
            text: 'Sign In',
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                try {
                  var value=User();
                  value.email=_emailController.text;
                  value.password=_passwordController.text;


                  widget.onLogin.call(value);
                }catch(e){

                }
              }
            },
          ),
        ],
      ),
    );
  }
}
