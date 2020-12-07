import 'package:mvc_pattern/mvc_pattern.dart';

class HomeScreenController extends ControllerMVC {
  ///singleton factory
  factory HomeScreenController() {
    if (_this == null) _this = HomeScreenController._();
    return _this;
  }

  HomeScreenController._();

  static HomeScreenController _this;

  static HomeScreenController get con => _this;

}