import 'package:flutter/material.dart';
import 'package:thaicancerfree/constants.dart';

class ShowContentWidget extends StatelessWidget {
  ShowContentWidget({super.key, required this.size, required this.mounted, required this.press, required this.title});

  final Size size;
  final bool mounted;
  final String title;
  VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: double.infinity,
        height: size.height * 0.2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [kContentColor1, kContentColor2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(4, 8),
              blurRadius: 12,
            )
          ],
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: isPhone(context) ? 25 : 35,
              fontWeight: FontWeight.w500,
              shadows: [
                Shadow(
                  offset: Offset(1.0, 5.0), // position of the shadow
                  blurRadius: 3.0, // blur effect for the shadow
                  color: Colors.grey, // color of the shadow
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
