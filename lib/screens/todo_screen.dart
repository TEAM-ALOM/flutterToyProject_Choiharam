import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

var taskcount = 0;
var myTask = "";
var myTaskList = [];

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  void onAddPressed() {
    setState(() {
      myTaskList.add({'id': taskcount + 1, 'task': myTask});
      taskcount = myTaskList.length;
      myTask = "";
    });
  }

  void onDeleteTask(int id) {
    setState(() {
      myTaskList.removeWhere((task) => task['id'] == id);
      taskcount = myTaskList.length;
    });
  }

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F2123),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F2123),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'My TodoList',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Today\'s Task : $taskcount개',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: TextField(
                  onChanged: (text) {
                    setState(() {
                      myTask = text;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: '할 일을 입력하세요',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: myTaskList.map((task) {
                    return ListTile(
                      title: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '${task['task']}',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                onDeleteTask(task['id']);
                              },
                              icon: const Icon(Icons.delete_outlined),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30),
        child: IconButton(
          onPressed: () {
            onAddPressed();
          },
          icon: const Icon(
            Icons.add_box_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
