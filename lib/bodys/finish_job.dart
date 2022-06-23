import 'package:flutter/material.dart';
import 'package:palmpea/utility/my_constant.dart';
//หน้าเพจที่เเสดงงานที่เสร็จเเล้ว
import '../widgets/show_text.dart';

class FinisJob extends StatelessWidget {
  const FinisJob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowText(
      text: 'This is NonFinishJob',
      textStlye: MyConstant().h2Style(),
    );
  }
}
