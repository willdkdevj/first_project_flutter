import 'package:floor/floor.dart';
import 'package:proj_flutter_one/dao/entity/task_entity.dart';
import 'package:proj_flutter_one/repository/interface/repository_dao_interface.dart';

@dao
abstract class RepositoryDaoTask extends IRepositoryDaoInterface<TaskEntity>{

  @Query('SELECT * FROM Tasks WHERE id = :id')
  Future<TaskEntity?> getById(int id);

  @Query('SELECT * FROM Tasks')
  Future<List<TaskEntity>> getAll();
}