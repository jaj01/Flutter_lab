import 'package:flutter/material.dart';
void main() {
  runApp(CarMileageCalculator());
}
class CarMileageCalculator extends StatefulWidget {
  const CarMileageCalculator({super.key});
  @override
  State<CarMileageCalculator> createState() => _CarMileageCalculatorState();
}
class _CarMileageCalculatorState extends State<CarMileageCalculator> {
final _formkey = GlobalKey<FormState>();
final _distancecontroller = TextEditingController();
final _fuelcontroller = TextEditingController();
String _result = "";

void _calculateMileage() {
if(_formkey.currentState!.validate()){
double distance = double.tryParse(_distancecontroller.text) ?? 0.0;
double fuel = double.tryParse(_fuelcontroller.text) ?? 0.0;
double mileage = distance/fuel;
String performance = "";
if(mileage >= 15){
  performance = "Excellent Efficiency";
} else if (mileage >= 10 && mileage < 15) {
  
   performance = "Average Efficiency";
} else {
   performance = "Poor Efficiency";
}

setState((){
  _result = "Your Car's Mileage is ${mileage} Km/L - ${performance}";
});
}
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Mileage Calculator',
      home: Scaffold(appBar: AppBar(
        title: Text('Car Mileage Calculator'), 
        backgroundColor: Colors.purpleAccent,),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formkey,
            child: Column(children: [
              TextFormField(
                controller: _distancecontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter the Distance (Km): ",
                  border: OutlineInputBorder()
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Please Enter the distance!";
                  }
                  if(double.tryParse(value) == null){
                    return "Please return the valid number.";
                  }
                  return null;
                }
                ),
                SizedBox(height: 10,),
                TextFormField(
                controller: _fuelcontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter the Fuel (Litre): ",
                  border: OutlineInputBorder()
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Please Enter the Fuel!";
                  }
                  if(double.tryParse(value) == null){
                    return "Please return the valid number.";
                  }
                  return null;
                }
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amberAccent,
                    foregroundColor: Colors.white),
                  onPressed: _calculateMileage, 
                  child: Text("Calculate Mileage")),
                  SizedBox(height: 20,),
                  Text(_result, style: TextStyle(color: Colors.green))

            ],
            )
            ),
            )
        ,)
        );
  }
}

