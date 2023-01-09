import 'package:flutter/cupertino.dart';

import '../../data/local_data.dart';
import '../../models/car/car_model.dart';

class CarProvider extends ChangeNotifier {
  List<Car> cars = [
    Car(
        color: "Red",
        make: "Tesla",
        model: "Tesla Model S",
        registrationNo: "QRSTU2"),
    Car(
        color: "Green",
        make: "Toyota",
        model: "1.8 X",
        registrationNo: "WHYTU2"),
    Car(
        color: "Blue",
        make: "Honda",
        model: "Honda Model S",
        registrationNo: "HYJUT2"),
  ];

  // Getting all cars
  Future<List<Car>> getData() {
    return Future.delayed(Duration(seconds: 3)).then((value) {
      return cars;
    });
  }

// Adding one car
  void addCars(Car car) {
    cars.add(car);
    notifyListeners();
  }

  // Removing car
  void removeCar(String reg) {
    cars.removeWhere((item) => item.registrationNo == reg);

  }

// Updating car
  void updateCar(Car car, String reg) {
    cars[cars.indexWhere(
        (element) => element.registrationNo == car.registrationNo)] = car;
    notifyListeners();
  }
}
