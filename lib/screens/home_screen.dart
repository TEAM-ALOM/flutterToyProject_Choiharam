import 'package:first_project/screens/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime initialDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F2123),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F2123),
        title: const Text(
          'TodoList',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '${initialDay.year} - ${initialDay.month} - ${initialDay.day}',
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              child: ElevatedButton(
                onPressed: () async {
                  final DateTime? dateTime = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(3000),
                    initialDate: initialDay,
                  );
                  if (dateTime != null) {
                    setState(() {
                      initialDay = dateTime;
                    });
                  }
                },
                child: const Text(
                  '날짜 선택',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
