sealed class Result<T>{}

class Success<T> extends Result<T>{
  T data; // because data can be list of sources or articles
  Success({required this.data});
}

class ServerError<T> extends Result<T>{
  String message;
  String code;

  ServerError({required this.code, required this.message});
}

class GeneralEx<T> extends Result<T>{
  Exception exception;

  GeneralEx({required this.exception});
}
