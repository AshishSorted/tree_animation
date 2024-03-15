abstract class ApiResult<T> {
  const ApiResult._();
  const factory ApiResult.success({T data}) = Success<T>;

  const factory ApiResult.failure({required String error, T data}) = Failure<T>;
}

class Success<T> extends ApiResult<T> {
  final T? data;
  const Success({
    this.data,
  }) : super._();
}

class Failure<T> extends ApiResult<T> {
  final String error;
  final T? data;
  const Failure({
    required this.error,
    this.data,
  }) : super._();
}

isResultValid(Map response) {
  if (response['status'] == 200) return true;
  return false;
}
