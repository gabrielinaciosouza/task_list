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
  static const String COLUMN_DESCRIPTION = 'description';
  static const String COLUMN_STATUS = 'status';
  static const String COLUMN_DATE = 'dateTime';

  DatabaseDatasourceImpl._();

  static final DatabaseDatasourceImpl db = DatabaseDatasourceImpl
      ._(); //criando o objeto db que ira acessar essa classe

  Database _database;

  Future<Database> get database async {
    print('database getter called');

    if (_database != null) {
      return _database;
    }

    _database = await createDatabase() as Database;

    return _database;
  }

  @override
  Future<Either<CreateError, Database>> createDatabase() async {
    try {
      String dbPath = await getDatabasesPath();
      return Right(await openDatabase(join(dbPath, 'taskDB.db'), version: 1,
          onCreate: (Database database, int version) async {
        print('Creating task table');

        await database.execute('CREATE TABLE $TABLE_TASK ('
            '$COLUMN_ID INTEGER PRIMARY KEY,'
            '$COLUMN_TITLE TEXT,'
            '$COLUMN_STATUS TEXT,'
            '$COLUMN_DESCRIPTION TEXT,'
            '$COLUMN_DATE DATETIME'
            ')');
      }));
    } catch (e) {
      return Left(CreateError(message: e.toString()));
    }
  }

  @override
  Future<Either<GetError, List<TaskModel>>> getTask() async {
    try {
      final db = await database;

      var tasks = await db.query(TABLE_TASK, columns: [
        COLUMN_ID,
        COLUMN_TITLE,
        COLUMN_DESCRIPTION,
        COLUMN_STATUS,
        COLUMN_DATE
      ]);

      List<TaskModel> taskList = List<TaskModel>();

      tasks.forEach((currentTask) {
        TaskModel task = TaskModel.fromMap(currentTask);
        taskList.add(task);
      });

      return Right(taskList);
    } catch (e) {
      return Left(GetError(message: e.toString()));
    }
  }

  @override
  Future<Either<InsertError, TaskModel>> insertTask(TaskModel task) async {
    try {
      final db = await database;

      task.id = await db.insert(TABLE_TASK, task.toMap());

      return Right(task);
    } catch (e) {
      return Left(InsertError(message: e.toString()));
    }
  }

  @override
  Future<Either<DeleteError, int>> deleteTask(int id) async {
    try {
      final db = await database;

      return Right(
          await db.delete(TABLE_TASK, where: 'id = ?', whereArgs: [id]));
    } catch (e) {
      return Left(DeleteError(message: e.toString()));
    }
  }

  @override
  Future<Either<UpdateError, int>> updateTask(TaskModel task) async {
    try {
      final db = await database;

      return Right(await db.update(TABLE_TASK, task.toMap(),
          where: 'id = ?', whereArgs: [task.id]));
    } catch (e) {
      return Left(UpdateError(message: e.toString()));
    }
  }
}
