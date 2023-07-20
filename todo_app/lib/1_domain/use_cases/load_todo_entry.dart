import 'package:either_dart/src/either.dart';
import 'package:todo_app/1_domain/entities/todo_entry.dart';
import 'package:todo_app/1_domain/failures/failures.dart';
import 'package:todo_app/1_domain/repositories/todo_repository.dart';
import 'package:todo_app/core/use_case.dart';

class LoadToDoEntry implements UseCase<ToDoEntry, ToDoEntryIdParam> {
  const LoadToDoEntry({required this.toDoRepository});
  final ToDoRepository toDoRepository;

  @override
  Future<Either<Failure, ToDoEntry>> call(ToDoEntryIdsParam params) async {
    try {
      final loadedEntry = toDoRepository.readToDoEntry(
        params.collectionId,
        params.entryId,
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
