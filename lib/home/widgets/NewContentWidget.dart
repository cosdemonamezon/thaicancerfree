import 'package:flutter/material.dart';
import 'package:thaicancerfree/constants.dart';

class NewContentWidget extends StatelessWidget {
  NewContentWidget({super.key, required this.size, required this.press, required this.title});

  final Size size;
  final String title;
  VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: size.width * 0.88,
        height: isPhone(context) ?size.height * 0.12 :size.height * 0.15,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [kContentColor2, kContentColor2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(1),
          boxShadow: [
            BoxShadow(
              color: kContentColor2,
              offset: Offset(0, 0),
              blurRadius: 12,
            )
          ],
        ),
        child: Row(
          children: [
            //Expanded(flex: 2, child: Image.asset('assets/images/cancer-2797423_640.png', height: size.height * 0.06,)),
            Expanded(
              flex: 6,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      //color: Colors.white,
                      fontSize: isPhone(context) ? 23 : 35,
                      fontWeight: FontWeight.w500,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 2.2
                        ..color = Colors.black,
                      shadows: [
                        Shadow(
                          //offset: Offset(1.0, 7.0), // position of the shadow
                          //blurRadius: 3.0, // blur effect for the shadow
                          color: Colors.grey, // color of the shadow
                        ),
                      ],
                    ),
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      //color: Colors.white,
                      fontSize: isPhone(context) ? 23 : 35,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(1.0, 7.0), // position of the shadow
                          blurRadius: 3.0, // blur effect for the shadow
                          color: Colors.grey, // color of the shadow
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
