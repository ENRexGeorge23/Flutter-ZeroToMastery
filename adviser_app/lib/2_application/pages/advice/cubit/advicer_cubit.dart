import 'package:adviser_app/1_domain/failures/failure.dart';
import 'package:adviser_app/1_domain/use_cases/advice_usecases.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'advicer_state.dart';

const generalFailureMessage = 'Opps, An unexpected error has occured';
const serverFailureMessage = 'An API error has occured';
const cacheFailureMessage = 'Something went wrong please try again';

class AdvicerCubit extends Cubit<AdvicerCubitState> {
  final AdviceUseCases adviceUseCases;
  AdvicerCubit({required this.adviceUseCases}) : super(AdvicerInitial());

  void adviceRequestedEvent() async {
    emit(AdvicerStateLoading());
    final failureOrAdvice = await adviceUseCases.getAdvice();
    failureOrAdvice.fold(
        (failure) => emit(AdvicerError(message: _mapFailureToMessage(failure))),
        (advice) => emit(AdvicerStateLoaded(advice: advice.advice)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
