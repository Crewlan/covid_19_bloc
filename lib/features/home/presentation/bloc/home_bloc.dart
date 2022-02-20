import 'package:bloc/bloc.dart';
import 'package:covid_19_bloc/core/errors/failures.dart';
import 'package:covid_19_bloc/core/utils/app_strings.dart';
import 'package:covid_19_bloc/features/home/domain/usecases/get_covid.dart';

import 'home_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCovid getCovid;

  HomeBloc(this.getCovid) : super(HomeState.initial()) {
    on<LoadFromEvent>((event, emit) async {
      emit(state.loading());
      var fold = await getCovid();
      emit(fold.fold(
        (failure) => state.error(_mapCovidFailureToString(failure)),
        (covid) => state.ready(covid),
      ));
    });
  }

  String _mapCovidFailureToString(Failures failures) {
    return failures.maybeWhen(
      serverFailure: () => AppStrings.covidServerFailure,
      networkFailure: () => AppStrings.covidNetworkFailure,
      orElse: () => AppStrings.covidError,
    );
  }
}
