import 'package:equatable/equatable.dart';

import '../../domain/entities/covid_world.dart';

class CovidWorldModel extends Equatable {
  final int? cases;
  final int? todayCases;
  final int? deaths;
  final int? recovered;
  final int? critical;
  final int? tests;

  CovidWorldModel({this.cases, this.todayCases, this.deaths, this.recovered, this.critical, this.tests});

  @override
  List<Object?> get props {
    return [cases, todayCases, deaths, recovered, critical, tests];
  }

  factory CovidWorldModel.fromJson(Map<String, dynamic> json) => CovidWorldModel(
        cases: json['cases'],
        todayCases: json['todayCases'],
        deaths: json['deaths'],
        recovered: json['recovered'],
        critical: json['critical'],
        tests: json['tests'],
      );

  factory CovidWorldModel.fromEntity(CovidWorld entity) => CovidWorldModel(
        cases: entity.cases,
        todayCases: entity.todayCases,
        deaths: entity.deaths,
        recovered: entity.recovered,
        critical: entity.critical,
        tests: entity.tests,
      );

  CovidWorld toEntity() => CovidWorld(
        cases: cases,
        todayCases: todayCases,
        deaths: deaths,
        recovered: recovered,
        critical: critical,
        tests: tests,
      );
}
