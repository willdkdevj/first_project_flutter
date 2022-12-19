import 'package:flutter/material.dart';
import 'package:proj_alura_one/models/task.dart';

class TaskFormWidget extends StatelessWidget {
  TaskFormWidget({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _imageController = TextEditingController();
  final _difficultController = TextEditingController();
  final title = const Text("Nova Tarefa da Startup");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title,),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText : 'Nome',
                  hintText: 'Nome da tarefa',
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'Insira um nome para a tarefa';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageController,
                decoration: const InputDecoration(
                    labelText : 'Imagem',
                    hintText: 'Caminho da imagem',
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'Insira um caminho para a imagem';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                    labelText : 'Dificuldade',
                    hintText: 'Valor válido para dificuldade (Inteiro)',
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return 'Insira um válido para a dificuldade';
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top:8),
                child: ElevatedButton(
                  child: const Text("Salvar"),
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      final task = Task(_nameController.text, _imageController.text, _difficultController as int);
                      Navigator.pop(context, task);
                    }
                  },
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
