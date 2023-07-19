// ! this file is used to register all the dependencies of the app

import 'package:adviser_app/0_data/datasources/advice_remote_datasource.dart';
import 'package:adviser_app/0_data/repositories/advice_repo_impl.dart';
import 'package:adviser_app/1_domain/repositories/advice_repo.dart';
import 'package:adviser_app/1_domain/use_cases/advice_usecases.dart';
import 'package:adviser_app/2_application/pages/advice/cubit/advicer_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I; // sl == service locator

Future<void> init() async {
  // ! application layer
  // Factory = everytime a new/fresh instance is needed of that class

  sl.registerFactory(() => AdvicerCubit(adviceUseCases: sl()));

  // ! domain layer
  sl.registerFactory(() => AdviceUseCases(adviceRepo: sl()));

  // ! data layer
  sl.registerFactory<AdviceRepo>(
      () => AdviceRepoImpl(adviceRemoteDataSource: sl()));
  sl.registerFactory<AdviceRemoteDataSource>(
      () => AdviceRemoteDataSourceImpl(client: sl()));

  // ! external
  sl.registerFactory(() => http.Client());
}
