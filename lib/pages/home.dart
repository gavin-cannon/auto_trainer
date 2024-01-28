import 'package:auto_trainer/exercise.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:auto_trainer/boxes.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Button Toggle Variable
  bool myNewButton = false;

  //Select Random Exercise
  Exercise firstExercise = boxExercises.getAt(randomNumber);

  String myText = "hello";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auto Trainer"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child:
              (Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(myNewButton ? "" : firstExercise.name),
        ElevatedButton(
          onPressed: () {
            // Rebuild the page and change button value
            setState(() {
              myNewButton = !myNewButton;
            });
          },
          child: Text("Display Random Exercise"),
        ),
      ]))),
    );
  }
}
