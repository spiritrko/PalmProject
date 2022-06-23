import 'package:flutter/material.dart';
import 'package:palmpea/bodys/finish_job.dart';
import 'package:palmpea/bodys/non_finish_job.dart';
import 'package:palmpea/utility/my_constant.dart';
import 'package:palmpea/utility/mydialog.dart';
import 'package:palmpea/widgets/show_icon_button.dart';
import 'package:palmpea/widgets/show_progress.dart';
import 'package:palmpea/widgets/show_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myservice extends StatefulWidget {
  const Myservice({Key? key}) : super(key: key);

  @override
  State<Myservice> createState() => _MyserviceState();
}

class _MyserviceState extends State<Myservice> {
  var titles = <String>['nonefinish', 'finish'];
  var iconDatas = <IconData>[Icons.close, Icons.done];
  var widgets = <Widget>[];
  var buttonNavigatorBarItemss = <BottomNavigationBarItem>[];
  int indexBodys = 0;

  @override
  void initState() {
    super.initState();
    createNavBar();
    processFindUserLogin();
  }

  Future<void> processFindUserLogin() async {
    //เช็ค login ที่เก็บไว้ใน preferences เก็บประวัติ
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var dataLogins = preferences.getStringList('data');
    print('dataLogins ==> $dataLogins');
    widgets.add(NonFinishJob(dataUserLogins: dataLogins!));
    widgets.add(FinisJob());
    setState(() {});
  }

  void createNavBar() {
    //สร้าง navbar button
    for (var i = 0; i < titles.length; i++) {
      buttonNavigatorBarItemss.add(
        BottomNavigationBarItem(
          label: titles[i],
          icon: Icon(
            iconDatas[i],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: newAppbar(context),
      body: widgets.isEmpty ? const ShowProgress() : widgets[indexBodys],
      bottomNavigationBar: BottomNavigationBar(
          items: buttonNavigatorBarItemss,
          onTap: (value) {
            setState(() {
              indexBodys = value;
            });
          }),
    );
  }

  AppBar newAppbar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: ShowText(
        text: titles[indexBodys],
        textStlye: MyConstant().h2Style(),
      ),
      elevation: 0,
      foregroundColor: Colors.black54,
      backgroundColor: Colors.white,
      actions: [
        ShowIconButton(
            iconData: Icons.exit_to_app_outlined,
            pressFunc: () {
              Mydialog(context: context).normalDialog(
                  title: 'Exit',
                  subTitle: 'ยืนยันการออกจากระบบ',
                  lable: 'sign out',
                  pressFunc: () async {
                    SharedPreferences preferrence =
                        await SharedPreferences.getInstance();

                    preferrence.clear().then(
                      (value) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/authen', (route) => false);
                      },
                    );
                  });
            })
      ],
    );
  }
}
