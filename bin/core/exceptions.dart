abstract class AuthException implements Exception {}

class UsrNotFind extends AuthException {}

class IncorrectPassword extends AuthException {}

class UsrNotAuthenticated extends AuthException {}

class GenAuthErr extends AuthException {}
