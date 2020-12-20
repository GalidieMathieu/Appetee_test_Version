import 'package:flutter/material.dart';
import 'package:flutter_app/src/Controller/ProfilCreationController.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter_app/Utils/Style.dart';


class HatedFood extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HatedFoodState();
}

class _HatedFoodState extends StateMVC {
  _HatedFoodState() : super(ProfilCreationController()) {
    _con = ProfilCreationController.con;
  }

  ProfilCreationController _con;
  final myTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myTextController.addListener(_searchHatedFood);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Column(
      children: <Widget>[
        const SizedBox(height: 72),
        TextFormField(
          controller: myTextController,
          decoration: InputDecoration(
              labelText: 'looking for aliment'
          ),
        ),
        SizedBox(
            height: 200.0,
            child: Scrollbar(
                child: ListView(
                    padding: const EdgeInsets.all(10),
                    children: _listWidget()))),
        const SizedBox(height: 72),
        new Text(_con.afficherHatedFood()),
        const SizedBox(height: 72),
        ElevatedButton(
            child: Text(
              'finish',
              style: CustomTextTheme.textFont(),
            ),
            style: CustomButtonTheme.redButton(),
            onPressed: () => _nextPageController()),
      ],
    );
  }

  List<Widget> _listWidget() {
    final List<Widget> listHatedFood = <Widget>[];
    List<String> _listHatedFood = _con.listHatedFoodSearched();
    for (int i = 0; i < _listHatedFood.length; ++i) {
      listHatedFood.add(new Container(
          child: new InkResponse(
            enableFeedback: true,
            child: new Text(_listHatedFood[i],
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                      height: 1),
                )),
            onTap: () => _onlistFoodIssueClicked(_listHatedFood[i]),
          )));
    }
    return listHatedFood;
  }

  _onlistFoodIssueClicked(String foodSelected){
    _con.selectHatedFood(foodSelected);
  }
  _searchHatedFood(){
    _con.updateSearch(myTextController.text);
  }
  _nextPageController() async {
    _con.creationProfil().then((isCreated) {
      if(isCreated)
        {
        }
    }).catchError((message) {
      AlertDialog(

        content: Text(message.toString()),
      );
    });
  }
}

