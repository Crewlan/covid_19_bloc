import 'package:covid_19_bloc/core/navigations/routes.dart';
import 'package:covid_19_bloc/features/home/presentation/bloc/home_bloc.dart';
import 'package:covid_19_bloc/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart';

class AppRouter {
  final _homeBloc = sl<HomeBloc>();

  Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _homeBloc..add(LoadFromEvent()),
            child: HomePage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Erro'),
            ),
          ),
        );
    }
  }
}
