import 'package:adviser_app/1_domain/entities/advice_entity.dart';
import 'package:adviser_app/1_domain/failures/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AdviceRepo {
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource();
}
