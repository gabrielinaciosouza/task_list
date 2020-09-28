import 'package:tasklist/app/modules/tasks/domain/entities/task.dart';
import 'package:tasklist/app/modules/tasks/external/datasource/database_datasource_impl.dart';

class TaskModel extends Task {
  int id;
  final String title;
  final String time;
  final String date;
  final String status;

  TaskModel({this.time, this.date, this.id, this.title, this.status});

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return new TaskModel(
      id: map[DatabaseDatasourceImpl.COLUMN_ID] as int,
      title: map[DatabaseDatasourceImpl.COLUMN_TITLE] as String,
      time: map[DatabaseDatasourceImpl.COLUMN_TIME] as String,
      date: map[DatabaseDatasourceImpl.COLUMN_DATE] as String,
      status: map[DatabaseDatasourceImpl.COLUMN_STATUS] as String,
    );
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseDatasourceImpl.COLUMN_TITLE: this.title,
      DatabaseDatasourceImpl.COLUMN_DATE: this.date,
      DatabaseDatasourceImpl.COLUMN_STATUS: this.status,
      DatabaseDatasourceImpl.COLUMN_TIME: this.time,
    };

    if (id != null) {
      map[DatabaseDatasourceImpl.COLUMN_ID] = this.id;
    }

    return map;
  }
}
