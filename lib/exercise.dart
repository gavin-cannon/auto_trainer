import 'package:hive/hive.dart';

part 'exercise.g.dart';

@HiveType(typeId: 1)
class Exercise {
  Exercise({
    required this.name,
    required this.instructions,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  String instructions;
}
