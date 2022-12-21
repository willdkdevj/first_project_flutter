import 'package:flutter/material.dart';
import 'package:proj_flutter_one/models/task.dart';

class TaskFormWidget extends StatelessWidget {
  TaskFormWidget({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _formDifficult = GlobalKey<FormFieldState>();

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
                  } on Exception{
                    return 'Informe um número válido para a dificuldade';
                  }

                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.only(top:8),
                child: ElevatedButton(
                  child: const Text("Salvar"),
                  onPressed: () {
                    _formDifficult.currentState?.validate();
                    if(_formKey.currentState!.validate()){
                      final String nome = _nameController.text;
                      final String imagem = _imageController.text;
                      final int? dificuldade = int.tryParse(_difficultController.text);

                      final task = Task(nome, imagem, dificuldade!);

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
