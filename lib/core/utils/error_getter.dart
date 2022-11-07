import 'package:vizmo_demo/core/error/app_error.dart';

/// Utility class to get error string based on  [AppErrorType] & [errorMessage]
class ErrorGetter {
  const ErrorGetter._();

  static String getError(AppErrorType appErrorType, String? errorMessage) {
    if (errorMessage != null) {
      return errorMessage;
    }
    switch (appErrorType) {
      case AppErrorType.api:
        return 'Something went wrong';
      case AppErrorType.network:
        return 'No internet connection';
      case AppErrorType.timeout:
        return 'Request timed out';
      case AppErrorType.database:
        return 'Something went wrong';
    }
  }
}
