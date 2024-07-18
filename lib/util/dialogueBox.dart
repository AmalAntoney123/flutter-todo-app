// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:todoapp/util/myButton.dart';

class DialogBox extends StatelessWidget {
  final controller;

  DialogBox({
    super.key,
    required this.controller,
    required this.cancelTask,
    required this.saveTask,
  });

  VoidCallback saveTask;
  VoidCallback cancelTask;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  onPressed: cancelTask,
                  buttonName: "Cancel",
                ),
                SizedBox(
                  width: 10,
                ),
                MyButton(onPressed: saveTask, buttonName: "Save"),
              ],
            )
          ],
        ),
      ),
      title: Text("Add New Task"),
    );
  }
}
