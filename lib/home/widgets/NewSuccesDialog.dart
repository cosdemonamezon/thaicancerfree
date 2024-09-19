import 'package:flutter/material.dart';
import 'package:thaicancerfree/constants.dart';

class NewScessDialog extends StatelessWidget {
  const NewScessDialog({
    super.key,
    required this.pressYes,
    required this.title,
  });

  final String title;
  final VoidCallback pressYes;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.50,
      height: size.height * 0.17,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Container(
              width: size.width * 0.85,
              height: isPhone(context) ? size.height * 0.78 :size.height * 0.88,
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                    child: Text(
                      "สถานะลงทะเบียน",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: isPhone(context) ? 25.55 : 32.55,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        fontFamily: 'Prompt',
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.grey,
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: size.height * 0.04),
                        Image.asset(
                          'assets/images/images.png',
                          //width: size.width * 0.21,
                          height: size.height * 0.15,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: isPhone(context) ? size.height * 0.02 :size.height * 0.04),
                        Image.asset(
                          'assets/images/image_10.png',
                          //width: size.width * 0.21,
                          height: size.height * 0.25,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: isPhone(context) ? size.height * 0.02 :size.height * 0.05),
                        Text(
                          '$title',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: isPhone(context) ? 22 : 33,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                            fontFamily: 'Prompt',
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: size.height * 0.02),
                        Text(
                          'ท่านสามารถปิดหน้านี้ได้ทันที',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: isPhone(context) ? 22 : 30,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                            fontFamily: 'Prompt',
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: isPhone(context) ? size.height * 0.04 :size.height * 0.08),
                        GestureDetector(
                          onTap: pressYes,
                          child: Container(
                            width: size.width * 0.75,
                            height: size.height * 0.07,
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
                                    'ปิด',
                                    style: TextStyle(
                                      color: kContentTextColor,
                                      fontSize: isPhone(context) ? 18 : 28,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none,
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
