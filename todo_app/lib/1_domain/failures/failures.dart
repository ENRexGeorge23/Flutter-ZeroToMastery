import 'package:equatable/equatable.dart';

abstract class Failure {}

class ServerFailure extends Failure with EquatableMixin {
  ServerFailure({required this.stackTrace});
  final String? stackTrace;

  @override
  List<Object?> get props => [stackTrace];
}

class CacheFailure extends Failure with EquatableMixin {
  CacheFailure({required this.stackTrace});
  final String? stackTrace;
  @override
  List<Object?> get props => [];
}

class GeneralFailure extends Failure with EquatableMixin {
  @override
  List<Object?> get props => [];
}
