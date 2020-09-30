import 'package:dartz/dartz.dart';
import 'package:tasklist/app/modules/tasks/domain/repositories/task_repository.dart';
import 'package:tasklist/app/modules/tasks/external/datasource/database_datasource_impl.dart';
import 'package:tasklist/app/modules/tasks/infra/models/task_model.dart';
import 'package:tasklist/app/modules/tasks/utils/errors/errors.dart';

class TaskRepositoryImpl implements TaskRepository {
  final DatabaseDatasourceImpl datasource;

  TaskRepositoryImpl(this.datasource);

  @override
  Future<Either<String, int>> deleteTask(int ids) async {
    try {
      final result = await datasource.deleteTask(ids);
      var response = result.fold(id, id);
      if (response == null) {
        return Left('Resposta nulla ao deletar!');
      }
      return Right(response);
    } on DeleteError catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, List<TaskModel>>> getTask() async {
    try {
      final result = await datasource.getTask();
      var response = result.fold(id, id);
      if (response == null) {
        return Left('Resposta nula ao pegar os dados!');
      }
      if (response is GetError) {
        return Left(response.message);
      }
      return Right(response);
    } on GetError catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, TaskModel>> insertTask(TaskModel task) async {
    try {
      final result = await datasource.insertTask(task);
      final response = result.fold(id, id);
      if (response == null) {
        return Left('Resposta nula ao inserir os dados!');
      }
      return Right(response);
    } on InsertError catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, int>> updateTask(TaskModel task) async {
    try {
      final result = await datasource.updateTask(task);
      var response = result.fold(id, id);
      if (response == null) {
        return Left('Resposta nula ao atualizar os dados!');
      }
      return Right(response);
    } on UpdateError catch (e) {
      return Left(e.message);
    }
  }
}
