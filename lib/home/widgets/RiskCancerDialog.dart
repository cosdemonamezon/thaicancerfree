import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RiskCancerDialog extends StatelessWidget {
  const RiskCancerDialog({super.key, required this.size, required this.pressNo, required this.pressYes});

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
            ),
          ),
          Divider(),
        ],
      ),
      content: Column(
        children: [
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            children: [
              Text(
                '1. อายุตั้งแต่ 40 ปีขึ้นไป',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            children: [
              Expanded(
                flex: 9,
                child: Text(
                  '2. มีญาติสายตรง (First Degree relatives) ได้แก่ พ่อ แม่ พี่ น้อง บุตร เป็นมะเร็งเต้านม',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          )
          
        ],
      ),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          onPressed: pressNo,
          child: Text(
            'ปิด',
            // style: TextStyle(
            //   color: kThemeTextColor,
            //   fontFamily: fontFamily,
            // ),
          ),
        ),
        CupertinoDialogAction(
          onPressed: pressYes,
          child: Text(
            'ตกลง',
            // style: TextStyle(
            //   color: kThemeTextColor,
            //   fontFamily: fontFamily,
            // ),
          ),
        ),
       
      ],
    );
  }
}
