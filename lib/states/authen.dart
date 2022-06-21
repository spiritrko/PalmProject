import 'package:flutter/material.dart';
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              newLogo(boxConstraints),
              ShowTest(text: 'Login :'),
            ],
          ),
        );
      }),
    );
  }

  SizedBox newLogo(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxHeight * 0.15,
      child: ShowImage(),
    );
  }
}
