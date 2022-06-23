import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:palmpea/models/user_model.dart';
import 'package:palmpea/states/my_service.dart';
import 'package:palmpea/utility/my_constant.dart';
import 'package:palmpea/utility/mydialog.dart';
import 'package:palmpea/widgets/show_button.dart';
import 'package:palmpea/widgets/show_form.dart';
import 'package:palmpea/widgets/show_image.dart';
import 'package:palmpea/widgets/show_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool redEye = true; //bool ใช้กับ true false เท่านั้น
  String? user, password;
  @override
  Widget build(BuildContext context) {
    //ทำหน้าที่เหมือน pageload
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusScopeNode());
          },
          child: Container(
            decoration: MyConstant().bgBox(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  newLogo(boxConstraints), //call logo
                  newTitle(boxConstraints), //call new title
                  formUser(boxConstraints), //call formUser
                  formPassword(boxConstraints), //callPassword
                  buttonLogin(boxConstraints), //call Button login
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Container buttonLogin(BoxConstraints boxConstraints) {
    //ปุ่ม login
    return Container(
      margin: const EdgeInsets.only(top: 16), //กำหนดขนาด
      width: boxConstraints.maxWidth * 0.6,
      child: ShowButtom(
        label: 'Login',
        pressFunc: () {
          //เป็นฟังก์ชันกดเเล้วได้ไร ไม่กรอกเเล้วขึ้นอะไร
          print('user = $user, password = $password');
          if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
            print('Have Space');
            Mydialog(context: context)
                .normalDialog(title: 'กรอก', subTitle: 'subtitle');
          } else {
            print('No Space');
            processCheckLogin(); //เรียก processCheckLogin
          }
        },
      ),
    );
  }

  Future<void> processCheckLogin() async {
    //การ login เพื่อเช็คค่าในดาต้าเบสโดยการเรียก service
    String path =
        'https://www.androidthai.in.th/egat/getUserWhereUserpalm.php?isAdd=true&user=$user';
    await Dio().get(path).then((value) {
      print('value ==> $value');

      if (value.toString() == 'null') {
        Mydialog(context: context).normalDialog(
            title: 'User False', subTitle: 'No $user in my Database');
      } else {
        var result = json.decode(value.data);
        print(result);
        for (var element in result) {
          UserModel userModel = UserModel.fromMap(element);
          if (password == userModel.password) {
            Mydialog(context: context).normalDialog(
                pressFunc: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  var data = <String>[];
                  data.add(userModel.id);
                  data.add(userModel.name);
                  data.add(userModel.position);

                  preferences.setStringList('data', data).then(
                    (value) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Myservice(),
                          ),
                          (route) => false);
                    },
                  );
                },
                title: 'Login Success Welcome',
                subTitle: 'Login Success Welcom ${userModel.name}',
                lable: 'login');
          } else {
            Mydialog(context: context).normalDialog(
                title: 'Password False',
                subTitle: 'Please Try Again',
                lable: 'Exits');
          }
        }
      }
    });
  }

  Container formPassword(BoxConstraints boxConstraints) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: boxConstraints.maxWidth * 0.6,
      height: 40,
      child: ShowForm(
        redEyeFunc: () {
          setState(() {
            redEye = !redEye;
          });
        },
        obSecu: redEye,
        hint: 'Password',
        iconData: Icons.lock_outline,
        changeFung: (String string) {
          password = string.trim(); //ตัดช่องว่างหน้าหลัง
        },
      ),
    );
  }

  Container formUser(BoxConstraints boxConstraints) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: boxConstraints.maxWidth * 0.6,
      height: 40,
      child: ShowForm(
        hint: 'User:',
        iconData: Icons.person_outline,
        changeFung: (String string) {
          user = string.trim(); //ตัดช่องว่างหน้าหลัง
        },
      ),
    );
  }

  Widget newTitle(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxWidth * 0.6,
      child: Row(
        children: [
          ShowText(
            text: 'Login :',
            textStlye: MyConstant().h1Style(),
          ),
        ],
      ),
    );
  }

  SizedBox newLogo(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxWidth * 0.6,
      child: Row(
        children: [
          SizedBox(
            width: boxConstraints.maxHeight * 0.15,
            child: ShowImage(),
          ),
        ],
      ),
    );
  }
}
