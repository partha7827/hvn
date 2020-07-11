class LoginException implements Exception {
  final String error;

  LoginException(this.error);

  @override
  String toString() {
    return error;
  }
}
