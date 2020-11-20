import 'package:flutter/material.dart';

class PersonalMaterial {
  static  var WIDTH;
  static  var HEIGHT;

  static Container rectangleOutsideShadow( var height , var width, double radius, {double margin = 0.0}) {
    return Container(
      width: width-2*margin,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0),

          BoxShadow(
              color: Colors.grey[600],
              offset: Offset(4.0, 4.0),
              blurRadius: 10.0,
              spreadRadius: 1.0),

        ],
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  static Container rectangleInnerShadow( double height, double width)
  {
    return Container(
      child : SizedBox.expand(

      ),

      decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[600],
                offset: Offset(4.0, 4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
            BoxShadow(
                color: Colors.white,
                offset: Offset(-4.0, -4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
          ],

          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey[200],
                Colors.grey[300],
                Colors.grey[400],
                Colors.grey[500],
              ],
              stops: [
                0.1,
                0.3,
                0.8,
                1
              ]
          )

      ),
    );
  }

  static BoxDecoration boxDecoration()
  {
    return BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      boxShadow: [
        BoxShadow(
            color: Colors.white,
            offset: Offset(-4.0, -4.0),
            blurRadius: 15.0,
            spreadRadius: 1.0),
        BoxShadow(
            color: Colors.grey[600],
            offset: Offset(4.0, 4.0),
            blurRadius: 10.0,
            spreadRadius: 1.0),
      ],
      borderRadius: BorderRadius.circular(30),
    );
  }
}

/*
IgnorePointer(
ignoring: _isInvisible,
child: new Opacity(
opacity: _opacity,
child: ElevatedButton(
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
padding: EdgeInsets.symmetric(
horizontal: 40, vertical: 28),
textStyle: TextStyle(fontSize: 20),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(18.0),
),
side: BorderSide(color: Colors.white, width: 8),
),
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => VisibilityExample()),
);
},
),
),
),
*/