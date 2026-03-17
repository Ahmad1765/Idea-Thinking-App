import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection']);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Something went wrong. Try again.']);
}

class AuthFailure extends Failure {
  const AuthFailure([super.message = 'Invalid credentials']);
}

class ValidationFailure extends Failure {
  final String field;
  const ValidationFailure(super.message, {required this.field});

  @override
  List<Object> get props => [message, field];
}

class LockFailure extends Failure {
  const LockFailure(
      [super.message =
          'Focus lock failed to start. Please check Accessibility permissions.']);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'This item no longer exists.']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Local data error.']);
}
