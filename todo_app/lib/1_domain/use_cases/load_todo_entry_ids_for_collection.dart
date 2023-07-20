import 'package:either_dart/either.dart';
import 'package:todo_app/1_domain/entities/unique_id.dart';
import 'package:todo_app/1_domain/failures/failures.dart';
import 'package:todo_app/1_domain/repositories/todo_repository.dart';
import 'package:todo_app/core/use_case.dart';

class LoadToDoEntryIdsForCollection
    implements UseCase<List<EntryId>, CollectionIdParam> {
  const LoadToDoEntryIdsForCollection({required this.toDoRepository});

  final ToDoRepository toDoRepository;

  @override
  Future<Either<Failure, List<EntryId>>> call(CollectionIdParam params) async {
    try {
      final loadedIds = toDoRepository.readToDoEntryIds(
        params.collectionId,
      );

      return loadedIds.fold(
        (left) => Left(left),
        (right) => Right(right as List<EntryId>),
      );
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}