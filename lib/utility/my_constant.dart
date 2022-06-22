import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyConstant {
  // Field
  static Color primary = Color.fromARGB(255, 33, 243, 240);
  static Color dark = Color.fromARGB(255, 32, 32, 29);
  static Color active = CupertinoColors.quaternaryLabel;
  //Method
  BoxDecoration bgBox() {
    return BoxDecoration(
      gradient: RadialGradient(
        radius: 1.0,
        center: Alignment(-0.3, -0.3),
        colors: [Colors.white, Colors.yellow],
      ),
    ); //สีพื้นหลัง
  }

  TextStyle h1Style() {
    //เเบบตัวอักษร
    return GoogleFonts.mali(
      fontSize: 36,
      color: dark,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle h2Style() {
    return GoogleFonts.mali(
      fontSize: 36,
      color: dark,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle h3Style() {
    return GoogleFonts.mali(
      fontSize: 36,
      color: dark,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle h3ActiveStyle() {
    return GoogleFonts.mali(
      textStyle: TextStyle(
        fontSize: 14,
        color: active,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
