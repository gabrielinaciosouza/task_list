abstract class DatabaseError implements Exception {}

class DeleteError implements DatabaseError {
  final String message;

  DeleteError({this.message});
}

class CreateError implements DatabaseError {
  final String message;

  CreateError({this.message});
}

class GetError implements DatabaseError {
  final String message;

  GetError({this.message});
}

class UpdateError implements DatabaseError {
  final String message;

  UpdateError({this.message});
}

class InsertError implements DatabaseError {
  final String message;

  InsertError({this.message});
}
