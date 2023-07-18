// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    on<AdvicerEvent>((event, emit) async {
      emit(AdvicerStateLoading());
      debugPrint('fake get adivce triggered');
      await Future.delayed(const Duration(seconds: 2), () {});
      debugPrint('got advice');
      emit(AdvicerStateLoaded(
          advice: 'Memento Mori - Remember that you will die!'));
      // emit(AdvicerError(message: 'Opps something is wrong here') );
    });
  }
}
