import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RiskDialog extends StatelessWidget {
  const RiskDialog({super.key, required this.size, required this.pressNo, required this.pressYes});

  final Size size;
  final VoidCallback pressYes;
  final VoidCallback pressNo;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Column(
        children: [
          Text(
            'กล่องข้อความ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Prompt',
            ),
          ),
          Divider(),
        ],
      ),
      content: Center(
          child: Text(
        'แบบประเมินความเสี่ยงมะเร็งเต้านมชุดนี้เป็นการนำปัจจัยเสี่ยงต่างๆจากหลักฐานทางวิชาการที่อาจส่งผลต่อการเป็นมะเร็งเต้านมมาจัดทำเป็นชุดคำถามเพือประเมินระดับความเสี่ยงเบื้องต้นเท่านั้น',
        style: TextStyle(
          color: Colors.black,
          fontSize: 19.55,
          fontWeight: FontWeight.w500,
          fontFamily: 'Prompt',
        ),
        textAlign: TextAlign.start,
      )),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          onPressed: pressNo,
          child: Text(
            'ปิด',
            style: TextStyle(
              fontFamily: 'Prompt',
            ),
          ),
        ),
        CupertinoDialogAction(
          onPressed: pressYes,
          child: Text(
            'ตกลง',
            style: TextStyle(
              fontFamily: 'Prompt',
            ),
          ),
        ),
        
      ],
    );
  }
}
