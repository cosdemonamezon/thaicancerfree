import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key, required this.pressYes, required this.title});

  final VoidCallback pressYes;
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
          //Divider(),
          SizedBox(
            height: size.height * 0.02,
          )
        ],
      ),
      content: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'Prompt',
          ),
          textAlign: TextAlign.start,
        ),
      ),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          onPressed: pressYes,
          child: Text(
            'ตกลง',
            style: TextStyle(
              fontFamily: 'Prompt',
            ),
          ),
        ),
        // Center(
        //   child: GestureDetector(
        //     onTap: pressYes,
        //     child: Container(
        //       width: size.width * 0.30,
        //       height: size.height * 0.06,
        //       decoration: ShapeDecoration(
        //         shape: RoundedRectangleBorder(),
        //         color: Colors.transparent,
        //       ),
        //       child: Padding(
        //         padding: EdgeInsets.all(1),
        //         child: DecoratedBox(
        //           decoration: ShapeDecoration(
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(10),
        //             ),
        //             gradient: LinearGradient(
        //               colors: [
        //                 kContentColor1,
        //                 kContentColor2,
        //               ],
        //               begin: Alignment.topLeft,
        //               end: Alignment.bottomRight,
        //             ),
        //           ),
        //           child: Center(
        //             child: Text(
        //               'ตกลง',
        //               style: TextStyle(color: kContentTextColor, fontSize: 18, fontWeight: FontWeight.bold),
        //               textAlign: TextAlign.center,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
