import 'package:flutter/material.dart';
import 'package:proj_alura_one/models/task.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _State();
}

class _State extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Startup-One: Tarefas'),
      ),
      body: ListView(
        children: const [
          Task('Aprender Dart',
              'assets/images/dart.png',
              3),
          Task('Aprender Flutter',
              'assets/images/flutter.jpg',
              5),
          Task('Aprender manusear Android Studio',
              'assets/images/android.png',
              2),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}