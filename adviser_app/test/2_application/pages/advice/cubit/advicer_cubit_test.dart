import 'package:adviser_app/1_domain/entities/advice_entity.dart';
import 'package:adviser_app/1_domain/failures/failure.dart';
import 'package:adviser_app/1_domain/use_cases/advice_usecases.dart';
import 'package:adviser_app/2_application/pages/advice/cubit/advicer_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';

import 'package:mocktail/mocktail.dart';
import 'package:test/scaffolding.dart';

class MockAdviceUseCases extends Mock implements AdviceUseCases {}

void main() {
  group('AdvicerCubit', () {
    group('should emits', () {
      MockAdviceUseCases mockAdviceUseCases = MockAdviceUseCases();
      blocTest(
        'nothing when no event is added',
        build: () => AdvicerCubit(adviceUseCases: mockAdviceUseCases),
        expect: () => const <AdvicerCubitState>[],
      );
      blocTest(
        '[AdvicerStateLoading, AdvicerError] when adviceRequested is called',
        setUp: () => when(() => mockAdviceUseCases.getAdvice()).thenAnswer(
            (invocation) => Future.value(const Right<Failure, AdviceEntity>(
                AdviceEntity(advice: 'advice', id: 1)))),
        build: () => AdvicerCubit(adviceUseCases: mockAdviceUseCases),
        act: (cubit) => cubit.adviceRequestedEvent(),
        expect: () => const <AdvicerCubitState>[
          AdvicerStateLoading(),
          AdvicerStateLoaded(advice: 'advice')
        ],
      );

      group(
          '[AdvicerStateLoading, AdvicerError] when adviceRequested() is called',
          () {
        blocTest(
          'and a ServerFailure occures',
          setUp: () => when(() => mockAdviceUseCases.getAdvice()).thenAnswer(
            (invocation) => Future.value(
              Left<Failure, AdviceEntity>(
                ServerFailure(),
              ),
            ),
          ),
          build: () => AdvicerCubit(adviceUseCases: mockAdviceUseCases),
          act: (cubit) => cubit.adviceRequestedEvent(),
          expect: () => const <AdvicerCubitState>[
            AdvicerStateLoading(),
            AdvicerError(message: 'An API error has occured')
          ],
        );

        blocTest(
          'and a Cache Failure occures',
          setUp: () => when(() => mockAdviceUseCases.getAdvice()).thenAnswer(
            (invocation) => Future.value(
              Left<Failure, AdviceEntity>(
                CacheFailure(),
              ),
            ),
          ),
          build: () => AdvicerCubit(adviceUseCases: mockAdviceUseCases),
          act: (cubit) => cubit.adviceRequestedEvent(),
          expect: () => const <AdvicerCubitState>[
            AdvicerStateLoading(),
            AdvicerError(message: cacheFailureMessage)
          ],
        );
        blocTest(
          'and a General Failure occures',
          setUp: () => when(() => mockAdviceUseCases.getAdvice()).thenAnswer(
            (invocation) => Future.value(
              Left<Failure, AdviceEntity>(
                GeneralFailure(),
              ),
            ),
          ),
          build: () => AdvicerCubit(adviceUseCases: mockAdviceUseCases),
          act: (cubit) => cubit.adviceRequestedEvent(),
          expect: () => const <AdvicerCubitState>[
            AdvicerStateLoading(),
            AdvicerError(message: generalFailureMessage)
          ],
        );
      });
    });
  });
}
