import 'package:flutter/material.dart';
import 'package:jobtest/data/widgets/global_data.dart';
import 'package:jobtest/models/car/car_model.dart';
import 'package:jobtest/view_model/car_provider/car_provider.dart';
import 'package:provider/provider.dart';

import '../utils/car_enum.dart';

class NewCar extends StatefulWidget {
  NewCar(
      {Key? key,
      this.color = "Red",
      this.make = "",
      this.carModel = "",
      this.regNo = "",
      this.carStatus = CarStatus.newCar})
      : super(key: key);

  String carModel;
  String make;
  String regNo;
  String color;
  CarStatus carStatus;
  @override
  _NewCarState createState() => _NewCarState();
}

class _NewCarState extends State<NewCar> {
  final _formKey = GlobalKey<FormState>();
  CarProvider carProvider = CarProvider();

  TextEditingController model=TextEditingController();
  TextEditingController make=TextEditingController();
  TextEditingController reg=TextEditingController();

  @override
  void initState() {

    model.text=widget.carModel;
    make.text=widget.make;
    reg.text=widget.regNo;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Car'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40,),
                TextFormField(
                  controller: model,
                  decoration: getInputDecoration("Car Model"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a car model';
                    }
                    return null;
                  },
                  onSaved: (value) => widget.carModel = value!,
                ),
                SizedBox(height: 40,),
                TextFormField(
                  controller: make,
                  decoration: getInputDecoration("Make"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the make';
                    }
                    return null;
                  },
                  onSaved: (value) => widget.make = value!,
                ),
                SizedBox(height: 40,),
                TextFormField(
                  controller: reg,
                  decoration:getInputDecoration("Registration Number"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the reg no';
                    }
                    return null;
                  },
                  onSaved: (value) => widget.regNo = value!,
                ),
                SizedBox(height: 40,),
                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: 'Color'),
                  value: widget.color,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please select some color';
                    }
                    return null;
                  },
                  items: ['Red', 'Green', 'Blue', 'Other'].map((color) {
                    return DropdownMenuItem(
                      value: color,
                      child: Text(color),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      widget.color = value!;
                    });
                  },
                ),
                SizedBox(height: 60,),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      if (widget.carStatus == CarStatus.newCar) {
                        context.read<CarProvider>().addCars(Car(
                            color: widget.color,
                            model: widget.carModel,
                            make: widget.make,
                            registrationNo: widget.regNo));
                      }else{
                        context.read<CarProvider>().updateCar(Car(
                            color: widget.color,
                            model: widget.carModel,
                            make: widget.make,
                            registrationNo: widget.regNo), widget.regNo);
                      }
                    }
                  },
                  child: Text(widget.carStatus == CarStatus.newCar
                      ? 'Add Car'
                      : 'Edit Car'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
