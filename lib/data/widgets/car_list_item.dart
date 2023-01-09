import 'package:flutter/material.dart';
import 'package:jobtest/data/widgets/global_data.dart';
import 'package:jobtest/utils/colors.dart';

import '../../models/car/car_model.dart';

class CarListItem extends StatelessWidget {
  const CarListItem(
      {Key? key,
      required this.car,
      required this.onDelete,
      required this.onEdit})
      : super(key: key);

  final Car car;
  final Function(String) onDelete;
  final Function(String,Car) onEdit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: decoration,
        child: ListTile(
          title: Text(car.model),
          subtitle: Text(
              "Made By ${car.make} • Color ${car.color} • Reg. ${car.registrationNo}"),
          leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: primaryColor,
                child: IconButton(
                  color: whiteColor,
                  onPressed: () =>onDelete.call(car.registrationNo),
                  icon: Icon(Icons.delete),
                ),
              )),
          trailing: Container(
            color: primaryColor,
            child: IconButton(
              color: whiteColor,
              onPressed: () =>onEdit.call(car.registrationNo,car),
              icon: Icon(Icons.edit),
            ),
          )),
        ),
    );
  }
}
