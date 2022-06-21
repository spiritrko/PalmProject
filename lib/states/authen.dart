import 'package:flutter/material.dart';
import 'package:palmpea/widgets/show_form.dart';
import 'package:palmpea/widgets/show_image.dart';
import 'package:palmpea/widgets/show_text.dart';

class Authen extends StatelessWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              newLogo(boxConstraints),
              newTitle(),
              formUser(boxConstraints),
              formPassword(boxConstraints)
            ],
          ),
        );
      }),
    );
  }

  Container formPassword(BoxConstraints boxConstraints) {
    return Container(
              margin: const EdgeInsets.only(top: 16),
              width: boxConstraints.maxWidth*0.6,
              height: 40,
              child: ShowForm(
                hint: 'Password',
                iconData: Icons.lock_outline,
                changeFung: (String string) {},
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
        changeFung: (String string) {},
      ),
    );
  }

  ShowTest newTitle() => ShowTest(text: 'Login :');

  SizedBox newLogo(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxHeight * 0.15,
      child: ShowImage(),
    );
  }
}
