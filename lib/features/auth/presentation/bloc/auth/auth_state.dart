part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class RegistrationSuccess extends AuthState {
  final UserEntity userEntity;

  Map<String, dynamic> toJson(){
    return {'userEntity': userEntity};
  }

  RegistrationSuccess({required this.userEntity});
}

class RegistrationFailure extends AuthState {
  final String message;

  RegistrationFailure({required this.message});
}

class LoginSuccess extends AuthState {}

class LoginFailure extends AuthState {
  final String message;

  LoginFailure({required this.message});
}