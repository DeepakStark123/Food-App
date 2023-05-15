// ignore_for_file: prefer_typing_uninitialized_variables

class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message,this._prefix]);

  @override
  String toString() {
    return '$_message $_prefix';
  }
}

class FetchDataException extends AppException{
  FetchDataException([String? message]) : super(message,'Error during the communication');
}

class BadRequestException extends AppException{
  BadRequestException([String? message]) : super(message,'Invalid Request');
}

class UnAuthoriseException extends AppException{
  UnAuthoriseException([String? message]) : super(message,'UnAuthorize Request');
}

class InvalidInputException extends AppException{
  InvalidInputException([String? message]) : super(message,'Invalid Input');
}

class ServerException extends AppException{
  ServerException([String? message]) : super(message,'Server Error');
}