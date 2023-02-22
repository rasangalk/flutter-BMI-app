import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double height = 150.0;
  double weight = 55.5;
  String gender = 'M';
  late double bmi = calculateBMI(height: height, weight: weight);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = "M";
                      });
                    },
                    child: Container(
                      height: 200,
                      width: 175,
                      decoration: BoxDecoration(
                          color: gender == "M"
                              ? Colors.orange
                              : Colors.orange.withAlpha(50),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.male,
                            size: 150,
                          ),
                          Text("Male")
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = "F";
                      });
                    },
                    child: Container(
                      height: 200,
                      width: 175,
                      decoration: BoxDecoration(
                          color: gender == "F"
                              ? Colors.orange
                              : Colors.orange.withAlpha(50),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        children: const [
                          Icon(
                            Icons.female,
                            size: 150,
                          ),
                          Text("Female"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 200),
                    child: Column(
                      children: [
                        const Text("Height"),
                        Text(
                          "$height",
                          style: const TextStyle(
                              fontSize: 50, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height >= 51) {
                                    height--;
                                    bmi = calculateBMI(
                                        height: height, weight: weight);
                                  }
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            const SizedBox(width: 25),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  height++;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, top: 200),
                    child: Column(
                      children: [
                        const Text("Weight"),
                        Text(
                          "$weight",
                          style: const TextStyle(
                              fontSize: 50, fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 0) {
                                    weight--;
                                    bmi = calculateBMI(
                                        height: height, weight: weight);
                                  }
                                });
                              },
                              child: const Icon(
                                Icons.remove,
                                size: 40,
                              ),
                            ),
                            const SizedBox(width: 25),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: const Icon(
                                Icons.add,
                                size: 40,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    const Text(
                      "BMI",
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      bmi.toStringAsFixed(2),
                      style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w700,
                          color: Colors.blueAccent),
                    ),
                    Text(getResult(bmi))
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  double calculateBMI({required double height, required double weight}) {
    return (weight / (height * height)) * 10000;
  }

  String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return "Overweight";
    } else if (bmiValue > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }
}
