import 'package:adviser_app/0_data/repositories/advice_repo_impl.dart';
import 'package:adviser_app/1_domain/entities/advice_entity.dart';
import 'package:adviser_app/1_domain/failures/failure.dart';
import 'package:adviser_app/1_domain/use_cases/advice_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:test/test.dart ';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'advice_usecases_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AdviceRepoImpl>()])
void main() {
  group('AdviceUsecases', () {
    group('should return AdviceEntity', () {
      test('when sth happens', () async {
        final mockAdviceRepoImpl = MockAdviceRepoImpl();
        final adviceUseCaseUnderTest =
            AdviceUseCases(adviceRepo: mockAdviceRepoImpl);

        when(mockAdviceRepoImpl.getAdviceFromDataSource()).thenAnswer(
            (realInvocation) => Future.value(
                const Right(AdviceEntity(advice: 'test', id: 42))));

        final result = await adviceUseCaseUnderTest.getAdvice();

        expect(result.isLeft(), false);
        expect(result.isRight(), true);
        expect(
            result,
            const Right<Failure, AdviceEntity>(
                AdviceEntity(advice: 'test', id: 42)));
        verify(mockAdviceRepoImpl.getAdviceFromDataSource()).called(1);
        // verifyNever(mockAdviceRepoImpl.getAdviceFromDataSource());
        verifyNoMoreInteractions(mockAdviceRepoImpl);
      });
    });

    group('should return left with', () {
      test('a Server Failure', () async {
        final mockAdviceRepoImpl = MockAdviceRepoImpl();
        final adviceUseCaseUnderTest =
            AdviceUseCases(adviceRepo: mockAdviceRepoImpl);

        when(mockAdviceRepoImpl.getAdviceFromDataSource()).thenAnswer(
            (realInvocation) => Future.value(Left(ServerFailure())));

        final result = await adviceUseCaseUnderTest.getAdvice();

        expect(result.isLeft(), true);
        expect(result.isRight(), false);
        expect(result, Left<Failure, AdviceEntity>(ServerFailure()));
        verify(mockAdviceRepoImpl.getAdviceFromDataSource()).called(1);
        verifyNoMoreInteractions(mockAdviceRepoImpl);
      });
    });
    test('a General Failure', () async {
      final mockAdviceRepoImpl = MockAdviceRepoImpl();
      final adviceUseCaseUnderTest =
          AdviceUseCases(adviceRepo: mockAdviceRepoImpl);

      when(mockAdviceRepoImpl.getAdviceFromDataSource())
          .thenAnswer((realInvocation) => Future.value(Left(GeneralFailure())));

      final result = await adviceUseCaseUnderTest.getAdvice();

      expect(result.isLeft(), true);
      expect(result.isRight(), false);
      expect(result, Left<Failure, AdviceEntity>(GeneralFailure()));
      verify(mockAdviceRepoImpl.getAdviceFromDataSource()).called(1);
      verifyNoMoreInteractions(mockAdviceRepoImpl);
    });
  });
}
