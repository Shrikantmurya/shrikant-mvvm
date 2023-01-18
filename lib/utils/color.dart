import 'package:flutter/material.dart';
//color themes for light and dark mode
final ThemeData themeDataLight =  ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color.fromARGB(255, 28, 27, 27),
    primaryColorDark: Colors.teal,
    primaryColorLight: const Color.fromARGB(255, 157, 156, 156),
    scaffoldBackgroundColor: Colors.white,  
    secondaryHeaderColor: const Color.fromARGB(255, 0, 0, 0),
    textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
          headline2: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          headline3: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          subtitle1: TextStyle(fontSize: 14.0,),
         bodyText1: TextStyle(fontSize: 14.0, color: Colors.white,),
          bodyText2: TextStyle(fontSize: 14.0, color: Colors.black,),   
        ),
      iconTheme: const IconThemeData(
      color: Colors.white,
      ),
    );
    

final ThemeData themeDataDark = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color.fromARGB(255, 28, 27, 27),
    primaryColorDark: Colors.teal,
    primaryColorLight: Color.fromARGB(255, 157, 156, 156),
    scaffoldBackgroundColor: Colors.black,  
    secondaryHeaderColor: Color.fromARGB(255, 255, 255, 255),
     textTheme: const TextTheme(
           headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
          headline2: TextStyle(fontSize: 36.0,),
          headline3: TextStyle(fontSize: 36.0,),
          subtitle1: TextStyle(fontSize: 14.0,),
          bodyText1: TextStyle(fontSize: 14.0, color: Colors.white),
          bodyText2: TextStyle(fontSize: 14.0, color: Colors.white),  
        ),
      iconTheme: IconThemeData(
      color: Colors.white,
      ),
);
