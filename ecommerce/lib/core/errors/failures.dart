import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String _message;

  const Failure(this._message);

  String get message => _message;

  @override
  List<Object?> get props => [_message];
}

class Http400BadRequestFailure extends Failure {
  const Http400BadRequestFailure(super.message);

  @override
  List<Object?> get props => [message];
}

class Http404NotFoundFailure extends Failure {
  const Http404NotFoundFailure(super.message);

  @override
  List<Object?> get props => [message];
}

class FormatFailure extends Failure {
  const FormatFailure(super.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  @override
  List<Object?> get props => [message];
}
