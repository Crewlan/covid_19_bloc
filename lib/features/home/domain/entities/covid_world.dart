import 'package:equatable/equatable.dart';

class CovidWorld extends Equatable {
  final int? cases;
  final int? todayCases;
  final int? deaths;
  final int? recovered;
  final int? critical;
  final int? tests;

  CovidWorld({this.cases, this.todayCases, this.deaths, this.recovered, this.critical, this.tests});

  @override
  List<Object?> get props {
    return [cases, todayCases, deaths, recovered, critical, tests];
  }
}
