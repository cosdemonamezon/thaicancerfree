import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thaicancerfree/constants.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({super.key, required this.size, required this.pressNo, required this.pressYes, required this.title});

  final Size size;
  final VoidCallback pressYes;
  final VoidCallback pressNo;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
        content: SizedBox(
          height: size.height * 0.21,
          width: size.width * 0.8,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Prompt',
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
              ],
            ),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: pressNo,
                child: Container(
                  width: size.width * 0.30,
                  height: size.height * 0.06,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(),
                    color: Colors.transparent,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: DecoratedBox(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            kButtonNoColor,
                            kButtonNoColor,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'กลับ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Prompt',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: pressYes,
                child: Container(
                  width: size.width * 0.30,
                  height: size.height * 0.06,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(),
                    color: Colors.transparent,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: DecoratedBox(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            kContentColor1,
                            kContentColor2,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'ตกลง',
                          style: TextStyle(
                            color: kContentTextColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Prompt',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ]);
  }
}
