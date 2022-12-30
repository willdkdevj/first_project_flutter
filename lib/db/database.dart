import 'dart:async';
import 'package:floor/floor.dart';
import 'package:proj_flutter_one/dao/entity/task_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../dao/repository/repository_dao_task.dart';

part 'database.g.dart';

@Database(version: 1, entities: [TaskEntity])
abstract class AppDatabase extends FloorDatabase {
  RepositoryDaoTask get repositoryDaoTask;
}