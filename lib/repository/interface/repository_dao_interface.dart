import 'package:floor/floor.dart';
import 'package:proj_flutter_one/dao/entity/task_entity.dart';


abstract class IRepositoryDaoInterface<Task extends TaskEntity>{

  @insert
  Future<int> insertTask(Task task);

  @update
  Future<int> updateTask(Task task);

  @delete
  Future<int> deleteTask(Task task);

}