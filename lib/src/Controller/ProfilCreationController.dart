import 'package:flutter_app/src/Model/User.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_app/src/Model/Asset.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

final DatabaseReference _dbRef = FirebaseDatabase.instance.reference().child("Users");
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class ProfilCreationController extends ControllerMVC {
  ///singleton factorytance.referenc
  factory ProfilCreationController() {
    if (_this == null) _this = ProfilCreationController._();
    return _this;
  }

  ProfilCreationController._();

  static ProfilCreationController _this;

  static ProfilCreationController get con => _this;

  static List<String> _hatedFood = FoodName.listHated;

  static  List<String> get hatedFood =>_hatedFood;


  List<String> getImagesAllergy() => FoodName.imagesAllergy;
  List<String> getNomsAllergy() => FoodName.listHated;

  String _wordSearched = "";
  void updateSearch(String wordSearched){
    setState(() {
      _wordSearched = wordSearched;
    });
  }

  List<String> listHatedFoodSearched(){
    if(_wordSearched != "")
      {
        return FoodName.listHated.where((f) => f.startsWith(_wordSearched)).toList();
      }
    else
      {
      return FoodName.listHated;
      }
  }
  ///Permet de modifier les items selectionés concernant les choix alimentaires

  //Modifie la selection des aliments aimés
  void selectHatedFood(String selectedFood ) {
    setState(() {
      if(Profil.hatedFood != null)
        {
          if(Profil.hatedFood.contains(selectedFood))
          {
            Profil.removeHatedFood(selectedFood);
          }
          else {Profil.addHatedFood(selectedFood);}
        }
      else{Profil.addHatedFood(selectedFood); }
    });
  }

  String afficherHatedFood() {
    String result = "";
    if(Profil.hatedFood!=null)
      {
        for(String food in Profil.hatedFood)
          {
            result += food + " ";
          }
      }
    return result;
  }

  //Finalisation de la creation d'un profil ajout de la dataBase
  Future<bool> creationProfil() async {
    String errorMessage;
    if(_firebaseAuth.currentUser != null)
      {
        DatabaseReference user = _dbRef.child(_firebaseAuth.currentUser.uid).child("foodInformation");
        try {
          await user.child("hatedFood").set(Profil.foodToJson(Profil.hatedFood));
          await user.update({'diet': Profil.diet});
          await user.child("allergy").set(Profil.foodToJson(Profil.allergyFood));
          await user.child("foodIntolerance").set(Profil.foodToJson(Profil.intoleranceFood));
        } catch (error) {errorMessage = error.code;}

        if (errorMessage != null)
        {
          Future.error(errorMessage);
          return false;
        }
      }else{
      Future.error("NoUser");
      return false;
    }
    return true;
  }

}