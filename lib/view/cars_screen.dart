import 'package:flutter/material.dart';
import 'package:jobtest/data/widgets/car_list_item.dart';
import 'package:jobtest/models/car/car_model.dart';
import 'package:jobtest/utils/car_enum.dart';
import 'package:jobtest/view/new_car.dart';
import 'package:jobtest/view_model/car_provider/car_provider.dart';
import 'package:provider/provider.dart';

class CarsScreen extends StatefulWidget {
  CarsScreen({Key? key}) : super(key: key);

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  CarProvider carProvider = CarProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CARS"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => NewCar()))
            .whenComplete(() => setState(() {})),
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<List<Car>>(
          future: context.read<CarProvider>().getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<Car>? data = snapshot.data;
                if (data!.isNotEmpty) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return CarListItem(
                          car: data[index],
                          onDelete: (regNo) => setState(() =>
                              context.read<CarProvider>().removeCar(regNo)),
                          onEdit: (regNon, car) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewCar(
                                carStatus: CarStatus.editCar,
                                carModel: car.model,
                                make: car.make,
                                regNo: car.registrationNo,
                                color: car.color,
                              ),
                            ),
                          ).whenComplete(() => setState(() {})),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      itemCount: data.length);
                } else {
                  return const Center(
                    child: Text("NO CARS"),
                  );
                }
              }
            }
            return const Center(
              child: Text("LAST CALL RETURN"),
            );
          }),
    );
  }
}
