///This Class store user Data and information!
///If there user is authetificate, read the JSon about his Data
///Si il est pas connecté, dowload les informations de FireBase et créer Un Json.
///Si il vient de se connecter pour la première fois, créer un profil Firebase et un Json

class User{

  //user identification
  static String _name;
  static String get name => _name;

  static String _lastName;
  static String get lastName => _lastName;

  static String _email;
  static String get email => _email;

  //user information
  static int _weight;
  static int get weight => (_weight != null) ? _weight : -1;


  static void createUserFromNothing( String email)
  {
    _email = email;

  }
}