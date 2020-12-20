import 'package:flutter_app/Utils/enum.dart';
import 'package:flutter_app/src/Model/Asset.dart';
import 'package:flutter_app/src/Model/User.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class FoodIssueController extends ControllerMVC {
  ///singleton factory
  factory FoodIssueController() {
    if (_this == null) _this = FoodIssueController._();
    return _this;
  }

  FoodIssueController._();

  static FoodIssueController _this;

  static FoodIssueController get con => _this;

  List<String> getListFoodIssue(TypeSelection typeFoodIssue){

    switch(typeFoodIssue) {
      case TypeSelection.ALLERGY: {
        return FoodName.listAllergy;
      }
      break;

      case TypeSelection.INTOLERANCE: {
        return FoodName.listIntolerance;
      }
      break;

      case TypeSelection.DIET: {
        return FoodName.listDiet;
      }
      break;

      default: {
        return new List<String>();
      }
      break;
    }
  }

  Set<String> getSelectedFoodIssue(TypeSelection typeFoodIssue) {
    switch (typeFoodIssue) {
      case TypeSelection.ALLERGY:
        {
          return Profil.allergyFood;
        }
        break;

      case TypeSelection.INTOLERANCE:
        {
          return Profil.intoleranceFood;
        }
        break;

      case TypeSelection.DIET:
        {
          var result  = new Set<String>();
          result.add(Profil.diet);
         return result;
        }
        break;

      default:
        {
          return new Set<String>();
        }
        break;
    }
  }

  //for test control we dont need it
  String plotSelectedFoodIssue(TypeSelection typeFoodIssue){
    Set<String> resultRead;
    switch(typeFoodIssue) {
      case TypeSelection.ALLERGY: {
        resultRead = Profil.allergyFood;
      }
      break;

      case TypeSelection.INTOLERANCE: {
        resultRead = Profil.intoleranceFood;
      }
      break;

      case TypeSelection.DIET: {
        var resultRead  = new Set<String>();
        resultRead.add(Profil.diet);
      }
      break;

      default: {
        resultRead = new Set<String>();
      }
      break;
    }

    String result = "";
      for(String food in resultRead)
      {
        result += food + " ";
      }

    return result;
  }

  void selectAllergy(String selectedFood ) {
      if(Profil.allergyFood != null)
      {
        if(Profil.allergyFood.contains(selectedFood))
        {
          Profil.removeAllergyFood(selectedFood);
        }
        else {Profil.addAllergyFood(selectedFood);}
      }
      else{Profil.addAllergyFood(selectedFood); }
  }

  void selectIntolerance(String selectedFood ) {
    if(Profil.intoleranceFood != null)
    {
      if(Profil.intoleranceFood.contains(selectedFood))
      {
        Profil.removeIntoleranceFood(selectedFood);
      }
      else {Profil.addIntoleranceFood(selectedFood);}
    }
    else{Profil.addIntoleranceFood(selectedFood); }
  }

  void selectDiet(String selectedFood ) {
    Profil.diet = selectedFood;
  }

}