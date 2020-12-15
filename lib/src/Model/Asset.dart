//ce package contient toutes les data interne à l'app


class Image{

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
  static var _nomsAllergy = [
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
    'mangue',
  ];
  static List<String> get nomsAllergy => _nomsAllergy;

}