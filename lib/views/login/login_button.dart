import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const LoginButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: TextButton(
        onPressed: ()=>onPressed.call(),
        child:  Text(
          text,
          style:  TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
