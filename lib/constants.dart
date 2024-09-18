import 'package:flutter/material.dart';

const kContentColor1 = Color(0xffF0A8D0);
const kContentColor2 = Color(0xffF7B5CA);
const kContentColor3 = Color(0xffFFEEF4);
const kContentColor4 = Color(0xffED3EF7);
const kButtonYesColor = Color(0xffFFC6C6);
const kButtonNoColor = Color(0xff776B5D);
const kContentTextColor = Color(0xff3A4D39);
const kSecondTextColor = Color(0xffE8DFCA);
const kBackgroundColor = Color(0xffF9F5F6);
const kContentTitleTextColor = Color(0xff354259);

bool isPhone(BuildContext context) => MediaQuery.of(context).size.shortestSide < 550;

const String publicUrl = 'asha-tech.co.th';

const List<Map<String, dynamic>> sexList = [
  {
    "id": 1,
    "name": "ชาย"
  },
  {
    "id": 2,
    "name": "หญิง"
  }
];

