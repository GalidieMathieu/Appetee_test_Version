///This Class store user Data and information!
///If there user is authetificate, read the JSon about his Data
///Si il est pas connecté, dowload les informations de FireBase et créer Un Json.
///Si il vient de se connecter pour la première fois, créer un profil Firebase et un Json

class Profil {
  //user identification

  static String _name;

  static String get name => _name;

  static String _lastName;

  static String get lastName => _lastName;

  static String _email;

  static String get email => _email;

  //user information personnel
  static int _idVersion;
  static int get idVersion => _idVersion;

  static int _weight;
  static int get weight => (_weight != null) ? _weight : -1;

  static int _height;
  static int get height => (_height != null) ? _height : -1;


  //food information :

  //loved food
  static List<String> _lovedFood;
  static List<String> get lovedFood =>_lovedFood;
  static set lovedFood(List<String>foodName) { _lovedFood.addAll(foodName);}
  static void addLovedFood(String foodName){_lovedFood.add(foodName);}
  static void removeLovedFood(String foodName){_lovedFood.remove(foodName);}
  static void removeAllLovedFood(){_lovedFood = null;}

  //hated food
  static List<String> _hatedFood;
  static List<String> get hatedFood => _hatedFood;
  static set hatedFood(List<String>foodName) { _hatedFood.addAll(foodName);}
  static void addHatedFood(String foodName){_hatedFood.add(foodName);}
  static void removeHatedFood(String foodName){_hatedFood.remove(foodName);}
  static void removeAllHatedFood(){_hatedFood = null;}

  //Allergy food
  static List<String> _allergyFood;
  static List<String> get allergyFood => _allergyFood;
  static set allergyFood(List<String>foodName) { allergyFood.addAll(foodName);}
  static void addAllergyFood(String foodName){allergyFood.add(foodName);}
  static void removeAllergyFood(String foodName){allergyFood.remove(foodName);}
  static void removeAllAllergyFood(){allergyFood = null;}





  static void createUserFromNothing(String email) => _email = email;

  static void createUserFromDataBase(String email) {
    //requestDataFireBase
    //updateUserInformation
  }
}
