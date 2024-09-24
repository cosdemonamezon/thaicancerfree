import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thaicancerfree/constants.dart';

class RiskCancerDialog2 extends StatelessWidget {
  const RiskCancerDialog2({super.key, required this.size, required this.pressNo, required this.pressYes});

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
          Text(
            'ท่านมีสิทธ์ รับการตรวจคัดกรองมะเร็งเต้านม (แมมโมแกรม + อัลตราซาวน์เต้านม) ในบริการสร้างเสริมสุขภาพและการป้องกันโรคของสำนักงานหลักประกันสุขภาพแห่งชาติโดยท่านต้องเตรียมเอกสารดังนี้เมื่อเข้ารับบริการ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'Prompt',
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    '1.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Prompt',
                    ),
                  )),
              Expanded(
                  flex: 9,
                  child: Text(
                    'บัตรประจำตัวประชาชน',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Prompt',
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    '2.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Prompt',
                    ),
                  )),
              Expanded(
                  flex: 9,
                  child: Text(
                    'ใบรับรองแพทย์ที่ระบุว่า ญาติสายตรงของท่านเป็นมะเร็งเต้านม',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Prompt',
                    ),
                  ))
            ],
          ),
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
            'รับทราบ',
            style: TextStyle(
              fontFamily: 'Prompt',
            ),
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     GestureDetector(
        //       onTap: pressNo,
        //       child: Container(
        //         width: size.width * 0.30,
        //         height: size.height * 0.06,
        //         decoration: ShapeDecoration(
        //           shape: RoundedRectangleBorder(),
        //           color: Colors.transparent,
        //         ),
        //         child: Padding(
        //           padding: EdgeInsets.all(1),
        //           child: DecoratedBox(
        //             decoration: ShapeDecoration(
        //               shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(10),
        //               ),
        //               gradient: LinearGradient(
        //                 colors: [
        //                   kButtonNoColor,
        //                   kButtonNoColor,
        //                 ],
        //                 begin: Alignment.topLeft,
        //                 end: Alignment.bottomRight,
        //               ),
        //             ),
        //             child: Center(
        //               child: Text(
        //                 'กลับ',
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                   fontSize: 18,
        //                 ),
        //                 textAlign: TextAlign.center,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //     GestureDetector(
        //       onTap: pressYes,
        //       child: Container(
        //         width: size.width * 0.30,
        //         height: size.height * 0.06,
        //         decoration: ShapeDecoration(
        //           shape: RoundedRectangleBorder(),
        //           color: Colors.transparent,
        //         ),
        //         child: Padding(
        //           padding: EdgeInsets.all(1),
        //           child: DecoratedBox(
        //             decoration: ShapeDecoration(
        //               shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(10),
        //               ),
        //               gradient: LinearGradient(
        //                 colors: [
        //                   kContentColor1,
        //                   kContentColor2,
        //                 ],
        //                 begin: Alignment.topLeft,
        //                 end: Alignment.bottomRight,
        //               ),
        //             ),
        //             child: Center(
        //               child: Text(
        //                 'ลงทะเบียน',
        //                 style: TextStyle(color: kContentTextColor, fontSize: 18, fontWeight: FontWeight.bold),
        //                 textAlign: TextAlign.center,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // )
      ],
    );
  }
}
