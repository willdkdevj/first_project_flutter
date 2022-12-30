import 'package:flutter/material.dart';
import 'package:proj_flutter_one/db/database.dart';
import 'package:proj_flutter_one/screens/tasks_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      MyApp(
        dao: await $FloorAppDatabase.databaseBuilder("app_database.db").build(),
      ));
}

class MyApp extends StatelessWidget {
  final AppDatabase dao;
  const MyApp({key, required this.dao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup One',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
      ),
      themeMode: ThemeMode.light,
      home: TasksScreen(dao: dao),
    );
  }
}




