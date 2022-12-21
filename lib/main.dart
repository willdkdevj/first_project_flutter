import 'package:flutter/material.dart';
import 'package:proj_flutter_one/screens/form_screen.dart';
import 'package:proj_flutter_one/screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup One',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => TasksScreen(),
        '/form' : (context) => TaskFormWidget()
      },
    );
  }
}




