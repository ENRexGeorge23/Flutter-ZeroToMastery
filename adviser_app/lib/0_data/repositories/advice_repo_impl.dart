import 'package:adviser_app/0_data/datasources/advice_remote_datasource.dart';
import 'package:adviser_app/0_data/exceptions/exceptions.dart';
import 'package:adviser_app/1_domain/entities/advice_entity.dart';
import 'package:adviser_app/1_domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';
import '../../1_domain/failures/failure.dart';

class AdviceRepoImpl implements AdviceRepo {
  final AdviceRemoteDataSource adviceRemoteDataSource =
      AdviceRemoteDataSourceImpl();
  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource() async {
    try {
      final result = await adviceRemoteDataSource.getRandomAdviceFromApi();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
