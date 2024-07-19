import 'package:social_media_feed/core/network/error_message_model.dart';


class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({
    required this.errorMessageModel,
  });
}

class LocalDatabaseException implements Exception {
  final String message;

  const LocalDatabaseException({
    required this.message,
  });
}


class BadCertificateException extends ServerException {
  BadCertificateException({required super.errorMessageModel});

}

class BadResponseException extends ServerException {
  BadResponseException({required super.errorMessageModel});

}

class ConnectionTimeoutException extends ServerException {
  ConnectionTimeoutException({required super.errorMessageModel});

}

class FetchDataException extends ServerException {
  FetchDataException({required super.errorMessageModel});

}

class BadRequestException extends ServerException {
  BadRequestException({required super.errorMessageModel});

}

class UnauthorizedException extends ServerException {
  UnauthorizedException({required super.errorMessageModel});

}
class ForbiddenException extends ServerException {
  ForbiddenException({required super.errorMessageModel});

}

class NotFoundException extends ServerException {
  NotFoundException({required super.errorMessageModel});

}

class ConflictException extends ServerException {
  ConflictException({required super.errorMessageModel});

}
class CancelException extends ServerException {
  CancelException({required super.errorMessageModel});

}
