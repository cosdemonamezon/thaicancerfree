import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:thaicancerfree/constants.dart';
import 'package:thaicancerfree/home/policyPage.dart';
import 'package:thaicancerfree/home/registerPage.dart';
import 'package:thaicancerfree/home/riskBreastCancer.dart';
import 'package:thaicancerfree/home/services/homeApi.dart';
import 'package:thaicancerfree/home/widgets/NewContentWidget.dart';
import 'package:thaicancerfree/home/widgets/RiskCancerDialog.dart';
import 'package:thaicancerfree/home/widgets/RiskCancerDialog2.dart';
import 'package:thaicancerfree/home/widgets/RiskCancerDialogTablet.dart';
import 'package:thaicancerfree/home/widgets/RiskCancerDialogTablet2.dart';
import 'package:thaicancerfree/home/widgets/RiskDialog.dart';
import 'package:thaicancerfree/home/widgets/RiskDialogTablet.dart';
import 'package:thaicancerfree/home/widgets/SuccessDialog.dart';
import 'package:thaicancerfree/home/widgets/SuccessDialogTablet.dart';
import 'package:thaicancerfree/home/widgets/SuccessDialogTablet1.dart';
import 'package:thaicancerfree/widgets/LoadingDialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;
  bool checkOpendialog = false;
  int views = 0;
  RefreshController refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getViews();
    });
    initConnectivity();

    connectivitySubscription = connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  @override
  void dispose() {
    connectivitySubscription.cancel();
    super.dispose();
  }

  //ดึงข้อมูล แบบประเมิน
  Future<void> getViews() async {
    try {
      LoadingDialog.open(context);
      final _view = await HomeApi.getViews();
      if (_view != null) {
        setState(() {
          views = _view['views'];
        });
      }
      if (!mounted) return;
      LoadingDialog.close(context);
    } on Exception catch (e) {
      if (!mounted) return;
      LoadingDialog.close(context);
      if (isPhone(context)) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => SuccessDialog(
            title: '${e}',
            pressYes: () {
              Navigator.pop(context, true);
            },
          ),
        );
      } else {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => SuccessDialogTablet(
            page: 0,
            title: '${e}',
            pressYes: () {
              Navigator.pop(context, true);
            },
          ),
        );
      }
    }
  }

  void onRefresh() async {
    // monitor network fetch
    //await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    getViews();
    refreshController.refreshCompleted();
    setState(() {});
  }

  void onLoading() async {
    // monitor network fetch
    //await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    //items.add((items.length+1).toString());
    if (!mounted) return;
    //getViews();
    refreshController.loadComplete();
    setState(() {});
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      //developer.log('Couldn\'t check connectivity status', error: e);
      print('check connectivity status error: $e');
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return updateConnectionStatus(result);
  }

  void checkNoInternet() {
    if (connectionStatus[0] == ConnectivityResult.none) {
      if (checkOpendialog == false) {
        setState(() {
          checkOpendialog = true;
        });
        if (isPhone(context)) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => SuccessDialog(
              title: 'ไม่ได้เชื่อมต่ออินเทอร์เน็ต',
              pressYes: () {
                setState(() {
                  checkOpendialog = false;
                });
                Navigator.pop(context, true);
              },
            ),
          );
        } else {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => SuccessDialogTablet1(
              page: 0,
              title: 'คุณไม่ได้เชื่อมต่ออินเทอร์เน็ต',
              pressYes: () {
                setState(() {
                  checkOpendialog = false;
                });
                Navigator.pop(context, true);
              },
            ),
          );
        }
      } else {}
    }
  }

  Future<void> updateConnectionStatus(List<ConnectivityResult> result) async {
    setState(() {
      connectionStatus = result;
    });
    // ignore: avoid_print
    print('Connectivity changed: $connectionStatus');
    checkNoInternet();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            Widget? body;
            if (mode == LoadStatus.idle) {
              body = Text("");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("");
            } else {
              body = Text("");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: refreshController,
        onRefresh: onRefresh,
        onLoading: onLoading,
        child: SingleChildScrollView(
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
                  top: isPhone(context) ? 60 : 60,
                  bottom: isPhone(context) ? 60 : 60,
                  left: isPhone(context) ? 40 : 60,
                  right: isPhone(context) ? 40 : 60,
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
                        top: 125,
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
                  bottom: isPhone(context) ? 275 : 420,
                  left: 30,
                  right: 30,
                  child: NewContentWidget(
                    size: size,
                    title: 'ประเมินความเสี่ยงมะเร็งเต้านม\nสำหรับบุคลทั่วไป',
                    press: () async {
                      if (connectionStatus[0] == ConnectivityResult.none) {
                        checkNoInternet();
                      } else {
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
                      }
                    },
                  ),
                ),
                Positioned(
                  bottom: isPhone(context) ? 126 : 150,
                  left: 30,
                  right: 30,
                  child: NewContentWidget(
                    size: size,
                    title: 'สำหรับสตรีอายุตั้งแต่ 40 ปีขึ้นไป\nและมีญาติสายตรงเป็นมะเร็งเต้านม',
                    press: () async {
                      if (connectionStatus[0] == ConnectivityResult.none) {
                        checkNoInternet();
                      } else {
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
                      }
                    },
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.08,
                  right: size.width * 0.04,
                  left: size.width * 0.04,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PolicyPage()));
                    },
                    child: Center(
                        child: Text(
                      'นโยบายความเป็นส่วนตัว',
                      style: TextStyle(color: kButtonNoColor, fontWeight: FontWeight.bold, fontSize: isPhone(context) ? 18 : 25, decoration: TextDecoration.underline, decorationThickness: 2),
                    )),
                  ),
                ),
                Positioned(
                  bottom: isPhone(context) ? size.height * 0.0095 : size.height * 0.009,
                  left: isPhone(context) ? size.width * 0.02 : size.height * 0.04,
                  child: Stack(
                    children: [
                      // Text(
                      //   'จำนวนผู้ใช้งานปัจจุบัน 100 คน',
                      //   style: TextStyle(
                      //     fontSize: isPhone(context) ? 15 : 20,
                      //     fontWeight: FontWeight.w500,
                      //     foreground: Paint()
                      //       ..style = PaintingStyle.stroke
                      //       ..strokeWidth = 2.2
                      //       ..color = Colors.black,
                      //   ),
                      // ),
                      Text(
                        'จำนวนผู้ใช้งานปัจจุบัน ${views} คน',
                        style: TextStyle(
                          fontSize: isPhone(context) ? 15 : 20,
                          fontWeight: FontWeight.w500,
                          color: kButtonNoColor,
                          shadows: [
                            Shadow(
                              offset: Offset(1.0, 1.0), // position of the shadow
                              blurRadius: 0.0, // blur effect for the shadow
                              color: Colors.grey, // color of the shadow
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Positioned(
                //   bottom: isPhone(context) ? size.height * 0.015 : size.height * 0.025,
                //   right: isPhone(context) ? size.width * 0.02 : size.height * 0.04,
                //   child: FloatingActionButton.extended(
                //     backgroundColor: kContentColor2,
                //     onPressed: () {},
                //     label: Stack(
                //       children: [
                //         Text(
                //           'จำนวนผู้ใช้งานปัจจุบัน 100 คน',
                //           style: TextStyle(
                //             fontSize: isPhone(context) ? 15 : 20,
                //             fontWeight: FontWeight.w500,
                //             foreground: Paint()
                //               ..style = PaintingStyle.stroke
                //               ..strokeWidth = 2.2
                //               ..color = Colors.black,
                //           ),
                //         ),
                //         Text(
                //           'จำนวนผู้ใช้งานปัจจุบัน 100 คน',
                //           style: TextStyle(
                //             fontSize: isPhone(context) ? 15 : 20,
                //             fontWeight: FontWeight.w500,
                //             color: Colors.white,
                //             shadows: [
                //               Shadow(
                //                 offset: Offset(1.0, 1.0), // position of the shadow
                //                 blurRadius: 1.0, // blur effect for the shadow
                //                 color: Colors.grey, // color of the shadow
                //               ),
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //     // icon: Icon(
                //     //   Icons.person_2,
                //     //   color: kButtonNoColor,
                //     //   size: isPhone(context) ? 35 : 40,
                //     // ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     // เพิ่มการดำเนินการหลักของคุณที่นี่
      //   },
      //   label: Text('100'),
      //   icon: Icon(Icons.person_2),
      //   backgroundColor: Colors.blue,
      // ),
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
