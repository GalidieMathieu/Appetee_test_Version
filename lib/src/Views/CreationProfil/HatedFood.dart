import 'package:flutter/material.dart';
import 'package:flutter_app/src/Controller/ProfilCreationController.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_app/Utils/Style.dart';



class HatedFood extends StatefulWidget {
  /*final TypeSelection foodSelected;
  ProfilCreation({this.foodSelected});*/
  @override
  State<StatefulWidget> createState() => _HatedFoodState();
}

class _HatedFoodState extends StateMVC {
  _HatedFoodState() : super(ProfilCreationController()) {
    _con = ProfilCreationController.con;
  }

  ProfilCreationController _con;
  var images;

  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  final _boxHeight = 500.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  //body
  _buildBody() {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            _buildPageView(),
            _buildCircleIndicator(),
          ],
        ),
        new Text(_con.afficherLovedFood()),
      ],
    );
  }

  //item we scroll
  _buildPageView() {
    return Container(
      //color: Colors.black87,
      height: _boxHeight,
      child: PageView.builder(
          itemCount: (_con.getNomsAllergy().length % 4 == 0)
              ? _con.getNomsAllergy().length ~/ 4
              : (_con.getNomsAllergy().length ~/ 4) + 1,
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            return Center(
                child: new GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    padding: const EdgeInsets.all(1.0),
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    children: _getImages(_con.getImagesAllergy(), _con.getNomsAllergy(), index))
                );
          },
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
          }),
    );
  }

  //bubble in the bottom
  _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          itemCount: (_con.getNomsAllergy().length % 4 == 0)
              ? _con.getNomsAllergy().length ~/ 4
              : (_con.getNomsAllergy().length ~/ 4) + 1,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }

  //Creation d'une images et de chaque click sur chaque image
  void _onTileClicked(String selectedFood) {
    _con.selectHatedFood(selectedFood);
    _con.creationProfil();
    //Colors = (colors.color == color.white)? color.red : color.white;
  }

  // Get grid Images
  List<Widget> _getImages(List<String> imagesList, List<String> nomImages, int page) {
    final List<Widget> tiles = <Widget>[];
    for (int i = 0; i < 4 /*imagesList.length*/; i++) {
      if ((page * 4 + i) < imagesList.length) {
        tiles.add(new GridTile(
            child: Center(
                child: Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
              new InkResponse(
                enableFeedback: true,
                child: new Image.asset(imagesList[page * 4 + i],
                    width: 250, height: 150),
                onTap: () =>
                    _onTileClicked(nomImages[page * 4 + i] /*, colors*/),
              ),
              new Text(nomImages[page * 4 + i])
            ]))));
      }
    }
    return tiles;
  }
}
