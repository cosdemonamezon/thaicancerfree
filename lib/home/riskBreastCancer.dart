import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thaicancerfree/constants.dart';
import 'package:thaicancerfree/extension/formattedMessage.dart';
import 'package:thaicancerfree/home/highRisk.dart';
import 'package:thaicancerfree/home/lowRisk.dart';
import 'package:thaicancerfree/home/services/homeApi.dart';
import 'package:thaicancerfree/home/widgets/BodyQuestionWidget1.dart';
import 'package:thaicancerfree/home/widgets/HeaderQuestionWidget.dart';
import 'package:thaicancerfree/home/widgets/NewSuccesDialog.dart';
import 'package:thaicancerfree/home/widgets/SuccessDialog.dart';
import 'package:thaicancerfree/home/widgets/SuccessDialogTablet.dart';
import 'package:thaicancerfree/home/widgets/SuccessDialogTablet1.dart';
import 'package:thaicancerfree/models/estimates.dart';
import 'package:thaicancerfree/models/evaluation.dart';
import 'package:thaicancerfree/widgets/LoadingDialog.dart';

class RiskBreastCancer extends StatefulWidget {
  const RiskBreastCancer({super.key});

  @override
  State<RiskBreastCancer> createState() => _RiskBreastCancerState();
}

class _RiskBreastCancerState extends State<RiskBreastCancer> {
  List<int> selectedQuestion1 = [0, 1, 2];
  List<int> selectedQuestion2 = [0, 1, 2];

  List<List<int>> selectedOption1 = [];
  List<List<int>> selectedOption2 = [];

  List<int> cerrentQuestion1 = [];
  List<int> cerrentQuestion2 = [];

