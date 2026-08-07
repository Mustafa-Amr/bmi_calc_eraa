import 'package:flutter/material.dart';

class CalcScreen extends StatelessWidget {
  double bmi;
  int height;
  int weight;
  bool isMaleSelected;
  bool isFemaleSelected;
  CalcScreen({super.key, required this.bmi,
    required this.height, required this.weight,
    required this.isMaleSelected, required this.isFemaleSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a0e22),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff0a0e22),
        title: Text('Calculate BMI',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        toolbarHeight: 60,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Your BMI is:',style: TextStyle(color: Colors.white,fontSize: 30),)),
          SizedBox(height: 20,),
          Center(child: Text(bmi.toStringAsFixed(2),
            style: TextStyle(color: Colors.white,
                fontSize: 50,fontWeight: FontWeight.bold),)),
        ],
      ),
    );
  }
}
