// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:palmpea/utility/my_constant.dart';

class ShowText extends StatelessWidget {
  final String text;
  final TextStyle? textStlye;
  const ShowText({
    Key? key,
    required this.text,
    this.textStlye,
  }) : super(key: key);
  // const ShowText({
  //   Key? key,
  //   required this.text,
  //   this.textStyle,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStlye ?? MyConstant().h1Style(),
    ); //รีเทรินค่า text เเละ style จากหน้า My_Constant.dart
  }
}
