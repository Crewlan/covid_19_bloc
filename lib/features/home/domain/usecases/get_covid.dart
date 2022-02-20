import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/covid_world.dart';
import '../repositories/i_covid_repository.dart';

class GetCovid {
  final ICovidRepository repository;

  GetCovid(this.repository);

  Future<Either<Failures, CovidWorld>> call() async {
    return await repository.getCovidWorld();
  }
}
