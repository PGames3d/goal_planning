import 'package:dio/dio.dart';

import '../../data/services/locator.dart';
import '../../repository/secured_local_repository.dart';
import '../constants/app_constants.dart';
import '../constants/app_strings.dart';

class AppInterceptors extends QueuedInterceptor {
  AppInterceptors(this.dio);
  final Dio dio;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    logger.i(
        'On Request: Method:${options.method}\nPath:${options.uri.path}?${options.uri.query}\nBody:${options.data}\nTimeout:${options.receiveTimeout}'
    );



    options.headers['Content-Type'] = 'application/json';

    final repository = locator<SecuredLocalRepository>();
    // Fetch both values concurrently
    final results = await Future.wait([
      repository.getString(AppConstants.deviceToken),
    ]);

    final deviceToken = results[0];


    if (deviceToken != null) {
      options.headers["Authorization"] = "Bearer $deviceToken";
    }

    logger.i(options.headers);

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e('On Error: ${err.type}');
    logger.e('On Error: ${err.response?.statusCode ?? err.message}', error: err);
    logger.e('On Error: Response Data: ${err.response?.data}');

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        super.onError(DeadlineExceededException(err.requestOptions), handler);
        break;
      case DioExceptionType.connectionError:
        super.onError(UnauthorizedException(err.requestOptions), handler);
        break;
      case DioExceptionType.unknown:
        super.onError(DataParsingException(err.requestOptions), handler);
        break;
      case DioExceptionType.badCertificate:
      // Optionally handle badCertificate case
        break;
      case DioExceptionType.cancel:
      // Optionally handle cancel case
        break;
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            super.onError(BadRequestException(err.requestOptions, err.response), handler);
            break;
          case 401:
          case 403:
          case 406:
            super.onError(UnauthorizedException(err.requestOptions), handler);
            break;
          case 404:
            super.onError(NotFoundException(err.requestOptions), handler);
            break;
          case 422:
            super.onError(UnProcessableException(err.requestOptions), handler);
            break;
          case 500:
          case 502:
            super.onError(InternalServerErrorException(err.requestOptions), handler);
            break;
        }
        if ((err.message ?? '').contains("XMLHttpRequest error")) {
          super.onError(NoInternetConnectionException(err.requestOptions), handler);
          break;
        }
        break;
      default:
      // Log or handle any unhandled cases if needed.
        break;
    }

    handler.reject(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i('On Response: API: ${response.realUri.path}');
    logger.i('On Response: Status Code: ${response.statusCode}\n${response.data}');
    handler.next(response);
  }
}

// Exception classes remain unchanged
class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    // Logout after access denied
    locator<SecuredLocalRepository>().clearData();
    return AppStrings.accessDenied;
  }
}

class CustomAuthException implements Exception {
  final String message;
  CustomAuthException(this.message);

  @override
  String toString() => message;
}

class BadRequestException extends DioException {
  BadRequestException(RequestOptions r, Response<dynamic>? res)
      : super(requestOptions: r, response: res);

  @override
  String toString() => AppStrings.invalidRequest;
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() => "${AppStrings.unknownErrorOccurred}, ${AppStrings.pleaseTryAgainLater}";
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() => AppStrings.theRequestedInformationCouldNotBeFound;
}

class UnProcessableException extends DioException {
  UnProcessableException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() => "${AppStrings.requestUnProcessable}, ${AppStrings.pleaseTryAgainLater}";
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() => "${AppStrings.noInternetConnectionAvailable}, ${AppStrings.pleaseTryAgainLater}";
}

class DeadlineExceededException extends DioException {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() => "${AppStrings.theConnectionHasTimedOut}, ${AppStrings.pleaseTryAgainLater}";
}

class DataParsingException extends DioException {
  DataParsingException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() => "${AppStrings.somethingWentWrong}, ${AppStrings.pleaseTryAgainLater}";
}
