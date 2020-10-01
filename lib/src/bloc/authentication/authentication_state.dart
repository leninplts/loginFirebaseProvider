part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}
//  Tres Estados
//  No iniciado -> splas screen
//  Autenticado -> HomePage
//  No autenticado -> LoginPage

class UnInitialized extends AuthenticationState {
  @override
  String toString() => 'No inicializado';
}

class Authenticated extends AuthenticationState {
  final String displayName;
  const Authenticated(this.displayName);

  @override
  List<Object> get props => [displayName];

  @override
  String toString() => 'Autenticado - como: $displayName';
}

class UnAuthenticated extends AuthenticationState {
  @override
  String toString() => 'No Autenticado';
}
