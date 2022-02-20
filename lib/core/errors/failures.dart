import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failures with _$Failures {
  const factory Failures.networkFailure() = NetworkFailure;
  const factory Failures.serverFailure() = ServerFailure;
}