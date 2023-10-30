class AuthExceptionHandler {
  static String handleException(dynamic error) {
    String errorMessage;
    switch (error.code) {
      case "INVALID_LOGIN_CREDENTIALS":
        errorMessage = "INVALID LOGIN CREDENTIALS";
        break;
      case "ERROR_USER_DISABLED":
        errorMessage = "User with this email has been disabled.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        errorMessage = "Too many requests. Try again later.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      default:
        errorMessage = "An undefined Error happened.";
    }
    return errorMessage;
  }
}
