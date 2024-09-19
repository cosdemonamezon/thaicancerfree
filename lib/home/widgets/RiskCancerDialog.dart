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
              fontFamily: 'Prompt',
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
              Expanded(
                flex: 1,
                child: Text(
                  '1. ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Prompt',
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(width: size.width * 0.001,),
              ),
              Expanded(
                flex: 12,
                child: Text(
                  'อายุตั้งแต่ 40 ปีขึ้นไป',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Prompt',
                  ),
                ),
              ),
            ],
          ),
          
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  '2. ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Prompt',
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(width: size.width * 0.001,),
              ),
              Expanded(
                flex: 12,
                child: Text(
                  'มีญาติสายตรง (First Degree relatives) ได้แก่ พ่อ แม่ พี่ น้อง บุตร เป็นมะเร็งเต้านม',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Prompt',
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
