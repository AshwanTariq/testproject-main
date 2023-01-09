import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobtest/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Icon(Icons.car_rental,size: 180,color: primaryColor,),
            SizedBox(height: 50,),
            Text("SPLASH SCREEN"),
            SizedBox(height: 50,),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
