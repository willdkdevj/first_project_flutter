import 'package:flutter/material.dart';
import 'package:proj_flutter_one/dao/entity/task_entity.dart';

import '../db/database.dart';

class TaskFormWidget extends StatefulWidget {
  final AppDatabase? db;
  final TaskEntity? task;
  const TaskFormWidget(this.db, this.task, {required key}) : super(key: key);

  @override
  State<TaskFormWidget> createState() => _TaskFormWidgetState();
}

class _TaskFormWidgetState extends State<TaskFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _formDifficult = GlobalKey<FormFieldState>();

  final title = const Text("Nova Tarefa");

  var _idController = 0;
  var _createdAtController = '';
  var _nameController = TextEditingController();
  var _imageController = TextEditingController();
  var _difficultController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _idController = (widget.task != null ? widget.task!.id : 0)!;
    _createdAtController = (widget.task != null && widget.task?.createdAt != null ? widget.task?.createdAt : '')!;
    _nameController = TextEditingController(text: widget.task != null ? widget.task!.name : '');
    _imageController = TextEditingController(text: widget.task != null ? widget.task!.image : '');
    _difficultController = TextEditingController(text: widget.task != null ? widget.task!.difficult.toString() : '');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        actions: <Widget>[
          validateIdTask() ? IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                widget.db?.repositoryDaoTask.deleteTask(widget.task!);
                Navigator.pop(context, true);
              })
              : Container(),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Nome da tarefa',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira um nome para a tarefa';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _imageController,
                  decoration: const InputDecoration(
                    labelText: 'Imagem',
                    hintText: 'Caminho da imagem',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Informe o caminho para a imagem';
                    }
                    return null;
                  },
                ),
              TextFormField(
                key: _formDifficult,
                controller: _difficultController,
                decoration: const InputDecoration(
                    labelText : 'Dificuldade',
                    hintText: 'Valor de 1 a 5',
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'Insira um válido para a dificuldade';
                    }
                    try {
                      int? result = int.tryParse(value.toString());
                      if (result! > 5) {
                        return 'Informe um valor de 1 a 5';
                      }
                    } on Exception {
                      return 'Informe um número válido para a dificuldade';
                    }

                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: ElevatedButton(
                      child: validateIdTask() ? const Text("Atualizar") : const Text("Salvar"),
                      onPressed: () {
                        _formDifficult.currentState?.validate();
                        if (_formKey.currentState!.validate()) {
                          final String nome = _nameController.text;
                          final String imagem = _imageController.text;
                          final int? dificuldade =
                              int.tryParse(_difficultController.text);

                          checkedSaveOrUpdate(nome, imagem, dificuldade);

                          Navigator.pop(context, true);
                        }
                      }),
                )
              ],
            ),
          )),
    );
  }

  bool validateIdTask() => _idController > 0;

  checkedSaveOrUpdate(String nome, String imagem, int? dificuldade) {
    if (validateIdTask()) {
      var task = TaskEntity(
        id: _idController,
        createdAt: _createdAtController,
        updateAt: DateTime.now().toUtc().toString(),
        nome,
        imagem,
        dificuldade!,
      );
      widget.db?.repositoryDaoTask.updateTask(task);
    } else {
      var task = TaskEntity(
        createdAt: DateTime.now().toUtc().toString(),
        nome,
        imagem,
        dificuldade!,
      );
      widget.db?.repositoryDaoTask.insertTask(task);
    }
  }
}
