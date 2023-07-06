class Http400BadRequestException implements Exception {
  final String _message;

  const Http400BadRequestException(this._message);

  String get message => _message;
}

class Http404NotFoundException implements Exception {
  final String _message;

  const Http404NotFoundException(this._message);

  String get message => _message;
}

class ServerException implements Exception {
  final String _message;

  const ServerException(this._message);

  String get message => _message;
}
