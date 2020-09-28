import 'dart:convert';

import 'package:tasklist/app/modules/tasks/domain/entities/task.dart';

class TaskModel extends Task {
  int id;
  final String title;
  final String time;
  final String date;
  String status;
  String time1;
  String date1;
  String time2;
  String date2;

  TaskModel({
    this.id,
    this.title,
    this.time,
    this.date,
    this.status,
    this.time1,
    this.date1,
    this.time2,
    this.date2,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TaskModel(
      id: map['id'],
      title: map['title'],
      time: map['time'],
      date: map['date'],
      status: map['status'],
      time1: map['time1'],
      date1: map['date1'],
      time2: map['time2'],
      date2: map['date2'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'time': time,
      'date': date,
      'status': status,
      'time1': time1,
      'date1': date1,
      'time2': time2,
      'date2': date2,
    };
  }

  TaskModel copyWith({
    int id,
    String title,
    String time,
    String date,
    String status,
    String time1,
    String date1,
    String time2,
    String date2,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      time: time ?? this.time,
      date: date ?? this.date,
      status: status ?? this.status,
      time1: time1 ?? this.time1,
      date1: date1 ?? this.date1,
      time2: time2 ?? this.time2,
      date2: date2 ?? this.date2,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, time: $time, date: $date, status: $status, time1: $time1, date1: $date1, time2: $time2, date2: $date2)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TaskModel &&
        o.id == id &&
        o.title == title &&
        o.time == time &&
        o.date == date &&
        o.status == status &&
        o.time1 == time1 &&
        o.date1 == date1 &&
        o.time2 == time2 &&
        o.date2 == date2;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        time.hashCode ^
        date.hashCode ^
        status.hashCode ^
        time1.hashCode ^
        date1.hashCode ^
        time2.hashCode ^
        date2.hashCode;
  }
}
