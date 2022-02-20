import 'package:freezed_annotation/freezed_annotation.dart';

part 'exception.freezed.dart';

@freezed
class CustomException with _$CustomException implements Exception{
  const factory CustomException.networkException() = NetworkException;
  const factory CustomException.serverException() = ServerException;
}