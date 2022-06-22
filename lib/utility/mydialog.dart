// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:palmpea/utility/my_constant.dart';
import 'package:palmpea/widgets/show_image.dart';
import 'package:palmpea/widgets/show_text.dart';
import 'package:palmpea/widgets/show_text_button.dart';

class Mydialog {
  final BuildContext context;
  Mydialog({
    required this.context,
  });
  Future<void> normalDialog({
    required String title,
    required String subTitle,
    String? label,
    Function()? pressFunc

  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: ListTile(
          leading: const SizedBox(
            width: 80,
            child: ShowImage(),
          ),
          title: ShowTest(
            text: title,
            textStyle: MyConstant().h2Style(),
          ),
          subtitle: ShowTest(text: subTitle),
        ),
        actions: [

pressFunc == null?
          ShowTextButton(
              label: label!,
              pressFunc: () {
                Navigator.pop(context);
              }) : ShowTextButton(
              label: label!,
              pressFunc: pressFunc
              // () {
              //   //Navigator.pop(context);
              // },
              )


        ],
      ),
    );
  }
}
