import 'package:flutter/material.dart';
import 'package:flutter_app/Utils/Style.dart';
import 'package:flutter_app/Utils/enum.dart';
import 'package:flutter_app/src/Controller/FoodIssueController.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'HatedFood.dart';

class FoodIssue extends StatefulWidget {
  final TypeSelection foodSelected;

  FoodIssue({this.foodSelected});

  @override
  State<StatefulWidget> createState() => _FoodIssue(foodSelected);
}

class _FoodIssue extends StateMVC {
  _FoodIssue(TypeSelection foodSelected) : super(FoodIssueController()) {
    _con = FoodIssueController.con;
    _typeFoodIssue = foodSelected;
    _listFoodIssue = _con.getListFoodIssue(_typeFoodIssue);
  }

  TypeSelection _typeFoodIssue;
  List<String> _listFoodIssue;
  FoodIssueController _con;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody() {
    {
      return Column(
        children: <Widget>[
          const SizedBox(height: 72),
          SizedBox(
              height: 200.0,
              child: Scrollbar(
                  child: ListView(
                      padding: const EdgeInsets.all(10),
                      children: _listWidget()))),
          const SizedBox(height: 72),
          ElevatedButton(
              child: Text(
                'Suivant',
                style: CustomTextTheme.textFont(),
              ),
              style: CustomButtonTheme.redButton(),
              onPressed: () => _nextPageController()),
        ],
      );
    }
  }

  //controller de la navigation entre chaque widget
  _nextPageController() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        switch (_typeFoodIssue) {
          case TypeSelection.DIET:
            {
              return FoodIssue(foodSelected: TypeSelection.ALLERGY);
            }
            break;

          case TypeSelection.ALLERGY:
            {
              return FoodIssue(foodSelected: TypeSelection.INTOLERANCE);
            }
            break;

          case TypeSelection.INTOLERANCE:
            {
              return HatedFood();
            }
            break;

          default:
            {
              return HatedFood();
            }
            break;
        }
      }),
    );
  }

  //
  List<Widget> _listWidget() {
    final List<Widget> listFoodIssue = <Widget>[];
    for (int i = 0; i < _listFoodIssue.length; ++i) {
      listFoodIssue.add(new Container(
          color: (_con
                  .getSelectedFoodIssue(_typeFoodIssue)
                  .contains(_listFoodIssue[i]))
              ? Colors.blue
              : Colors.white,
          child: new InkResponse(
            enableFeedback: true,
            child: new Text(_listFoodIssue[i],
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      height: 1),
                )),
            onTap: () => _onlistFoodIssueClicked(_listFoodIssue[i]),
          )));
    }
    return listFoodIssue;
  }

  _onlistFoodIssueClicked(String foodSelected) {
    setState(() {
      switch (_typeFoodIssue) {
        case TypeSelection.ALLERGY:
          {
            _con.selectAllergy(foodSelected);
          }
          break;

        case TypeSelection.INTOLERANCE:
          {
            _con.selectIntolerance(foodSelected);
          }
          break;

        case TypeSelection.DIET:
          {
            _con.selectDiet(foodSelected);
          }
          break;

        default:
          {}
          break;
      }
    });
  }
}
