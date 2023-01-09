import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobtest/utils/session_controller.dart';
import 'package:jobtest/view/cars_screen.dart';
import 'package:jobtest/view/login_screen.dart';
import 'package:provider/provider.dart';

import '../data/widgets/global_data.dart';
import '../models/car/car_model.dart';
import '../utils/colors.dart';
import '../view_model/car_provider/car_provider.dart';
import 'new_car.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  UserSession session = UserSession();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            session.clearUserSession().then((value) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                  (Route<dynamic> route) => false);
            });
          },
          child: Icon(Icons.logout_sharp)),
      body: Column(
        children: [
          Consumer<CarProvider>(
            builder: (context, model, child) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 400,
                  decoration: decoration,
                  child: Center(
                    child: Text(
                      'Number of Cars\n ${model.cars.length}',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 34),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: decoration,
              height: 100,
              child: TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CarsScreen()));
              }, child: Text("SHOW ALL CARS")),
            ),
          )
        ],
      ),
    );
  }
}
