import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';
import 'package:thaicancerfree/constants.dart';

class BodyQuestionWidget extends StatelessWidget {
  BodyQuestionWidget(
      {super.key,
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Text(
                  '${1 + index}',
                  style: TextStyle(
                    fontSize: isPhone(context) ? 16 : 22,
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
            Expanded(
                flex: isPhone(context) ? 3 : 2,
                child: SizedBox(
                  child: EasyRadio(
                    value: selectValue1,
                    groupValue: groupValue1,
                    onChanged: onChanged1,
                    dotStyle: DotStyle.check(StrokeCap.round),
                    activeBorderColor: kContentColor1,
                    radius: 20,
                    dotRadius: 15,
                  ),
                )),
            Expanded(
                flex: isPhone(context) ? 3 : 2,
                child: EasyRadio(
                  value: selectValue2,
                  groupValue: groupValue2,
                  onChanged: onChanged2,
                  dotStyle: DotStyle.check(StrokeCap.round),
                  activeBorderColor: kContentColor1,
                  radius: 20,
                  dotRadius: 15,
                )),
          ],
        ),
        Divider(),
      ],
    );
  }
}
