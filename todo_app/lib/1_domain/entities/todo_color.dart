import 'package:flutter/material.dart';

class ToDoColor {
  final int colorIndex;

  static const List<Color> predefinedColors = [
    Colors.red,
    Colors.blueGrey,
    Colors.green,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.yellow,
    Colors.blue,
  ];

  Color get color => predefinedColors[colorIndex];

  ToDoColor({required this.colorIndex});
}
