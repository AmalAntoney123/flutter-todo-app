// ignore_for_file: camel_case_types

import 'package:hive_flutter/hive_flutter.dart';

class toDoDatabase {
  List toDo = [];

  final _mybox = Hive.box("todobox");

  void createInitialData() {
    toDo = [
      ["First task", false],
      ["Completed task", true],
      ["Swipe right and Click to delete", false],
    ];
  }

  void loadData() {
    toDo = _mybox.get("TODOLIST");
  }

  void updateData() {
    _mybox.put("TODOLIST", toDo);
  }
}
