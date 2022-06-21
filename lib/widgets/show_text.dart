// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:palmpea/utility/my_constant.dart';

class ShowTest extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  const ShowTest({
    Key? key,
    required this.text,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: textStyle ?? MyConstant().h1Style(),);//รีเทรินค่า text เเละ style จากหน้า My_Constant.dart
  }
}
