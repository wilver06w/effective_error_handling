import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:effective_error_handling/generated/l10n.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String get message;

  @override
  List<Object?> get props => <Object?>[message];
}

class ExceptionFailure extends Failure {
  final Exception? error;
  @override
  final String message;
  ExceptionFailure._({
    required this.message,
    this.error,
  });
  factory ExceptionFailure.decode(Exception? error) {
    log(error.toString(), name: 'FAILURE[EXCEPTION]');
    return ExceptionFailure._(
      error: error,
      message: error.toString(),
    );
  }
}

class DioFailure extends Failure {
  final int? statusCode;
  final DioException? error;
  @override
  final String message;
  DioFailure._({
    required this.message,
    this.statusCode,
    this.error,
  });
  factory DioFailure.decode(
    DioException? error,
  ) {
    return DioFailure._(
      error: error,
      statusCode: error?.response?.statusCode,
      message: error?.response?.statusMessage ?? '',
    );
  }
}

class ErrorFailure extends Failure {
  final Error? error;
  @override
  final String message;
  ErrorFailure._({
    required this.message,
    this.error,
  });
  factory ErrorFailure.decode(
    Error? error,
  ) {
    log(error.toString(), name: 'FAILURE[ERROR]');
    log((error?.stackTrace).toString(), name: 'FAILURE[ERROR][TRACE]');
    return ErrorFailure._(
      error: error,
      message: error.toString(),
    );
  }
}
