// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/util/dialogueBox.dart';
import 'package:todoapp/util/toDoTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box('todobox');
  toDoDatabase db = toDoDatabase();

  @override
  void initState() {
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDo[index][1] = !db.toDo[index][1];
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.toDo.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
    db.updateData();
  }

  void addTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            cancelTask: () => Navigator.of(context).pop(),
            saveTask: saveNewTask,
          );
        });
    db.updateData();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDo.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 247, 154),
      appBar: AppBar(
        title: Text('To Do'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDo.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDo[index][0],
            taskCompleted: db.toDo[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
