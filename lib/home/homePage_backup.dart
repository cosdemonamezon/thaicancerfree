import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thaicancerfree/constants.dart';
import 'package:thaicancerfree/home/notiPage.dart';
import 'package:thaicancerfree/home/registerPage.dart';
import 'package:thaicancerfree/home/riskBreastCancer.dart';
import 'package:thaicancerfree/home/widgets/RiskCancerDialog.dart';
import 'package:thaicancerfree/home/widgets/RiskCancerDialog2.dart';
import 'package:thaicancerfree/home/widgets/RiskCancerDialogTablet.dart';
import 'package:thaicancerfree/home/widgets/RiskCancerDialogTablet2.dart';
import 'package:thaicancerfree/home/widgets/RiskDialog.dart';
import 'package:thaicancerfree/home/widgets/RiskDialogTablet.dart';
import 'package:thaicancerfree/home/widgets/ShowContentWidget.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.15),
        child: Container(
          height: size.height * 0.12,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // Color.fromARGB(255, 236, 39, 227),
                // Color.fromARGB(255, 229, 121, 233),
                Colors.white,
                Colors.white
              ],
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
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: isPhone(context) ? 70.0 : 100,
                              height: isPhone(context) ? 70.0 : 100,
                              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                            ),
                            Positioned(
                              top: isPhone(context) ? 10 : 5,
                              bottom: isPhone(context) ? 10 : 5,
                              left: isPhone(context) ? 10 : 5,
                              right: isPhone(context) ? 10 : 5,
                              child: Container(
                                width: isPhone(context) ? 50.0 : 100,
                                height: isPhone(context) ? 50.0 : 100,
                                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                                child: Image.asset(
                                  'assets/images/300x.png',
                                  fit: BoxFit.fill,
                                  //scale: 1,
                                ),
                              ),
                            )
                          ],
                        ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        //   child: CircleAvatar(
                        //     radius: 30,
                        //     // backgroundColor: Colors.blueAccent,
                        //     backgroundImage: AssetImage('assets/images/300x.png'),
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                          child: Text(
                            'THAI CANCER FREE',
                            style: TextStyle(
                              color: kButtonNoColor,
                              fontSize: isPhone(context) ? 25 : 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NotiPage()));
                        },
                        icon: Icon(
                          Icons.notifications,
                          color: kButtonNoColor,
                          size: isPhone(context) ? 30.0 : 50.0,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
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
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                'เลือกประเภทแบบประเมิน',
                style: TextStyle(
                  color: kButtonNoColor,
                  fontSize: isPhone(context) ? 33 : 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isPhone(context) ? size.width * 0.04 : size.width * 0.08),
                child: ShowContentWidget(
                  size: size,
                  mounted: mounted,
                  title: 'ประมินความเสี่ยงมะเร็งเต้านม\nสำหรับบุคลทั่วไป',
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
              SizedBox(
                height: size.height * 0.06,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isPhone(context) ? size.width * 0.04 : size.width * 0.08),
                child: ShowContentWidget(
                  size: size,
                  mounted: mounted,
                  title: 'สำหรับสตรีอายุ\nตั้งแต่ 40 ปีขึ้นไปและมี\nญาติสายตรงเป็นมะเร็งเต้านม',
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
              SizedBox(
                height: size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
