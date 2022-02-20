import 'package:covid_19_bloc/features/home/presentation/bloc/home_bloc.dart';
import 'package:covid_19_bloc/features/home/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => _body(state),
    );
  }

  Widget _body(HomeState state) {
    switch (state.status) {
      case HomeStatus.ready:
        return Container(
          child: Text(state.covidWorld?.deaths.toString() ?? ''),
        );
      case HomeStatus.error:
        return Center(
          child: Text(state.message ?? ''),
        );
      default: //loading
        return Center(
          child: Text('Carregando!'),
        );
    }
  }
}
