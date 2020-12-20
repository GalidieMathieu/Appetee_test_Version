//ce package contient toutes les data interne à l'app


class FoodName{

  //items pour l'affichage
  static var _imagesAllergy = [
    'asset/foodImages/400.jpg',
    'asset/foodImages/400.jpg',
    'asset/foodImages/400.jpg',
    'asset/foodImages/400.jpg',
    'asset/foodImages/400.jpg',
    'asset/foodImages/400.jpg',
    'asset/foodImages/400.jpg',
    'asset/foodImages/400.jpg',
    'asset/foodImages/400.jpg',
    'asset/foodImages/400.jpg',
    'asset/foodImages/400.jpg',
    'asset/foodImages/400.jpg',
    'asset/foodImages/400.jpg',
    'asset/foodImages/400.jpg',
    'asset/foodImages/400.jpg',
  ];
  static List<String> get imagesAllergy => _imagesAllergy;

  //items pour la récupérations de donnée
  static var _listHated = [
    'moules',
    'saumon',
    'patate',
    'carottes',
    'tomates',
    'jambon',
    'chèvre',
    'riz',
    'fillet migion',
    'radis',
    'porc',
    'poulet',
    'aubergine',
    'cabillaud',
    'mangue'
  ];
  static List<String> get listHated => _listHated;

  static var _listDiet = [
    'Végétarisme',
    'Pesco-végétarisme',
    'Flexitarisme',
    'Véganisme',
    'Carnivore',
    'Cétogène',
  ];
  static List<String> get listDiet => _listDiet;

  static var _listAllergy = [
    'arachides',
    'blé',
    'Les graines de sésame',
    'lait',
    'noix',
    'œufs',
    'soja',
    'sulfites',
    'moutarde',
    'arachides',
    'blé',
    'Les graines de sésame',
    'lait',
    'noix',
    'œufs',
    'soja',
    'sulfites',
    'moutarde',
    'arachides',
    'blé',
    'Les graines de sésame',
    'lait',
    'noix',
    'œufs',
    'soja',
    'sulfites',
    'moutarde',
    'arachides',
    'blé',
    'Les graines de sésame',
    'lait',
    'noix',
    'œufs',
    'soja',
    'sulfites',
    'moutarde'
  ];
  static List<String> get listAllergy => _listAllergy;

  static var _listIntolerance= [
    'gluten',
    'blé',
    'Les graines de sésame',
    'lait',
    'noix',
    'œufs',
    'soja',
    'sulfites',
    'moutarde'
  ];
  static List<String> get listIntolerance => _listIntolerance;
}