  List<Evaluation> evaluations = [];
  List<Estimates> estimates = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getListEvaluation();
    });
  }

  //ดึงข้อมูล แบบประเมิน
  Future<void> getListEvaluation() async {
    try {
      LoadingDialog.open(context);
      final _evaluations = await HomeApi.getEstimated();
      if (_evaluations.isNotEmpty) {
        setState(() {
          evaluations = _evaluations;
          for (var i = 0; i < _evaluations.length; i++) {
            selectedOption1.add(selectedQuestion1);
            cerrentQuestion1.add(selectedQuestion1[2]);            
          }
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
            title: '${e.getMessage}',
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
            title: '${e.getMessage}',
            pressYes: () {
              Navigator.pop(context, true);
            },
          ),
        );
      }
    }
  }

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
              colors: [kContentColor3, kContentColor3],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(5, 0),
                blurRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
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
                        'แบบประเมินความเสี่ยงมะเร็งเต้านม',
                        style: TextStyle(
                          color: kButtonNoColor,
                          fontSize: isPhone(context) ? 20 : 33,
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
      ),
      body: SingleChildScrollView(
        child: Container(
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
                Container(
                  width: size.width * 0.98,
                  height: isPhone(context) ? size.height * 1.58 : size.height * 1.44,
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
                        //color: Colors.black26,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        HeaderQuestionWidget(size: size),
                        Divider(),
                        evaluations.isEmpty
                            ? SizedBox()
                            : Column(
                                children: List.generate(
                                  evaluations.length,
                                  (index) => Padding(
                                    padding: EdgeInsets.symmetric(vertical: size.height * 0.005),
                                    child: BodyQuestionWidget1(
                                      index: index,
                                      size: size,
                                      detail: evaluations[index].detail,
                                      groupValue1: evaluations[index].groupValue,
                                      groupValue2: evaluations[index].groupValue,
                                      selectValue1: selectedOption1[index][0],
                                      selectValue2: selectedOption1[index][1],
                                      onChanged1: (value) {
                                        setState(() {
                                          cerrentQuestion1[index] = value!;
                                          evaluations[index].groupValue = value;
                                          evaluations[index].selected = value;
                                        });
                                      },
                                      onChanged2: (value1) {
                                        setState(() {
                                          cerrentQuestion1[index] = value1!;
                                          evaluations[index].groupValue = value1;
                                          evaluations[index].selected = value1;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        GestureDetector(
                          onTap: () async {
                            final sumQuestion3 = cerrentQuestion1.where((element) => [2].contains(element)).toList();
                            //final sumQuestion4 = cerrentQuestion2.where((element) => [2].contains(element)).toList();
                            if (sumQuestion3.length == evaluations.length) {
                              if (isPhone(context)) {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) => SuccessDialog(
                                    title: 'คุณยังไม่ได้ทำแบบประเมิน',
                                    pressYes: () {
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
                                    title: 'คุณยังไม่ได้ทำแบบประเมิน',
                                    pressYes: () {
                                      Navigator.pop(context, true);
                                    },
                                  ),
                                );
                              }
                            } else {
                              if (isPhone(context)) {
                                try {
                                  LoadingDialog.open(context);
                                  List<Evaluation> evaluations1 = [];
                                  List<Evaluation> evaluations2 = [];
                                  setState(() {
                                    estimates.clear();
                                    for (var i = 0; i < evaluations.length; i++) {
                                      final _estimates = Estimates(evaluations[i].id, evaluations[i].selected == 0 ? "T" : "F");
                                      estimates.add(_estimates);
                                    }
                                    for (var i = 0; i < evaluations.length; i++) {
                                      if (evaluations[i].No == 1 || evaluations[i].No == 2 || evaluations[i].No == 3 || evaluations[i].No == 4 || evaluations[i].No == 5) {
                                        evaluations1.add(evaluations[i]);
                                      } else {
                                        evaluations2.add(evaluations[i]);
                                      }
                                    }
                                  });
                                  final sumQuestion1 = evaluations1.where((element) => [0].contains(element.selected) || [1].contains(element.selected)).toList();
                                  final sumQuestion2 = evaluations2.where((element) => [0].contains(element.selected) || [1].contains(element.selected)).toList();
                                  if (sumQuestion1.isNotEmpty && sumQuestion2.isNotEmpty) {
                                    if (sumQuestion1.length < 5 || sumQuestion2.length < 9) {
                                      LoadingDialog.close(context);
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) => SuccessDialog(
                                          title: 'คุณทำแบบทดสอบไม่ครบ',
                                          pressYes: () {
                                            Navigator.pop(context, true);
                                          },
                                        ),
                                      );                                      
                                    } else {
                                      //inspect(estimates);
                                      final _takeAssessment = await HomeApi.takeAssessment(estimates: estimates);
                                      LoadingDialog.close(context);
                                      if (_takeAssessment != null) {
                                        final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
                                        final SharedPreferences prefs = await _prefs;
                                        await prefs.setString('code', _takeAssessment["code"]);
                                        // final ok2 = await showDialog(
                                        //   context: context,
                                        //   barrierDismissible: false,
                                        //   builder: (context) => SuccessDialog(
                                        //     title: '$_takeAssessment',
                                        //     pressYes: () {
                                        //       Navigator.pop(context, true);
                                        //     },
                                        //   ),
                                        // );
                                        final ok2 = await showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) => NewScessDialog(
                                            title: 'ทำแบบทดสอบสำเร็จ',
                                            pressYes: () async {
                                              Navigator.pop(context, true);
                                            },
                                          ),
                                        );
                                        if (ok2 == true) {
                                          List<Evaluation> evaluations1 = [];
                                          List<Evaluation> evaluations2 = [];
                                          setState(() {
                                            for (var i = 0; i < evaluations.length; i++) {
                                              if (evaluations[i].No == 1 || evaluations[i].No == 2 || evaluations[i].No == 3 || evaluations[i].No == 4 || evaluations[i].No == 5) {
                                                evaluations1.add(evaluations[i]);
                                              } else {
                                                evaluations2.add(evaluations[i]);
                                              }
                                            }
                                          });
                                          final sumQuestion1 = evaluations1.where((element) => [0].contains(element.selected)).toList();
                                          final sumQuestion2 = evaluations2.where((element) => [0].contains(element.selected)).toList();

                                          if (sumQuestion1.isNotEmpty || sumQuestion2.length > 1) {
                                            //inspect(evaluations1);
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => HighRisk()));
                                          } else {
                                            //inspect(evaluations2);
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => LowRisk()));
                                          }
                                        }
                                      } else {}
                                    }
                                  } else {
                                    LoadingDialog.close(context);
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) => SuccessDialog(
                                        title: 'คุณทำแบบทดสอบไม่ครบ',
                                        pressYes: () {
                                          Navigator.pop(context, true);
                                        },
                                      ),
                                    );
                                  }
                                } on Exception catch (e) {
                                  if (!mounted) return;
                                  LoadingDialog.close(context);
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => SuccessDialog(
                                      title: '${e.getMessage}',
                                      pressYes: () {
                                        Navigator.pop(context, true);
                                      },
                                    ),
                                  );
                                }
                              } else {
                                try {
                                  LoadingDialog.open(context);
                                  List<Evaluation> evaluations1 = [];
                                  List<Evaluation> evaluations2 = [];
                                  setState(() {
                                    estimates.clear();
                                    for (var i = 0; i < evaluations.length; i++) {
                                      final _estimates = Estimates(evaluations[i].id, evaluations[i].selected == 0 ? "T" : "F");
                                      estimates.add(_estimates);
                                    }
                                    for (var i = 0; i < evaluations.length; i++) {
                                      if (evaluations[i].No == 1 || evaluations[i].No == 2 || evaluations[i].No == 3 || evaluations[i].No == 4 || evaluations[i].No == 5) {
                                        evaluations1.add(evaluations[i]);
                                      } else {
                                        evaluations2.add(evaluations[i]);
                                      }
                                    }
                                  });
                                  final sumQuestion1 = evaluations1.where((element) => [0].contains(element.selected) || [1].contains(element.selected)).toList();
                                  final sumQuestion2 = evaluations2.where((element) => [0].contains(element.selected) || [1].contains(element.selected)).toList();

                                  if (sumQuestion1.isNotEmpty && sumQuestion2.isNotEmpty) {
                                    if (sumQuestion2.length < 9 || sumQuestion1.length < 5) {
                                      LoadingDialog.close(context);
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) => SuccessDialogTablet1(
                                          page: 0,
                                          title: 'คุณทำแบบทดสอบไม่ครบ',
                                          pressYes: () {
                                            Navigator.pop(context, true);
                                          },
                                        ),
                                      );
                                    } else {
                                      //inspect(estimates);
                                      final _takeAssessment = await HomeApi.takeAssessment(estimates: estimates);
                                      LoadingDialog.close(context);

                                      if (_takeAssessment != null) {
                                        final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
                                        final SharedPreferences prefs = await _prefs;
                                        await prefs.setString('code', _takeAssessment["code"]);
                                        // final ok2 = await showDialog(
                                        //   context: context,
                                        //   barrierDismissible: false,
                                        //   builder: (context) => SuccessDialogTablet(
                                        //     page: 0,
                                        //     title: 'ดำเนินการสำเร็จ',
                                        //     pressYes: () {
                                        //       Navigator.pop(context, true);
                                        //     },
                                        //   ),
                                        // );
                                        final ok2 = await showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) => NewScessDialog(
                                            title: 'ทำแบบทดสอบสำเร็จ',
                                            pressYes: () async {
                                              Navigator.pop(context, true);
                                            },
                                          ),
                                        );
                                        if (ok2 == true) {
                                          List<Evaluation> evaluations1 = [];
                                          List<Evaluation> evaluations2 = [];
                                          setState(() {
                                            for (var i = 0; i < evaluations.length; i++) {
                                              if (evaluations[i].No == 1 || evaluations[i].No == 2 || evaluations[i].No == 3 || evaluations[i].No == 4 || evaluations[i].No == 5) {
                                                evaluations1.add(evaluations[i]);
                                              } else {
                                                evaluations2.add(evaluations[i]);
                                              }
                                            }
                                          });
                                          final sumQuestion1 = evaluations1.where((element) => [0].contains(element.selected)).toList();
                                          final sumQuestion2 = evaluations2.where((element) => [0].contains(element.selected)).toList();

                                          if (sumQuestion1.isNotEmpty || sumQuestion2.length > 1) {
                                            //inspect(evaluations1);
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => HighRisk()));
                                          } else {
                                            //inspect(evaluations2);
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => LowRisk()));
                                          }
                                        }
                                      } else {}
                                    }
                                  } else {
                                    LoadingDialog.close(context);
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) => SuccessDialogTablet1(
                                        page: 0,
                                        title: 'คุณทำแบบทดสอบไม่ครบ',
                                        pressYes: () {
                                          Navigator.pop(context, true);
                                        },
                                      ),
                                    );
                                    if (sumQuestion1.isNotEmpty) {
                                      for (var i = 0; i < evaluations.length; i++) {
                                        if (evaluations[i].selected == 2) {
                                          print(evaluations[i].selected);
                                          break;
                                        }
                                      }
                                    }
                                  }
                                } on Exception catch (e) {
                                  if (!mounted) return;
                                  LoadingDialog.close(context);
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => SuccessDialogTablet1(
                                      page: 0,
                                      title: '${e.getMessage}',
                                      pressYes: () {
                                        Navigator.pop(context, true);
                                      },
                                    ),
                                  );
                                }
                              }
                            }
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
                                    colors: [kContentColor1, kContentColor2],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'ตกลง',
                                    style: TextStyle(color: kContentTextColor, fontSize: isPhone(context) ? 18 : 28, fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context, false);
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
                                    'กลับ',
                                    style: TextStyle(color: Colors.white, fontSize: isPhone(context) ? 18 : 28, fontWeight: FontWeight.bold),
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
                ),
                SizedBox(
                  height: isPhone(context) ? size.height * 0.02 : size.height * 0.04,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
