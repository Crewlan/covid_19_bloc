import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/covid_world.dart';

abstract class ICovidRepository {
  Future<Either<Failures, CovidWorld>> getCovidWorld();
}
