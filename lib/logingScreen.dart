import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/allergieChoix.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/background/home_screen.jpg"), fit: BoxFit.cover)),
        child: _buildBody(context),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            margin:
                const EdgeInsets.only(top: 48, left: 48, right: 48, bottom: 48),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset("asset/test.png"),
                  const SizedBox(height: 48.0),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Un plat selon \n vos envies',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 28,
                            color: Colors.redAccent,
                            decoration: TextDecoration.none,
                            height: 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 72),

                  //button
                  ElevatedButton(
                    child: Text(
                      'Commencer',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            height: 1),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 28),
                      textStyle: TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      side: BorderSide(color: Colors.white, width: 8),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp2()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/home_screen.jpg"), fit: BoxFit.cover)),
        child: Center(
          child: Text(
            "un plat selon \n vos envies",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
