import 'package:flutter/material.dart';
import 'package:thaicancerfree/constants.dart';

class RiskCancerDialogTablet extends StatelessWidget {
  const RiskCancerDialogTablet({super.key, required this.size, required this.pressNo, required this.pressYes});

  final Size size;
  final VoidCallback pressYes;
  final VoidCallback pressNo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.66,
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
              width: size.width * 0.67,
              height: size.height * 0.21,
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
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                '1.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: isPhone(context) ? 18 : 23.3,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Prompt',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 12,
                              child: Text(
                                'อายุตั้งแต่ 40 ปีขึ้นไป',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: isPhone(context) ? 18 : 23.3,
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
                                '2.',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: isPhone(context) ? 18 : 23.3,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Prompt',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 16,
                              child: Text(
                                'มีญาติสายตรง (First Degree relatives) ได้แก่ พ่อ แม่ พี่ น้อง บุตร เป็นมะเร็งเต้านม',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: isPhone(context) ? 18 : 23.3,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Prompt',
                                ),
                              ),
                            ),
                          ],
                        )
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
            width: size.width * 0.67,
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
                          'รับทราบ',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
