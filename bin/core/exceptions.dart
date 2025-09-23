abstract class AuthException implements Exception {}

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
