part of 'auth_bloc.dart';

abstract class AuthEvent {}

class RegisterUserEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;

  RegisterUserEvent({
    required this.email,
    required this.password,
    required this.name,
  });
}

class LoginUserEvent extends AuthEvent {
  final String email;
  final String password;

  LoginUserEvent({
    required this.email,
    required this.password,
  });
}

class RedirectToHomeEvent extends AuthEvent {}