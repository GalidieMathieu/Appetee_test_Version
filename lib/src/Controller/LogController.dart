import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_app/src/Model/User.dart';
import 'file:///C:/Users/Public/FlutterTest/flutter_app/lib/Utils/ExceptionHandler.dart' show AuthExceptionAppetee;
import 'package:firebase_auth/firebase_auth.dart';

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

  String getEmail() => Profil.email;


  ///register an user with password and email
  Future<bool> register(var password, var email) async {
    String errorMessage;
    var user;
      //connection toFireBase
      try {
        var result = await _firebaseAuth.createUserWithEmailAndPassword(
            email: email.text, password: password.text);
        user = result.user;
      } catch (error) {
        errorMessage = AuthExceptionAppetee.showError(error.code);
      }

      if (errorMessage != null) {
        Future.error(errorMessage);
      }

      //creating Profil!
      if (user != null) {
        Profil.createUserFromNothing(user.email);
        return true;
      }
    return false;
  }

  ///Login an user with email and password
  Future<bool> signIn(var password, var email) async {
    String errorMessage;
    var user;
    try {
      var result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      user = result.user;
    } catch (error) {errorMessage = AuthExceptionAppetee.showError(error.code);}

    if (errorMessage != null)
    {
      Future.error(errorMessage);

    }

    if (user != null) {
      Profil.createUserFromDataBase(user.email);
      return true;
    }
    return false;
  }

}
