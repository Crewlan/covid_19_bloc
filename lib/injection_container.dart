import 'package:connectivity/connectivity.dart';
import 'package:covid_19_bloc/core/device/network_info.dart';
import 'package:covid_19_bloc/features/home/data/datasources/covid_remote_data_source.dart';
import 'package:covid_19_bloc/features/home/data/repositories/covid_repository.dart';
import 'package:covid_19_bloc/features/home/domain/repositories/i_covid_repository.dart';
import 'package:covid_19_bloc/features/home/domain/usecases/get_covid.dart';
import 'package:covid_19_bloc/features/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  //! Home Feature
  //* Home Data Source
  sl.registerLazySingleton<ICovidRemoteDataSource>(() => CovidRemoteDataSource(sl()));
  //* Home Repositories
  sl.registerLazySingleton<ICovidRepository>(() => CovidRepository(sl()));
  //* Use cases
  sl.registerLazySingleton(() => GetCovid(sl()));

  //* Bloc
  sl.registerLazySingleton(() => HomeBloc(sl()));

  //* CORE
  sl.registerLazySingleton<INetworkInfo>(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => http.Client());

  await sl.allReady();
}
