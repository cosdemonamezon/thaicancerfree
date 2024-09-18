import 'package:flutter/material.dart';
import 'package:thaicancerfree/constants.dart';
import 'package:thaicancerfree/home/registerPage.dart';
import 'package:thaicancerfree/home/riskBreastCancer.dart';
import 'package:thaicancerfree/home/widgets/NewContentWidget.dart';
import 'package:thaicancerfree/home/widgets/RiskCancerDialog.dart';
import 'package:thaicancerfree/home/widgets/RiskCancerDialog2.dart';
import 'package:thaicancerfree/home/widgets/RiskCancerDialogTablet.dart';
import 'package:thaicancerfree/home/widgets/RiskCancerDialogTablet2.dart';
import 'package:thaicancerfree/home/widgets/RiskDialog.dart';
import 'package:thaicancerfree/home/widgets/RiskDialogTablet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height * 0.98,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                //kContentColor3,
                // Colors.white,
                // Colors.white,
                // Colors.white,
                // Colors.white,
                // Colors.white,
                kContentColor3,
                kContentColor3,
                kContentColor3,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: isPhone(context) ? 30 : 30,
                bottom: isPhone(context) ? 30 : 30,
                left: isPhone(context) ? 15 : 30,
                right: isPhone(context) ? 15 : 30,
                child: Container(
                    height: size.height * 0.93,
                    width: size.width * 0.88,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: kContentColor2,
                    )),
              ),
              Positioned(
                top: isPhone(context) ? 60 :60,
                bottom: isPhone(context) ? 60 :60,
                left: isPhone(context) ? 40 :60,
                right: isPhone(context) ? 40 :60,
                child: Container(
                    height: size.height * 0.93,
                    width: size.width * 0.88,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                    )),
              ),
              isPhone(context)
                  ? Positioned(
                      top: 107,
                      right: 33,
                      child: Image.asset(
                        'assets/images/file.png',
                        // width: size.width * 0.44,
                        height: size.height * 0.56,
                        fit: BoxFit.fill,
                      ))
                  : Positioned(
                      top: 50,
                      right: 50,
                      child: Image.asset(
                        'assets/images/file.png',
                        // width: size.width * 0.44,
                        height: size.height * 0.68,
                        fit: BoxFit.fill,
                      )),
              Positioned(
                  top: isPhone(context) ? 100 : 140,
                  left: isPhone(context) ? 60 : 120,
                  child: Image.asset(
                    'assets/images/300x.png',
                    //width: size.width * 0.21,
                    height: isPhone(context) ? size.height * 0.12 : size.height * 0.15,
                    fit: BoxFit.fill,
                  )),
              Positioned(
                bottom: isPhone(context) ?295 :420,
                left: 30,
                right: 30,
                child: NewContentWidget(
                  size: size,
                  title: 'ประเมินความเสี่ยงมะเร็งเต้านม\nสำหรับบุคลทั่วไป',
                  press: () async {
                    if (isPhone(context)) {
                      final ok = await showDialog(
                        context: context,
                        builder: (context) => RiskDialog(
                          size: size,
                          pressNo: () {
                            Navigator.pop(context, false);
                          },
                          pressYes: () {
                            Navigator.pop(context, true);
                          },
                        ),
                      );
                      if (ok == true) {
                        if (!mounted) return;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RiskBreastCancer()));
                      }
                    } else {
                      final ok = await showDialog(
                        context: context,
                        builder: (context) => RiskDialogTablet(
                          size: size,
                          pressNo: () {
                            Navigator.pop(context, false);
                          },
                          pressYes: () {
                            Navigator.pop(context, true);
                          },
                        ),
                      );
                      if (ok == true) {
                        if (!mounted) return;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RiskBreastCancer()));
                      }
                    }
                  },
                ),
              ),
              Positioned(
                bottom: isPhone(context) ?115 :150,
                left: 30,
                right: 30,
                child: NewContentWidget(
                  size: size,
                  title: 'สำหรับสตรีอายุตั้งแต่ 40 ปีขึ้นไป\nและมีญาติสายตรงเป็นมะเร็งเต้านม',
                  press: () async {
                    if (isPhone(context)) {
                      final ok = await showDialog(
                        context: context,
                        builder: (context) => RiskCancerDialog(
                          size: size,
                          pressNo: () {
                            Navigator.pop(context, false);
                          },
                          pressYes: () {
                            Navigator.pop(context, true);
                          },
                        ),
                      );
                      if (ok == true) {
                        final ok2 = await showDialog(
                          context: context,
                          builder: (context) => RiskCancerDialog2(
                            size: size,
                            pressNo: () {
                              Navigator.pop(context, false);
                            },
                            pressYes: () {
                              Navigator.pop(context, true);
                            },
                          ),
                        );
                        if (ok2 == true) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                        }
                      }
                    } else {
                      final ok = await showDialog(
                        context: context,
                        builder: (context) => RiskCancerDialogTablet(
                          size: size,
                          pressNo: () {
                            Navigator.pop(context, false);
                          },
                          pressYes: () {
                            Navigator.pop(context, true);
                          },
                        ),
                      );
                      if (ok == true) {
                        final ok2 = await showDialog(
                          context: context,
                          builder: (context) => RiskCancerDialogTablet2(
                            size: size,
                            pressNo: () {
                              Navigator.pop(context, false);
                            },
                            pressYes: () {
                              Navigator.pop(context, true);
                            },
                          ),
                        );
                        if (ok2 == true) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                        }
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: isPhone(context) ? size.height * 0.45998 : size.height * 0.46998, // Custom height
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       colors: [
      //         Colors.white,
      //         Colors.white,
      //         kContentColor3,
      //         Colors.white,
      //         Colors.white,
      //         kContentColor3,
      //         kContentColor3,
      //         kContentColor3,
      //       ],
      //       begin: Alignment.topRight,
      //       end: Alignment.bottomLeft,
      //     ),
      //   ),
      //   child: Column(
      //     children: [
      //       NewContentWidget(
      //         size: size,
      //         title: 'ประมินความเสี่ยงมะเร็งเต้านม\nสำหรับบุคลทั่วไป',
      //         press: () async {
      //           if (isPhone(context)) {
      //             final ok = await showDialog(
      //               context: context,
      //               builder: (context) => RiskDialog(
      //                 size: size,
      //                 pressNo: () {
      //                   Navigator.pop(context, false);
      //                 },
      //                 pressYes: () {
      //                   Navigator.pop(context, true);
      //                 },
      //               ),
      //             );
      //             if (ok == true) {
      //               if (!mounted) return;
      //               Navigator.push(context, MaterialPageRoute(builder: (context) => RiskBreastCancer()));
      //             }
      //           } else {
      //             final ok = await showDialog(
      //               context: context,
      //               builder: (context) => RiskDialogTablet(
      //                 size: size,
      //                 pressNo: () {
      //                   Navigator.pop(context, false);
      //                 },
      //                 pressYes: () {
      //                   Navigator.pop(context, true);
      //                 },
      //               ),
      //             );
      //             if (ok == true) {
      //               if (!mounted) return;
      //               Navigator.push(context, MaterialPageRoute(builder: (context) => RiskBreastCancer()));
      //             }
      //           }
      //         },
      //       ),
      //       SizedBox(
      //         height: size.height * 0.04,
      //       ),
      //       NewContentWidget(
      //         size: size,
      //         title: 'สำหรับสตรีอายุ\nตั้งแต่ 40 ปีขึ้นไปและมี\nญาติสายตรงเป็นมะเร็งเต้านม',
      //         press: () async {
      //           if (isPhone(context)) {
      //             final ok = await showDialog(
      //               context: context,
      //               builder: (context) => RiskCancerDialog(
      //                 size: size,
      //                 pressNo: () {
      //                   Navigator.pop(context, false);
      //                 },
      //                 pressYes: () {
      //                   Navigator.pop(context, true);
      //                 },
      //               ),
      //             );
      //             if (ok == true) {
      //               final ok2 = await showDialog(
      //                 context: context,
      //                 builder: (context) => RiskCancerDialog2(
      //                   size: size,
      //                   pressNo: () {
      //                     Navigator.pop(context, false);
      //                   },
      //                   pressYes: () {
      //                     Navigator.pop(context, true);
      //                   },
      //                 ),
      //               );
      //               if (ok2 == true) {
      //                 Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
      //               }
      //             }
      //           } else {
      //             final ok = await showDialog(
      //               context: context,
      //               builder: (context) => RiskCancerDialogTablet(
      //                 size: size,
      //                 pressNo: () {
      //                   Navigator.pop(context, false);
      //                 },
      //                 pressYes: () {
      //                   Navigator.pop(context, true);
      //                 },
      //               ),
      //             );
      //             if (ok == true) {
      //               final ok2 = await showDialog(
      //                 context: context,
      //                 builder: (context) => RiskCancerDialogTablet2(
      //                   size: size,
      //                   pressNo: () {
      //                     Navigator.pop(context, false);
      //                   },
      //                   pressYes: () {
      //                     Navigator.pop(context, true);
      //                   },
      //                 ),
      //               );
      //               if (ok2 == true) {
      //                 Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
      //               }
      //             }
      //           }
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
