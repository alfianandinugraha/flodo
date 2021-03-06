import 'package:nanoid/nanoid.dart';

class Todo {
  late String id;

  String name;

  bool isFinish = false;

  Todo({required this.name, this.isFinish = false}) {
    id = nanoid();
  }

  @override
  String toString() {
    return "(id = $id, name = $name, isFinished = $isFinish)";
  }
}
