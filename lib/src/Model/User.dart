///This Class store user Data and information!
///If there user is authetificate, read the JSon about his Data
///Si il est pas connecté, dowload les informations de FireBase et créer Un Json.
///Si il vient de se connecter pour la première fois, créer un profil Firebase et un Json

class Profil {

  ///--------------------------user identification----------------------------------
  ///global information
  static String _name;

  static String get name => _name;

  static String _lastName;

  static String get lastName => _lastName;

  static String _email;

  static String get email => _email;

  ///user information personnel
  static int _idVersion;
  static int get idVersion => _idVersion;

  static int _weight;
  static int get weight => (_weight != null) ? _weight : -1;

  static int _height;
  static int get height => (_height != null) ? _height : -1;


  ///--------------------------food information----------------------------------
  ///loved food
  static Set<String> _lovedFood = new Set<String>();
  static Set<String> get lovedFood =>_lovedFood;
  static set lovedFood(Set<String>foodName) {
    _lovedFood.clear();
    _lovedFood.addAll(foodName);}
  static void addLovedFood(String foodName){
    if(_lovedFood != null)
      {
        _lovedFood.add(foodName);
      }
    else{_lovedFood = new Set<String>();
      _lovedFood.add(foodName);}
    }
  static void removeLovedFood(String foodName){_lovedFood.remove(foodName);}
  static void removeAllLovedFood(){_lovedFood = null;}

  ///hated food
  static Set<String> _hatedFood  = new Set<String>();
  static Set<String> get hatedFood => _hatedFood;
  static set hatedFood(Set<String>foodName) {
    _hatedFood.clear();
    _hatedFood.addAll(foodName);}
  static void addHatedFood(String foodName){
    if(_hatedFood != null)
    {
      _hatedFood.add(foodName);
    }
    else{_hatedFood = new Set<String>();
    _hatedFood.add(foodName);}
  }
  static void removeHatedFood(String foodName){_hatedFood.remove(foodName);}
  static void removeAllHatedFood(){_hatedFood = null;}

  ///Allergy food
  static Set<String> _allergyFood = new Set<String>();
  static Set<String> get allergyFood => _allergyFood;
  static set allergyFood(Set<String>foodName) {
    _allergyFood.clear();
    _allergyFood.addAll(foodName);}
  static void addAllergyFood(String foodName){
    if(_allergyFood != null)
  {
    _allergyFood.add(foodName);
  }
  else{_allergyFood = new Set<String>();
  _allergyFood.add(foodName);}}
  static void removeAllergyFood(String foodName){_allergyFood.remove(foodName);}
  static void removeAllAllergyFood(){_allergyFood = null;}

  ///Diet food
  static String diet = "";

  ///foodIntolerance
  static Set<String> _intoleranceFood = new Set<String>();
  static Set<String> get intoleranceFood => _intoleranceFood;
  static set intoleranceFood(Set<String>foodName) {
    _intoleranceFood.clear();
    _intoleranceFood.addAll(foodName);}
  static void addIntoleranceFood(String foodName){if(_intoleranceFood != null)
  {
    _intoleranceFood.add(foodName);
  }
  else{_intoleranceFood = new Set<String>();
  _intoleranceFood.add(foodName);}}
  static void removeIntoleranceFood(String foodName){_intoleranceFood.remove(foodName);}
  static void removeALLIntoleranceFood(){_intoleranceFood = null;}

  ///convert a Set to a map for RealTimeDataBase
  static Map foodToJson(Set<String> listFood){
    var count = 0;
    var map = new Map();
    for(var food in  listFood)
      {
        map[count.toString()] = food;
        count++;
      }
   return map;
  }





  static void createUserFromNothing(String email) => _email = email;

  static void createUserFromDataBase(String email) {
    //requestDataFireBase
    //updateUserInformation
  }

}
