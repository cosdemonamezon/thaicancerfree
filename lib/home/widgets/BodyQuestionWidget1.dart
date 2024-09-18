import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';
import 'package:thaicancerfree/constants.dart';

class BodyQuestionWidget1 extends StatelessWidget {
  BodyQuestionWidget1(
      {super.key,
      required this.size,
      required this.index,
      required this.groupValue1,
      required this.groupValue2,
      required this.onChanged1,
      required this.onChanged2,
      required this.selectValue1,
      required this.selectValue2,
      required this.detail});

  final int index;
  int groupValue1;
  int groupValue2;
  int selectValue1;
  int selectValue2;
  Function(int?) onChanged1;
  Function(int?) onChanged2;
  String detail;
  Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isPhone(context) ? size.height * 0.08 :size.height * 0.07,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Color(0xff263238), width: 0.1),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.001),
                child: Center(
                  child: Text(
                    '${1 + index}',
                    style: TextStyle(
                      fontSize: isPhone(context) ? 16 : 22,
                    ),
                  ),
                ),
              )),
          Expanded(
              flex: isPhone(context) ? 10 : 14,
              child: Text(
                '${detail}',
                style: TextStyle(
                  fontSize: isPhone(context) ? 15 : 20,
                ),
              )),
              //VerticalDivider(color: kContentColor3,),
          Expanded(
              flex: isPhone(context) ? 2 : 2,
              child: SizedBox(
                child: EasyRadio(
                  value: selectValue1,
                  groupValue: groupValue1,
                  onChanged: onChanged1,
                  dotStyle: DotStyle.check(StrokeCap.round),
                  activeBorderColor: kContentColor4,
                  inactiveBorderColor: kContentColor2,
                  dotColor: kContentColor4,
                  radius: isPhone(context) ? 15 :18,
                  dotRadius: 15,
                ),
              )),
          Expanded(
              flex: isPhone(context) ? 2 : 2,
              child: EasyRadio(
                value: selectValue2,
                groupValue: groupValue2,
                onChanged: onChanged2,
                dotStyle: DotStyle.check(StrokeCap.round),
                activeBorderColor: kContentColor4,
                inactiveBorderColor: kContentColor2,
                dotColor: kContentColor4,
                radius: isPhone(context) ? 15 :18,
                dotRadius: 15,
              )),
        ],
      ),
    );
  }
}
