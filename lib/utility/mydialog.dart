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
  Future<void> normalDialog(
      {required String title,
      required String subTitle,
      String? lable,
      String? lable2,
      Function()? pressFunc2,
      Function()? pressFunc}) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: ListTile(
          leading: const SizedBox(
            width: 80,
            child: ShowImage(),
          ),
          title: ShowText(
            text: title,
            textStlye: MyConstant().h1Style(),
          ),
          subtitle: ShowText(
            text: subTitle,
            textStlye: MyConstant().h1Style(),
          ),
        ),
        actions: [
          pressFunc == null
              ? ShowTextButton(
                  label: lable!,
                  pressFunc: () {
                    Navigator.pop(context);
                  })
              : ShowTextButton(label: lable!, pressFunc: pressFunc
                  // () {
                  //   //Navigator.pop(context);
                  // },
                  ),
                  pressFunc2 == null ? const SizedBox(): ShowTextButton(label: lable2!, pressFunc: pressFunc2) 
        ],
      ),
    );
  }
}
