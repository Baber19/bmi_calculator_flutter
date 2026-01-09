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
                      left: 140,
                      top: 70,
                      child: Text(
                        "24.5",
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
                  "Healthy",
                  style: TextStyle(color: Colors.tealAccent, fontSize: 50),
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
                            color: isMaleSelected ? Colors.grey : Colors.pinkAccent,
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
                            color: isMaleSelected ? Colors.grey : Colors.pinkAccent,
                            size: 80,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Age",
                          style: TextStyle(color: Colors.grey, fontSize: 30),
                        ),
                        Text(
                          "23",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Height",
                          style: TextStyle(color: Colors.grey, fontSize: 30),
                        ),
                        Text(
                          "23",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Weight",
                          style: TextStyle(color: Colors.grey, fontSize: 30),
                        ),
                        Text(
                          "23",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.heightOf(context),
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      print("Button presses");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                    child: Text(
                      "Calculate BMI",
                      style: TextStyle(color: Colors.white, fontSize: 30),
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
