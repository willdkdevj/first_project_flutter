import 'package:floor/floor.dart';

@Entity(tableName: 'Tasks')
class TaskEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;

  String name;
  String image;
  int difficult;
  String? createdAt;
  String? updateAt;
  bool selected = false;

  TaskEntity(this.name, this.image, this.difficult,
      {this.createdAt, this.updateAt, this.selected = false})
      :super();
}
