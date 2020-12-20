import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class CustomButtonTheme{
  //pas comme ca qu'il faut faire mais ca marche
   static redButton() {
    ElevatedButton.styleFrom(
      primary: Colors.redAccent,
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 28),
      textStyle: TextStyle(fontSize: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      side: BorderSide(color: Colors.white, width: 8),
    );
  }
}

class CustomTextTheme{
  static textFont(){
    GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 28,
          color: Colors.white,
          decoration: TextDecoration.none,
          height: 1),
    );
  }
}
