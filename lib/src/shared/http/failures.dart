import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure implements Exception, EquatableMixin {
  String get message;

  @override
  List<Object?> get props => <Object?>[message];
}

class ExceptionFailure extends Failure {
  factory ExceptionFailure.decode(Exception? error) {
    return ExceptionFailure._(
      error: error,
      message: error.toString(),
    );
  }
  ExceptionFailure._({
    required this.message,
    this.error,
  });
  final Exception? error;
  @override
  final String message;

  @override
  bool? get stringify => throw UnimplementedError();
}

class DioFailure extends Failure {
  factory DioFailure.decode(
    DioException? error,
  ) {
    return DioFailure._(
      error: error,
      statusCode: error?.response?.statusCode,
      message: error?.response?.statusMessage ?? '',
    );
  }
  DioFailure._({
    required this.message,
    this.statusCode,
    this.error,
  });
  final int? statusCode;
  final DioException? error;
  @override
  final String message;
  
  @override
  bool? get stringify => true;
}

class ErrorFailure extends Failure {
  factory ErrorFailure.decode(
    Error? error,
  ) {
    return ErrorFailure._(
      error: error,
      message: error.toString(),
    );
  }
  ErrorFailure._({
    required this.message,
    this.error,
  });
  final Error? error;
  @override
  final String message;

  @override
  bool? get stringify => true;
}
