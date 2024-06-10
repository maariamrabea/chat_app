import 'package:flutter/cupertino.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFalier extends AuthState {
  String errMassege;

  LoginFalier({required this.errMassege});
}

//class RegisterInitial extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterFalier extends AuthState {
  String errMassege;

  RegisterFalier({required this.errMassege});
}
