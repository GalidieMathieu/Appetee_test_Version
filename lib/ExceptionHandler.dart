///librairie de toutes les exceptions
///

class AuthExceptionAppetee {

  //return the token String in the i18n file
  //TODO when time update this files for full error
  static String showError(String errorCode) {
    switch (errorCode) {

      case "ERROR_EMAIL_ALREADY_EXISTS":
      ///he provided email is already in use by an existing user. Each user must have a unique email.
        return "EMAIL_ALREADY_EXISTS";
        break;

      case "ERROR_INVALID_EMAIL":
        ///The provided value for the email user property is invalid. It must be a string email address.
        return "INVALID_EMAIL";
        break;

      case "ERROR_INVALID_PASSWORD":
        return "INVALID_PASSWORD";
        break;

      case "ERROR_TOO_MANY_REQUESTS":
        ///to many request by the same user
        return "TOO_MANY_REQUESTS";
        break;

      default:
        return errorCode;
    }
  }
}
