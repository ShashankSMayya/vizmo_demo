import 'package:equatable/equatable.dart';

/// [AppError] is a class that represents an error that can occur in the app and allows us to handle it in a uniform way.
class AppError extends Equatable {
  final AppErrorType errorType;
  final String? error;
  final int? statusCode;

  const AppError(this.errorType, {this.error, this.statusCode});

  @override
  List<Object?> get props => [errorType, error, statusCode];
}

enum AppErrorType {
  api,
  network,
  timeout,
  database,
}
