import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isMaleSelected = true;

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  double bmiResult = 1;

  void calculateBMI() {
    final double heightCm = double.parse(heightController.text);
    final double weightKg = double.parse(weightController.text);

    final double heightMeter = heightCm / 100;

    setState(() {
      bmiResult = weightKg / (heightMeter * heightMeter);
    });
  }


  String? bmiCalculation() {
    if (bmiResult < 18.5) {
      return "Underweight";
    } else if (bmiResult > 18.5 && bmiResult < 24.5) {
      return "Normal";
    } else if (bmiResult > 25 && bmiResult < 29.5) {
      return "Overweight";
    } else if (bmiResult >= 29.6) {
      return "Obese";
    }
  }

  Color? getBmiColor() {
    if (bmiResult < 18.5) {
      return Colors.orange;
    } else if (bmiResult > 18.5 && bmiResult < 24.5) {
      return Colors.teal;
    } else if (bmiResult > 25 && bmiResult < 29.5) {
      return Colors.red;
    } else if (bmiResult >= 29.6) {
      return Colors.red[700];
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Center(
              child: Text(
                "BMI Calculator",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Stack(
                  children: [
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assests/images/heart_icon-1.png",
                          color: Colors.pinkAccent,
                        ),
                      ],
                    ),
                    Positioned(
                      left: 130,
                      top: 70,
                      child: Text(
                        bmiResult.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  bmiCalculation()!,
                  style: TextStyle(
                    color: getBmiColor(),
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Male",
                          style: TextStyle(
                            color: isMaleSelected ? Colors.blue : Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isMaleSelected = true;
                            });
                          },
                          child: Icon(
                            Icons.male,
                            color: isMaleSelected ? Colors.blue : Colors.grey,
                            size: 80,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 60),
                    Column(
                      children: [
                        Text(
                          "Female",
                          style: TextStyle(
                            color: isMaleSelected
                                ? Colors.grey
                                : Colors.pinkAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isMaleSelected = false;
                            });
                          },
                          child: Icon(
                            Icons.female,
                            color: isMaleSelected
                                ? Colors.grey
                                : Colors.pinkAccent,
                            size: 80,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Age(years)",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 5),

                            TextField(
                              textAlign: TextAlign.center,
                              controller: ageController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2,color: Colors.green),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2,color: Colors.grey),
                                  ),
                                  hintText: "age",hintStyle: TextStyle(fontSize: 13)
                              ),

                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(color: Colors.grey, width: 1, height: 90),
                      SizedBox(width: 10,),


                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Height(cm)",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 5),

                            TextField(
                              textAlign: TextAlign.center,

                              controller: heightController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2,color: Colors.green),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2,color: Colors.grey),
                                  ),
                                  hintText: "height",hintStyle: TextStyle(fontSize: 13)
                              ),

                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(color: Colors.grey, width: 1, height: 90),
                      SizedBox(width: 10,),

                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Weight(kg)",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 5),

                            TextField(
                              textAlign: TextAlign.center,

                              controller: weightController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2,color: Colors.green),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2,color: Colors.grey),
                                ),
                                hintText: "weight",hintStyle: TextStyle(fontSize: 13)
                              ),

                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 100,
                    width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        calculateBMI();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,

                    ),
                    child: Center(
                      child: Text(
                        "Calculate BMI",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
