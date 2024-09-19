import 'package:flutter/material.dart';
import 'package:thaicancerfree/constants.dart';

class SuccessDialogTablet1 extends StatelessWidget {
  const SuccessDialogTablet1({
    super.key,
    required this.pressYes,
    required this.title,
    required this.page
  });

  final VoidCallback pressYes;
  final String title;
  final int page;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.50,
      height: size.height * 0.17,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Container(
                width: size.width * 0.50,
                height: size.height * 0.17,
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
                        "กล่องข้อความ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: isPhone(context) ? 19.55 : 28.55,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: page == 0 ? size.height * 0.02 :size.height * 0.01,
                          ),
                          Text(
                            title,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: isPhone(context) ? 18 : 28,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                              fontFamily: 'Prompt',
                            ),
                            textAlign: TextAlign.center,
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
              width: size.width * 0.50,
              height: size.height * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: pressYes,
                    child: Container(
                      width: size.width * 0.12,
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
                          decoration: TextDecoration.none,
                          fontFamily: 'Prompt',
                        ),
                        textAlign: TextAlign.start,
                      )),
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
