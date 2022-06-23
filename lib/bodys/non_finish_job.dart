// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:palmpea/models/job_model.dart';
import 'package:palmpea/states/detail.dart';
import 'package:palmpea/utility/my_calculate.dart';
import 'package:palmpea/utility/my_constant.dart';
import 'package:palmpea/widgets/show_progress.dart';

import 'package:palmpea/widgets/show_text.dart';

//หน้าเพจที่เเสดงงานไม่สำเร็จ
class NonFinishJob extends StatefulWidget {
  //convert เป็น full เพื่อประกาศตัวเเปรได้
  final List<String> dataUserLogins;
  const NonFinishJob({
    Key? key,
    required this.dataUserLogins,
  }) : super(key: key);

  @override
  State<NonFinishJob> createState() => _NonFinishJobState();
}

class _NonFinishJobState extends State<NonFinishJob> {
  var dataUserLogin = <String>[]; //กำหนดเป็น array
  var jobModels = <JobModel>[]; //เก็บข้อมูล job

  @override //พิม init set value เพื่อเอาไปใช้ใน build
  void initState() {
    // TODO: implement initState
    super.initState();
    dataUserLogin = widget.dataUserLogins;
    readDataJob();
  }

  Future<void> readDataJob() async {
    String idOfficer = dataUserLogin[0];
    String path =
        'https://www.androidthai.in.th/egat/getUserWhereUserOfficerPalm.php?isAdd=true&idOfficer=$idOfficer';
    await Dio().get(path).then((value) {
      print('value ===>> $value');
      var result = json.decode(value.data);
      for (var element in result) {
        JobModel jobModel = JobModel.fromMap(element);
        print('job ==> ${jobModel.job}');
        if (jobModel.status == 'start') {
          //อ่านค่า job model ในส่วนดาต้าเบสของ status
          jobModels.add(jobModel);
        }
      }
      setState(() {});
    });
  }

//การใช้ const เป็นค่าคงที่ ตัวอย่าง
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          showTitle(head: 'ชื่อพนักงาน :', values: dataUserLogin[1]),
          showTitle(head: 'ตำเเหน่ง', values: dataUserLogin[2]),
          jobModels.isEmpty
              ? const ShowProgress()
              : ListView.builder(
                  shrinkWrap: true, //list view กางออกทั้งหมด
                  physics: const ScrollPhysics(), //ถ้ายาวมากๆให้เกิด scolllbar
                  itemCount: jobModels.length, //นับความยาว
                  itemBuilder: (context, index) => InkWell(//ให้สามารถกดได้
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail(jobModel:  jobModels[index]),)).then((value){});//กดไปเเล้วย้อนกลับมาจะให้ทำไร
                    },
                    child: showTitle(
                      head: 'Job',
                      values: jobModels[index].job, //Builder ที่อยู่ใน Listview
                      detail: MyCalculate()
                          .cutWord(word: jobModels[index].detail), //ตัดคำ
                    ),
                  ),
                ), //เป็นการโหลดค่าถ้าโหลดค่าไม่ได้จะเอาในส่วน itemBuilder มาเเสดง
        ],
      ),
    ); //จัดเก็บตัวเเปร รอส่ง ชื่อพนักงาน
  }

//เเยก medtod row
  Widget showTitle(
      {required String head, required String values, String? detail}) {
    //รอรับตัวเเปร head
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1, //แบ่งหน้าจอ ให้ส่วนนี้ 1 ส่วน
                  child: ShowText(
                    text: head,
                    textStlye: MyConstant().h2Style(),
                  ),
                ),
                Expanded(
                  flex: 2, //แบ่งหน้าจอ ให้ส่วนนี้ 2 ส่วน
                  child: ShowText(
                    text: values,
                    textStlye: MyConstant().h2Style(),
                  ),
                )
              ],
            ),
            detail == null
                ? const SizedBox()
                : Container(
                    margin: const EdgeInsets.only(top: 8), //ระยะห่างจากขอบบน
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ), //ทำกรอบ
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ShowText(text: detail),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
