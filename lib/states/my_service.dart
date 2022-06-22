import 'package:flutter/material.dart';
import 'package:palmpea/bodys/finish_job.dart';
import 'package:palmpea/bodys/non_finish_job.dart';
import 'package:palmpea/utility/my_constant.dart';
import 'package:palmpea/utility/mydialog.dart';
import 'package:palmpea/widgets/show_icon_button.dart';
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
  var widgets = <Widget>[const NonFinishJob(), const FinisJob()];
  var buttonNavigatorBarItemss = <BottomNavigationBarItem>[];
  int indexBodys = 0;

  @override
  void initState() {
    super.initState();
    // for (var i = 0; i < 
    //.length; i++) {
    //   buttonNavigatorBarItemss.add(
    //     BottomNavigationBarItem(
    //       icon: Icon(iconDatas[i]),
    //     ),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: newAppbar(context),
      body: widgets[indexBodys],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexBodys,
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
      title: ShowTest(
        text: titles[indexBodys],
        textStyle: MyConstant().h2Style(),
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
                  label: 'sign out',
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
