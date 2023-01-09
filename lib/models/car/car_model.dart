import 'package:flutter/cupertino.dart';

class Car{
  String color;
  String model;
  String make;
  String registrationNo;

  // Constructor
  Car(
      { this.color="",
       this.model="",
       this.make="",
       this.registrationNo=""});

  // Convert object to json
  Map<String, dynamic> toJson() => {
        'color': color,
        'model': model,
        'make': make,
        'registrationNo': registrationNo,
      };

  // Factory constructor
  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
        color: json['color'],
        model: json['model'],
        make: json['make'],
        registrationNo: json['registrationNo']);
  }
}
