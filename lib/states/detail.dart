// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:palmpea/models/job_model.dart';
import 'package:palmpea/utility/my_constant.dart';
import 'package:palmpea/utility/mydialog.dart';
import 'package:palmpea/widgets/show_icon_button.dart';
import 'package:palmpea/widgets/show_image.dart';
import 'package:palmpea/widgets/show_text.dart';

class Detail extends StatefulWidget {
  //stateless ประกาศตัวเเปรไม่ได้
  final JobModel jobModel;

  const Detail({
    Key? key,
    required this.jobModel,
  }) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  JobModel? jobModel;
  File? file; //ตัวเเปรไว้เก็บภาพ

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    jobModel = widget.jobModel;
  }

  Future<void> processTakePhoto({required ImageSource imageSource}) async {
    var result = await ImagePicker().pickImage(
      source: imageSource, //ระบบย่อภาพให้เอง 100k
      maxWidth: 800,
      maxHeight: 800,
    );

    if (result != null) {
      //ไม่เท่ากับ null คือถ่ายภาพ
      file = File(result.path);
      setState(() {
        //คือการเเทนที่ค่าใหม่
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //กดที่กล่องตัวหนังสือจะไปอีกหน้าโชว์ชื่อ Testjob
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: ShowText(
          text: jobModel!.job,
          textStlye: MyConstant().h2Style(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: MyConstant.dark,
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        return Center(
          child: Column(
            children: [
              newImage(boxConstraints),
            ],
          ),
        );
      }), //นำภาพมาเเสดง
    );
  }

  Container newImage(BoxConstraints boxConstraints) {
    //ในลูปภาพ
    return Container(
        margin: const EdgeInsets.only(top: 36, bottom: 16),
        width: boxConstraints.maxWidth * 0.6,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0), //ภาพเล็ก
              child: file == null
                  ? ShowImage(
                      path: 'images/image.png',
                    )
                  : Image.file(file!),
            ),
            Positioned(
                right: 0,
                bottom: 0,
                child: ShowIconButton(
                    //เเสดงหน้าต่างเข้ากล้อง ับ เเกลอรี่
                    iconData: Icons.add_a_photo,
                    pressFunc: () {
                      Mydialog(context: context).normalDialog(
                          pressFunc: () {
                            //กล้อง
                            processTakePhoto(imageSource: ImageSource.camera);
                            Navigator.pop(context);//ปิดลง
                          },
                          pressFunc2: () {
                            //เเกลอรี่
                            processTakePhoto(imageSource: ImageSource.gallery);
                            Navigator.pop(context);//ปิดลง
                          },
                          title: 'Source Image',
                          subTitle: 'Please Tab Camera or Gallery',
                          lable2: 'Gallery',
                          lable: 'Camera');
                    })),
          ],
        ));
  }
}
