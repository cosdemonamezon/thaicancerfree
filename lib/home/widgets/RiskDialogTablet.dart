import 'package:flutter/material.dart';
import 'package:thaicancerfree/constants.dart';

class RiskDialogTablet extends StatelessWidget {
  const RiskDialogTablet({super.key, required this.size, required this.pressNo, required this.pressYes});

  final Size size;
  final VoidCallback pressYes;
  final VoidCallback pressNo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.65,
      height: size.height * 0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Container(
              width: size.width * 0.65,
              height: size.height * 0.25,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    width: 0.5,
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                    child: Text(
                      "กล่องข้อความ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: isPhone(context) ? 19.55 : 28.55,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Prompt',
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: Column(
                      children: [
                        Text(
                          'แบบประเมินความเสี่ยงมะเร็งเต้านมชุดนี้เป็นการนำปัจจัยเสี่ยงต่างๆ จากหลักฐานทางวิชาการที่อาจส่งผลต่อการเป็นมะเร็งเต้านมมาจัดทำเป็นชุดคำถามเพื่อประเมินระดับความเสี่ยงเบื้องต้นเท่านั้น',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: isPhone(context) ? 19.55 : 27.6,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Prompt',
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            width: size.width * 0.65,
            height: size.height * 0.05,
            child: Row(
              children: [
                Expanded(
                    flex: 5,
                    child: GestureDetector(
                      onTap: pressNo,
                      child: Container(
                        width: size.width * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Center(
                            child: Text(
                          'ปิด',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: isPhone(context) ? 19.55 : 25.55,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Prompt',
                          ),
                          textAlign: TextAlign.start,
                        )),
                      ),
                    )),
                VerticalDivider(
                  color: Colors.grey,
                ),
                Expanded(
                    flex: 5,
                    child: GestureDetector(
                      onTap: pressYes,
                      child: Container(
                        width: size.width * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Center(
                            child: Text(
                          'ตกลง',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: isPhone(context) ? 19.55 : 25.55,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Prompt',
                          ),
                          textAlign: TextAlign.start,
                        )),
                      ),
                    )),
                // MaterialButton(
                //   onPressed: () {
                //     Navigator.of(context).pop();
                //   },
                //   child: SizedBox(
                //     height: double.infinity,
                //     width: double.infinity,
                //     child: Center(
                //       child: Text("button"),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
