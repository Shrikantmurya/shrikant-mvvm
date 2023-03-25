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
          displayLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
          displayMedium: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          displaySmall: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          titleMedium: TextStyle(fontSize: 14.0,),
          bodyLarge: TextStyle(fontSize: 14.0, color: Colors.white,),
          bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black,),   
        ),
      iconTheme: const IconThemeData(
      color: Colors.white,
      ),
    );
    

final ThemeData themeDataDark = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color.fromARGB(255, 28, 27, 27),
    primaryColorDark: Colors.teal,
    primaryColorLight: const Color.fromARGB(255, 157, 156, 156),
    scaffoldBackgroundColor: Colors.black,  
    secondaryHeaderColor: const Color.fromARGB(255, 255, 255, 255),
     textTheme: const TextTheme(
           displayLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
          displayMedium: TextStyle(fontSize: 36.0,),
          displaySmall: TextStyle(fontSize: 36.0,),
          titleMedium: TextStyle(fontSize: 14.0,),
          bodyLarge: TextStyle(fontSize: 14.0, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white),  
        ),
      iconTheme: const IconThemeData(
      color: Colors.white,
      ),
);
