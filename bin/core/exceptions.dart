import 'dart:io';

abstract class AuthException implements Exception {}

abstract class ApiException implements Exception {}

class UsrNotFind extends AuthException {}

class UsrAlreadyExist extends AuthException {}

class IncorrectPassword extends AuthException {
  @override
  String toString() {
    return 'Incorrect Password';
  }
}

class UsrNotAuthenticated extends AuthException {}

class GenAuthErr extends AuthException {
  String s;
  GenAuthErr(this.s);
  @override
  String toString() {
    return s;
  }
}

class BodyIsNotJson extends ApiException {
  String s;
  BodyIsNotJson(this.s);
  @override
  String toString() {
    return 'incorrect body type: \n$s\n';
  }
}
