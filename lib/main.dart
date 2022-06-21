import 'package:flutter/material.dart';
import 'package:palmpea/states/authen.dart';

void main() {
  runApp(MyApp());//class MyApp ทำงานก่อน
} //main ชื่อตรงกับ ชื่อหน้าทำก่อนเสมอ

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Authen(),
    );
  }
}
