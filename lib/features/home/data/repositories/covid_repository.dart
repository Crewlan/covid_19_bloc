import 'package:covid_19_bloc/core/errors/exception.dart';
import 'package:covid_19_bloc/features/home/data/datasources/covid_remote_data_source.dart';
import 'package:dartz/dartz.dart';

import 'package:covid_19_bloc/features/home/domain/entities/covid_world.dart';

import 'package:covid_19_bloc/core/errors/failures.dart';

import '../../domain/repositories/i_covid_repository.dart';

class CovidRepository extends ICovidRepository {
  final ICovidRemoteDataSource remoteDataSource;

  CovidRepository(this.remoteDataSource);

  @override
  Future<Either<Failures, CovidWorld>> getCovidWorld() async {
    try {
      final respose = await remoteDataSource.getCovidWorld();
      return Right(respose.toEntity());
    } on NetworkException {
      return Left(NetworkFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
