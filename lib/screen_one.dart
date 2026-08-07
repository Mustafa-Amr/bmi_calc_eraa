import 'package:flutter/material.dart';

import 'calc_screen.dart';

class ScreenOne extends StatefulWidget {

  ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  int height = 170;
  int weight = 70;
  int age = 25;
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0a0e22),
      appBar: AppBar(
        backgroundColor: Color(0xff0a0e22),
        title: Text('BMI Calculator',),
        foregroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: 60,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                ///Male***************
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isMaleSelected =! isMaleSelected;
                      isFemaleSelected = false;
                    });
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: isMaleSelected ? Colors.blue : Colors.white,
                        width: 10,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.male,size: 100,),
                        Text('Male',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                ///Female****************
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFemaleSelected =! isFemaleSelected;
                      isMaleSelected = false;
                    });
                  },
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: isFemaleSelected ? Colors.pink : Colors.white,
                        width: 10,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.female,size: 100,),
                        Text('Female',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ///Slider******************
            SizedBox(height: 35,),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Height',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  Text('${height} Cm',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  Slider(value: height.toDouble(),
                      min: 100,
                      max: 250,
                      activeColor: Colors.black,
                      onChanged: (value) {
                        setState(() {
                          height = value.toInt();
                        });
                      })
                ],
              ),
            ),
            SizedBox(height: 35,),
            Row(
              children: [
                ///Weight***************
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Weight',style:
                      TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                      Text('${weight}Kg',style:
                      TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor: Colors.red,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });
                            },child: Icon(Icons.remove),mini: true,),
                          SizedBox(width: 10,),
                          FloatingActionButton(
                            backgroundColor: Colors.green,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },child: Icon(Icons.add),mini: true,),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(width: 15,),
                ///Age****************
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Age',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                      Text('$age',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor: Colors.red,
                            onPressed: (){
                              setState(() {
                                age--;
                              });
                            },child: Icon(Icons.remove),mini: true,),
                          SizedBox(width: 10,),
                          FloatingActionButton(
                            backgroundColor: Colors.green,
                            onPressed: (){
                              setState(() {
                                age++;
                              });
                            },child: Icon(Icons.add),mini: true,),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Spacer(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  fixedSize: Size(420, 70),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CalcScreen(
                      bmi: calculateBMI(weight, height),
                      height: height,
                      weight: weight,
                      isMaleSelected: isMaleSelected,
                      isFemaleSelected: isFemaleSelected
                  )));
                },
                child: Text('Calculate',style:
                TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),)
            )
          ],
        ),
      ),
    );
  }
  double calculateBMI(int weight, int height) {
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }
}
