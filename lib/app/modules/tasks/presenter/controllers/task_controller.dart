import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasklist/app/modules/tasks/domain/usecases/get_task.dart';
import 'package:tasklist/app/modules/tasks/infra/models/task_model.dart';

class TaskController extends GetxController {
  final GetTask getTask;

  TaskController({@required this.getTask}) : assert(getTask != null);

  final _taskList = List<TaskModel>().obs;
  // ignore: invalid_use_of_protected_member
  List<TaskModel> get taskList => this._taskList.value;
  set taskList(value) => this._taskList.value = value;

  getAll() {
    getTask.call().then((value) {
      var response = value.fold(id, id);
      this.taskList = response;
    });
  }
}
