import 'package:adviser_app/0_data/repositories/advice_repo_impl.dart';
import 'package:adviser_app/1_domain/entities/advice_entity.dart';
import 'package:adviser_app/1_domain/failures/failure.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  final adviceRepo = AdviceRepoImpl();
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return adviceRepo.getAdviceFromDataSource();
  }
}
