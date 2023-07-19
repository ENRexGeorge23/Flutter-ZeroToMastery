import 'dart:io';

import 'package:adviser_app/0_data/datasources/advice_remote_datasource.dart';
import 'package:adviser_app/0_data/exceptions/exceptions.dart';
import 'package:adviser_app/0_data/models/advise_model.dart';
import 'package:adviser_app/0_data/repositories/advice_repo_impl.dart';
import 'package:adviser_app/1_domain/entities/advice_entity.dart';
import 'package:adviser_app/1_domain/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart ';
import 'advice_repo_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRemoteDataSource>()])
void main() {
  group('AdviceRepoImp', () {
    group('should retun AdviceEntity', () {
      test('when AdviceRemoteDataSource returns a AdviceModel', () async {
        final mockAdviceRemoteDataSource = MockAdviceRemoteDataSourceImpl();
        final adviceRepoImplUnderTest =
            AdviceRepoImpl(adviceRemoteDataSource: mockAdviceRemoteDataSource);

        when(mockAdviceRemoteDataSource.getRandomAdviceFromApi()).thenAnswer(
            (realInvocation) =>
                Future.value(AdviceModel(advice: 'test', id: 42)));

        final result = await adviceRepoImplUnderTest.getAdviceFromDataSource();
        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(result,
            Right<Failure, AdviceModel>(AdviceModel(advice: 'test', id: 42)));
        verify(mockAdviceRemoteDataSource.getRandomAdviceFromApi()).called(1);
        verifyNoMoreInteractions(mockAdviceRemoteDataSource);
      });
    });

    group('should return left with', () {
      test('a ServerFailure when a Server Exception occurs', () async {
        final mockAdviceRemoteDataSource = MockAdviceRemoteDataSourceImpl();
        final adviceRepoImplUnderTest =
            AdviceRepoImpl(adviceRemoteDataSource: mockAdviceRemoteDataSource);

        when(mockAdviceRemoteDataSource.getRandomAdviceFromApi())
            .thenThrow(ServerException());

        final result = await adviceRepoImplUnderTest.getAdviceFromDataSource();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceEntity>(ServerFailure()));
      });
    });

    test('a General Failure when a Server Exception occurs', () async {
      final mockAdviceRemoteDataSource = MockAdviceRemoteDataSourceImpl();
      final adviceRepoImplUnderTest =
          AdviceRepoImpl(adviceRemoteDataSource: mockAdviceRemoteDataSource);

      when(mockAdviceRemoteDataSource.getRandomAdviceFromApi())
          .thenThrow(const SocketException('test'));

      final result = await adviceRepoImplUnderTest.getAdviceFromDataSource();

      expect(result.isLeft(), true);
      expect(result.isRight(), false);
      expect(result, Left<Failure, AdviceEntity>(GeneralFailure()));
    });
  });
}
