import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tasklist/app/modules/tasks/infra/datasources/database_datasource.dart';
import 'package:tasklist/app/modules/tasks/infra/models/task_model.dart';
import 'package:tasklist/app/modules/tasks/utils/errors/errors.dart';

class DatabaseDatasourceImpl extends DatabaseDatasource {
  static const String TABLE_TASK = 'task';
  static const String COLUMN_ID = 'id';
  static const String COLUMN_TITLE = 'title';
  static const String COLUMN_STATUS = 'status';
  static const String COLUMN_DATE = 'date';
  static const String COLUMN_DATE1 = 'date1';
  static const String COLUMN_DATE2 = 'date2';
  static const String COLUMN_TIME = 'time';
  static const String COLUMN_TIME1 = 'time1';
  static const String COLUMN_TIME2 = 'time2';

  DatabaseDatasourceImpl._();
  DatabaseDatasourceImpl();

  static final DatabaseDatasourceImpl db = DatabaseDatasourceImpl
      ._(); //criando o objeto db que ira acessar essa classe

  Database _database;

  Future<Database> get database async {
    print('database getter called');

    if (_database != null) {
      print('database != null');
      return _database;
    }
    var result;
    var response;

    result = await createDatabase();
    if (result is CreateError) {
      return _database = null;
    }
    if (result is Right) {
      response = result.fold(id, id);
    }

    _database = response;

    return _database;
  }

  @override
  Future<Either<CreateError, Database>> createDatabase() async {
    try {
      String dbPath = await getDatabasesPath();
      return Right(await openDatabase(
        join(dbPath, 'taskDB.db'),
        version: 1,
        onCreate: (database, version) async {
          print('Creating task table');

          await database.execute('CREATE TABLE $TABLE_TASK ('
              '$COLUMN_ID INTEGER PRIMARY KEY,'
              '$COLUMN_TITLE TEXT,'
              '$COLUMN_STATUS TEXT,'
              '$COLUMN_TIME TEXT,'
              '$COLUMN_TIME1 TEXT,'
              '$COLUMN_TIME2 TEXT,'
              '$COLUMN_DATE TEXT,'
              '$COLUMN_DATE1 TEXT,'
              '$COLUMN_DATE2 TEXT'
              ')');
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          await db.execute('ALTER TABLE $TABLE_TASK ADD COLUMN date2 TEXT');
        },
      ));
    } catch (e) {
      return Left(CreateError(message: e.toString()));
    }
  }

  @override
  Future<Either<GetError, List<TaskModel>>> getTask() async {
    try {
      final db = await database;

      if (db == null) {
        return Left(GetError(message: 'Erro ao criar Database!'));
      }

      var tasks = await db.query(TABLE_TASK, columns: [
        COLUMN_ID,
        COLUMN_TITLE,
        COLUMN_TIME,
        COLUMN_STATUS,
        COLUMN_DATE,
        COLUMN_DATE1,
        COLUMN_DATE2,
        COLUMN_TIME1,
        COLUMN_TIME2
      ]);

      List<TaskModel> taskList = List<TaskModel>();

      tasks.forEach((currentTask) {
        TaskModel task = TaskModel.fromMap(currentTask);
        taskList.add(task);
      });
      return Right(taskList);
    } catch (e) {
      return Left(GetError(message: 'Erro ao carregar os Dados!'));
    }
  }

  @override
  Future<Either<InsertError, TaskModel>> insertTask(TaskModel task) async {
    try {
      final db = await database;
      if (db == null) {
        return Left(InsertError(
            message: 'Erro na DataBase ao inserir dados (db nula)!'));
      }

      task.id = await db.insert(TABLE_TASK, task.toMap());

      return Right(task);
    } catch (e) {
      return Left(
          InsertError(message: 'Erro ao inserir os dados na DataBase!'));
    }
  }

  @override
  Future<Either<DeleteError, int>> deleteTask(int id) async {
    try {
      final db = await database;
      if (db == null) {
        return Left(DeleteError(
            message: 'Erro na DataBase ao deletar dados (db nula)!'));
      }

      return Right(
          await db.delete(TABLE_TASK, where: 'id = ?', whereArgs: [id]));
    } catch (e) {
      return Left(DeleteError(message: 'Erro ao deletar dados na DataBase!'));
    }
  }

  @override
  Future<Either<UpdateError, int>> updateTask(TaskModel task) async {
    try {
      final db = await database;

      if (db == null) {
        return Left(UpdateError(
            message: 'Erro na DataBase ao atualizar dados (db nula)!'));
      }

      return Right(await db.update(TABLE_TASK, task.toMap(),
          where: 'id = ?', whereArgs: [task.id]));
    } catch (e) {
      return Left(UpdateError(message: 'Erro ao atualizar dados na DataBase!'));
    }
  }
}
