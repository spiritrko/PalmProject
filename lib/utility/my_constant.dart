import 'package:flutter/material.dart';

class MyConstant {
  // Field
  static Color primary = Color.fromARGB(255, 33, 243, 240);
  static Color dark = Color.fromARGB(255, 161, 138, 60);
  //Method
  TextStyle h1Style() {
    return TextStyle(
      fontSize: 36,
      color: dark, 
      fontWeight : FontWeight.bold,
      );
  }
  TextStyle h2Style() {
    return TextStyle(
      fontSize: 36,
      color: dark, 
      fontWeight : FontWeight.w700,
      );
  }
  TextStyle h3Style() {
    return TextStyle(
      fontSize: 36,
      color: dark, 
      fontWeight : FontWeight.normal,
      );
  }
}
