import 'package:auto_trainer/exercise.dart';
import 'package:auto_trainer/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'boxes.dart';

void main() async {
  //Connect Hive DB
  await Hive.initFlutter();
  // Create Hive Adapter
  Hive.registerAdapter(ExerciseAdapter());
  boxExercises = await Hive.openBox<Exercise>('exerciseBox');

  // Set up Exercise Hive Box
  // boxExercises.clear();
  boxExercises.put('key_Push-Ups',
      Exercise(name: 'Push-Ups', instructions: 'Do a push-up.'));
  boxExercises.put(
      'key_Running', Exercise(name: 'Running', instructions: 'Go for a run.'));
  boxExercises.put(
      'key_Squats', Exercise(name: 'Squats', instructions: 'Do a squat.'));
  Exercise firstExercise = boxExercises.getAt(0);
  String myText = firstExercise.name;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }
}
