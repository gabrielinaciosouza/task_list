import 'package:dartz/dartz.dart';
import 'package:tasklist/app/modules/tasks/domain/repositories/task_repository.dart';
import 'package:tasklist/app/modules/tasks/external/datasource/database_datasource_impl.dart';
import 'package:tasklist/app/modules/tasks/infra/models/task_model.dart';
import 'package:tasklist/app/modules/tasks/utils/errors/errors.dart';

class TaskRepositoryImpl implements TaskRepository {
  final DatabaseDatasourceImpl datasource;

  TaskRepositoryImpl(this.datasource);

  @override
  Future<Either<DeleteError, int>> deleteTask(int id) async {
    try {
      final result = await datasource.deleteTask(id) as int;
      return Right(result);
    } on DeleteError catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<GetError, List<TaskModel>>> getTask() async {
    try {
      final result = await datasource.getTask();
      var response = result.fold(id, id);
      if (response == null) {
        return Left(GetError(message: 'Tabela nula'));
      }
      return Right(response);
    } catch (e) {
      print(e.toString());
      return Left(e);
    }
  }

  @override
  Future<Either<InsertError, TaskModel>> insertTask(TaskModel task) async {
    try {
      final result = await datasource.insertTask(task);
      final response = result.fold(id, id);
      print(response);
      return Right(response);
    } on InsertError catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<UpdateError, int>> updateTask(TaskModel task) async {
    try {
      final result = await datasource.updateTask(task) as int;
      return Right(result);
    } on UpdateError catch (e) {
      return Left(e);
    }
  }

  @override
  Either<GetError, DateTime> getTimeDate() {
    try {
      var currentTime = DateTime.now();
      return Right(currentTime);
    } catch (e) {
      return Left(GetError(message: 'Erro ao pegar Data e Hora'));
    }
  }
}
