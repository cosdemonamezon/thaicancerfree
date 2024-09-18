import 'package:flutter/material.dart';
import 'package:thaicancerfree/constants.dart';

class HeaderQuestionWidget extends StatelessWidget {
  const HeaderQuestionWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              height: size.height * 0.01,
            )),
        Expanded(
            flex: isPhone(context) ? 10 : 14,
            child: Center(
                child: Text(
              '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ))),
        Expanded(
            flex: isPhone(context) ? 2 : 2,
            child: Center(
                child: Text(
              'ใช่',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isPhone(context) ? 16 : 24,
              ),
            ))),
        Expanded(
            flex: isPhone(context) ? 2 : 2,
            child: Center(
                child: Text(
              'ไม่ใช่',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: isPhone(context) ? 16 : 24,
              ),
            ))),
      ],
    );
  }
}