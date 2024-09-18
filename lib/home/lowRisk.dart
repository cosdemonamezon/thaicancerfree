import 'package:flutter/material.dart';
import 'package:thaicancerfree/constants.dart';
import 'package:thaicancerfree/home/firstPage.dart';

class LowRisk extends StatefulWidget {
  const LowRisk({super.key});

  @override
  State<LowRisk> createState() => _LowRiskState();
}

class _LowRiskState extends State<LowRisk> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.10),
        child: Container(
          height: size.height * 0.12,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(5, 5),
                blurRadius: 10,
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: isPhone(context) ? 25 : 35,
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      child: Text(
                        'ความเสี่ยงต่ำ',
                        style: TextStyle(
                          color: kButtonNoColor,
                          fontSize: isPhone(context) ? 25 : 33,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                      width: size.width * 0.05,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // child: AppBar(
        //   centerTitle: true,
        //   title: Text(
        //     'ความเสี่ยงต่ำ',
        //     style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700),
        //   ),
        //   leading: IconButton(
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //       icon: Icon(Icons.arrow_back_outlined)),
        // ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage("assets/images/332211.png"),
            //   fit: BoxFit.fill,
            // ),
            gradient: LinearGradient(
              colors: [kContentColor3, kContentColor3],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.04,
                ),
                Container(
                  width: size.width * 0.98,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 0,
                        spreadRadius: 0,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.02, vertical: size.height * 0.01),
                    child: Column(
                      children: [
                        Text(
                          'ท่านเป็นผู้ที่มีความเสี่ยงต่อการเป็นมะเร็งเต้านมเท่ากับสตรีทั่วไป แนะนำให้ท่านตรวจเต้านมด้วยตัวเองทุกเดือน, ตรวจเต้านมด้วยบุคลากรทางการแพทย์ปีละครั้ง, ทำแมมโมแกรมหากท่านอายุเกิน 40 ปี',
                          style: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 22.5 : 32.5, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Row(
                  children: [
                    Text(
                      '5 สัญญานอันตราย มะเร็งเต้านม',
                      style: TextStyle(color: kContentTextColor, fontSize: isPhone(context) ? 20 : 30, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            '1',
                            style: TextStyle(color: kContentTextColor, fontSize: isPhone(context) ? 18 : 26, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Text(
                            'พบก้อนเนื้อที่เป็นไตแข็งผิดปกติ กลิ้งได้ หรือยึดติดกับเนื้อเยื่อส่วนล่างตรงบริเวนเต้านม',
                            style: TextStyle(color: kContentTextColor, fontSize: isPhone(context) ? 18 : 26, fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            '2',
                            style: TextStyle(color: kContentTextColor, fontSize: isPhone(context) ? 18 : 26, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Text(
                            'มีน้ำเหลืองและเลือดไหลจากหัวนม หรือเป็นแผลผิวหนังหัวนมถลอก',
                            style: TextStyle(color: kContentTextColor, fontSize: isPhone(context) ? 18 : 26, fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            '3',
                            style: TextStyle(color: kContentTextColor, fontSize: isPhone(context) ? 18 : 26, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Text(
                            'หัวนมถูกดึงรั้งจนผิดปกติ',
                            style: TextStyle(color: kContentTextColor, fontSize: isPhone(context) ? 18 : 26, fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            '4',
                            style: TextStyle(color: kContentTextColor, fontSize: isPhone(context) ? 18 : 26, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Text(
                            'ผิวหนังบริเวนเต้านมเปลี่ยนไป ไม่ว่าจะเป็นรอยบุ๋มหรือผิวหนังบวมหนาตึงเหมือนผิวเปลือกส้มหรือเป็นแผล',
                            style: TextStyle(color: kContentTextColor, fontSize: isPhone(context) ? 18 : 26, fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            '5',
                            style: TextStyle(color: kContentTextColor, fontSize: isPhone(context) ? 18 : 26, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Text(
                            'ผิวหนังบริเวนลานหัวนมมีลักษณะที่เปลี่ยนไปจากเดิม เช่น มีผื่นคันที่เป็นๆ หายๆ ขนาดและรูปร่างต่างกันอย่างผิดปกติไม่อยู่ในระดับเดียวกัน',
                            style: TextStyle(color: kContentTextColor, fontSize: isPhone(context) ? 18 : 26, fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.09,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);
                      },
                      child: Container(
                        width: size.width * 0.90,
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
                                  kButtonNoColor,
                                  kButtonNoColor,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'กลับหน้าหลัก',
                                style: TextStyle(color: Colors.white, fontSize: isPhone(context) ? 18 : 28, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () async {Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));},
                    //   child: Container(
                    //     width: size.width * 0.30,
                    //     height: size.height * 0.06,
                    //     decoration: ShapeDecoration(
                    //       shape: RoundedRectangleBorder(),
                    //       color: Colors.transparent,
                    //     ),
                    //     child: Padding(
                    //       padding: EdgeInsets.all(1),
                    //       child: DecoratedBox(
                    //         decoration: ShapeDecoration(
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(10),
                    //           ),
                    //           gradient: LinearGradient(
                    //             colors: [
                    //               kContentColor1,
                    //               kContentColor2,
                    //             ],
                    //             begin: Alignment.topLeft,
                    //             end: Alignment.bottomRight,
                    //           ),
                    //         ),
                    //         child: Center(
                    //           child: Text(
                    //             'ลงทะเบียน',
                    //             style: TextStyle(color: kContentTextColor, fontSize: 18, fontWeight: FontWeight.bold),
                    //             textAlign: TextAlign.center,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
