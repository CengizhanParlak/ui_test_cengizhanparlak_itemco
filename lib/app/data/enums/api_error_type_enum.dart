enum ApiErrorType {
  unauthorized('Unauthorized Operation'),
  notFound('Not Found'),
  tooManyRequests('Too Many Requests'),
  unknown('Unknown Error');

  const ApiErrorType([this.message = '']);

  final String message;
}
