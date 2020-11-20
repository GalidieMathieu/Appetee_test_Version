import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/src/Logging/Model/User.dart';
import 'package:fluttertoast/fluttertoast.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class LogController extends ControllerMVC {
  ///singleton factory
  factory LogController() {
    if (_this == null) _this = LogController._();
    return _this;
  }

  LogController._();

  static LogController _this;

  static LogController get con => _this;

  static bool _success;

  bool get success => _success;

  String getEmail() => User.email;

  Future register(var password, var email) async {
    String errorMessage;
    var user;
    //AuthException
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      user = result.user;
    } catch (error) {
      switch (error.code) {
        case "ERROR_INVALID_EMAIL":
          errorMessage = "Your email address appears to be malformed.";
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
        case "ERROR_INVALID_PASSWORD":
          errorMessage = "Password is to short";
          break;
        default:
          errorMessage = error.code;
      }
    }

    if (errorMessage != null) {
      return Future.error(errorMessage);
    }

    if (user != null) {
        User.createUserFromNothing(user.email);
        _success = true;
    }
  }
}
