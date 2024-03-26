import 'package:first_project/screens/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  DateTime selectedDate = DateTime.now();

  final box = Hive.box('myBox');
  var date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F2123),
      appBar: customAppBar(context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: ElevatedButton(
              onPressed: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                );
                if (selectedDate != null) {
                  setState(() {
                    date = selectedDate;
                  });
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '날짜 선택',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar customAppBar(BuildContext context) {
    var month = date.month.toString().padLeft(2, '0'),
        day = date.day.toString().padLeft(2, '0');

    return AppBar(
      backgroundColor: const Color(0xFF1F2123),
      title: Text(
        'Selected date is $month/$day',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TodoList(),
              ),
            );
          },
          icon: const Icon(
            color: Colors.white,
            Icons.arrow_circle_right,
          ),
        ),
      ],
    );
  }
}
