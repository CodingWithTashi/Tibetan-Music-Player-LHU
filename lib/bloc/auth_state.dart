part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {
  AuthInitial();
}

class AuthLoading extends AuthState {
  AuthLoading();
}

class AuthLoaded extends AuthState {
  final UserCredential credential;
  AuthLoaded(this.credential);
}

class AuthError extends AuthState {
  final String error;
  AuthError(this.error);
}
