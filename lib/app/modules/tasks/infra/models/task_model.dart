import 'package:tasklist/app/modules/tasks/domain/entities/task.dart';
import 'package:tasklist/app/modules/tasks/external/datasource/database_datasource_impl.dart';

class TaskModel extends Task {
  int id;
  final String title;
  final String description;
  final DateTime dateTime;
  final String status;

  TaskModel(
      {this.id, this.title, this.description, this.dateTime, this.status});

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return new TaskModel(
      id: map[DatabaseDatasourceImpl.COLUMN_ID] as int,
      title: map[DatabaseDatasourceImpl.COLUMN_TITLE] as String,
      description: map[DatabaseDatasourceImpl.COLUMN_DESCRIPTION] as String,
      dateTime: map[DatabaseDatasourceImpl.COLUMN_DATE] as DateTime,
      status: map[DatabaseDatasourceImpl.COLUMN_STATUS] as String,
    );
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseDatasourceImpl.COLUMN_TITLE: this.title,
      DatabaseDatasourceImpl.COLUMN_DESCRIPTION: this.description,
      DatabaseDatasourceImpl.COLUMN_DATE: this.dateTime,
      DatabaseDatasourceImpl.COLUMN_STATUS: this.status,
    };

    if (id != null) {
      map[DatabaseDatasourceImpl.COLUMN_ID] = this.id;
    }

    return map;
  }
}
