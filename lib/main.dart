import 'package:flutter/material.dart';
import 'package:first_project/screens/todo_screen.dart';
import 'package:first_project/screens/home_screen.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Todo List',
      home: DatePicker(),
    );
  }
}
