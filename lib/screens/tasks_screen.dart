import 'package:flutter/material.dart';
import 'package:proj_flutter_one/dao/entity/task_entity.dart';
import 'package:proj_flutter_one/models/task.dart';

import '../db/database.dart';
import 'form_screen.dart';

class TasksScreen extends StatefulWidget {
  final AppDatabase dao;

  const TasksScreen({key, required this.dao}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text('Startup-One: Tarefas'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<TaskEntity>>(
              future: widget.dao.repositoryDaoTask.getAll(),
              builder: (context, snapshot) {
                return snapshot.data!.isNotEmpty // hasData
                    ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Padding(
                            padding: const EdgeInsets.all(0.1),
                            child: Task(
                                snapshot.data![index].name,
                                snapshot.data![index].image,
                                snapshot.data![index].difficult)),
                        onLongPress: () async {
                          var result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) {
                                  return TaskFormWidget(
                                      widget.dao, snapshot.data![index],
                                      key: widget.key);
                                }
                            ),
                          );
                          if (result) {
                            setState(() {});
                          }
                        }
                    );
                  },
                )
                    : const Center(
                  child: Text('Não há tarefas para o projeto'),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return TaskFormWidget(
                widget.dao, null, key: widget.key);
            }
            ),
          );
          if (result) {
            setState(() {

            });
          }
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
