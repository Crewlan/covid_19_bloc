import 'package:equatable/equatable.dart';

import 'package:covid_19_bloc/features/home/domain/entities/covid_world.dart';

enum HomeStatus {
  loading,
  ready,
  error,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final CovidWorld? covidWorld;
  final String? message;

  HomeState._(this.status, this.covidWorld, this.message);

  HomeState.initial() : this._(HomeStatus.loading, null, null);

  HomeState loading() {
    return HomeState._(HomeStatus.loading, covidWorld, message);
  }

  HomeState ready(CovidWorld covid) {
    return HomeState._(HomeStatus.ready, covid, message);
  }

  HomeState error(String msgError) {
    return HomeState._(HomeStatus.error, covidWorld, msgError);
  }

  @override
  List<Object?> get props => [status, covidWorld, message];
}
