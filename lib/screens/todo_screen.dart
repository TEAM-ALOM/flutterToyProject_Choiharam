import 'package:flutter/material.dart';

var taskcount = 0;

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  void onAddPressed() {
    setState(() {
      taskcount++;
    });
  }

  void onDeletePressed() {
    setState(() {
      taskcount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F2123),
      appBar: AppBar(
        title: const Text(
          'Haram\'s todo list',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF1F2123),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'My Task : $taskcount개',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TaskIconList(
                  myfunc: onDeletePressed,
                ),
                TaskIconList(
                  myfunc: onDeletePressed,
                ),
                TaskIconList(
                  myfunc: onDeletePressed,
                ),
                TaskIconList(
                  myfunc: onDeletePressed,
                ),
                TaskIconList(
                  myfunc: onDeletePressed,
                ),
                TaskIconList(
                  myfunc: onDeletePressed,
                ),
                TaskIconList(
                  myfunc: onDeletePressed,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      bottomNavigationBar: IconButton(
        onPressed: onAddPressed,
        icon: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 40,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.add_box_rounded,
                color: Colors.white.withOpacity(0.7),
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskIconList extends StatefulWidget {
  TaskIconList({
    super.key,
    this.myfunc,
  });

  var myfunc;

  @override
  State<TaskIconList> createState() => _TaskIconListState();
}

class _TaskIconListState extends State<TaskIconList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.7),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 0,
                        ),
                        child: Text(
                          '과제하기',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 0,
                        ),
                        child: IconButton(
                          onPressed: () {
                            widget.myfunc();
                          },
                          icon: const Icon(Icons.delete_outline),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
