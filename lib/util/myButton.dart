// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String buttonName;
  VoidCallback onPressed;

  MyButton({super.key, required this.onPressed, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(buttonName),
    );
  }
}
