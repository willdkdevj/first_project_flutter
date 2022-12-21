import 'package:flutter/material.dart';
import 'package:proj_flutter_one/models/task.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _State();
}

class _State extends State<TasksScreen> {
  List<Task> tasksList = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Startup-One: Tarefas'),
      ),
      body: Column(
        children: [
          // Wrap(
          //   children: _buildChoices()),
          Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: _buildListTasks(),
              )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/form').then((task) {
            setState(() {
              tasksList.add(task as Task);
            });
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  List<Widget> _buildListTasks() {
    return tasksList
        // .where((task) => task.selected)
        .map((task) => Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Task(task.name, task.image, task.difficult)))
        .toList();
  }
}
