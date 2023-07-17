import 'package:equatable/equatable.dart';
import 'package:ui_test_cengizhanparlak/app/data/enums/api_error_type_enum.dart';

class ApiError extends Equatable {
  const ApiError({required this.errorType, this.code});

  final ApiErrorType errorType;
  final int? code;

  @override
  List<Object?> get props => [errorType, code];
}

const unauthorizedError = ApiError(
  errorType: ApiErrorType.unauthorized,
  code: 401,
);
const tooManyRequestsError = ApiError(
  errorType: ApiErrorType.tooManyRequests,
  code: 429,
);
const notFoundError = ApiError(errorType: ApiErrorType.notFound, code: 404);
const unknownError = ApiError(errorType: ApiErrorType.unknown);
