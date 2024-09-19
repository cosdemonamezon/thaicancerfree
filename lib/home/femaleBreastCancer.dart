import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thaicancerfree/constants.dart';
import 'package:thaicancerfree/home/firstPage.dart';
import 'package:thaicancerfree/home/services/homeApi.dart';
import 'package:thaicancerfree/home/widgets/NewSuccesDialog.dart';
import 'package:thaicancerfree/home/widgets/SuccessDialog.dart';
import 'package:thaicancerfree/home/widgets/SuccessDialogTablet.dart';
import 'package:thaicancerfree/models/district.dart';
import 'package:thaicancerfree/models/hospital.dart';
import 'dart:convert' as convert;

import 'package:thaicancerfree/models/provinces.dart';
import 'package:thaicancerfree/widgets/LoadingDialog.dart';

class FemaleBreastCancer extends StatefulWidget {
  FemaleBreastCancer(
      {super.key,
      required this.address,
      required this.age,
      required this.email,
      required this.fname,
      required this.idcard,
      required this.lname,
      required this.phone,
      required this.selecteProvinces,
      required this.sex});

  String fname;
  String lname;
  String idcard;
  String age;
  String sex;
  String email;
  String phone;
  String address;
  String selecteProvinces;

  @override
  State<FemaleBreastCancer> createState() => _FemaleBreastCancerState();
}

class _FemaleBreastCancerState extends State<FemaleBreastCancer> {
  District? selectedDistrict;
  Provinces? selectedProvince;
  Hospital? selectedHospitals;
  String? selecteProvince;
  String? selectedHospital;

  List<District> districts = [];
  List<Provinces> provinces = [];
  List<Hospital> hospitals = [];

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getListKhets();
    });
  }

  //ดึงข้อมูล แบบประเมิน
  Future<void> getListKhets() async {
    try {
      LoadingDialog.open(context);
      final _districts = await HomeApi.getListKhet();
      if (_districts.isNotEmpty) {
        setState(() {
          districts = _districts;
          selectedDistrict = districts[0];
          provinces = districts[0].provinces!;
          selectedProvince = districts[0].provinces![0];
          hospitals = districts[0].provinces![0].hospitals!;
          selectedHospitals = districts[0].provinces![0].hospitals![0];
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
                        'สถานพยาบาล',
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
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height * 0.94,
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
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              child: Column(
                children: [
                  // SizedBox(
                  //   height: size.height * 0.04,
                  // ),
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
                          //color: Colors.black26,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Image.asset(
                            'assets/images/images.png',
                            //width: size.width * 0.21,
                            height: size.height * 0.15,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            'เลือกสถานพยาบาลที่ท่านสะดวกรับบริการ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: isPhone(context) ? 24 : 34,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                            child: Row(
                              children: [
                                Text(
                                  'เขต',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: isPhone(context) ? 20 : 30,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 8,
                                child: districts.isNotEmpty
                                    ? Material(
                                        elevation: 5,
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        child: Container(
                                          height: size.height * 0.08,
                                          width: size.width * 0.68,
                                          decoration: BoxDecoration(
                                            color: kBackgroundColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          child: Center(
                                            child: DropdownButtonFormField2<District>(
                                              isExpanded: true,
                                              decoration: InputDecoration(
                                                // Add Horizontal padding using menuItemStyleData.padding so it matches
                                                // the menu padding when button's width is not specified.
                                                contentPadding: EdgeInsets.symmetric(vertical: 16),
                                                //border: InputBorder.none,
                                                //enabledBorder: InputBorder.none,
                                                //focusedBorder: InputBorder.none,
                                                fillColor: kBackgroundColor,
                                                filled: true,
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                  borderSide: BorderSide.none,
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                  borderSide: BorderSide.none,
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                              value: selectedDistrict,
                                              hint: Text(
                                                'เลือกเขต',
                                                style: TextStyle(fontSize: isPhone(context) ? 20 : 30),
                                              ),
                                              items: districts
                                                  .map((item) => DropdownMenuItem<District>(
                                                        value: item,
                                                        child: Text(
                                                          item.name,
                                                          style: TextStyle(
                                                            fontSize: isPhone(context) ? 20 : 30,
                                                          ),
                                                        ),
                                                      ))
                                                  .toList(),
                                              // validator: (value) {
                                              //   if (value == null) {
                                              //     return 'โปรดเลือกเขต.';
                                              //   }
                                              //   return null;
                                              // },
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedDistrict = value;
                                                  provinces = selectedDistrict!.provinces!;
                                                  if (provinces.isNotEmpty) {
                                                    selectedProvince = selectedDistrict!.provinces![0];
                                                  } else {
                                                    selectedProvince = null;
                                                  }
                                                  hospitals = selectedProvince!.hospitals!;
                                                  if (hospitals.isNotEmpty) {
                                                    selectedHospitals = selectedProvince!.hospitals![0];
                                                  } else {
                                                    selectedHospitals = null;
                                                  }
                                                });
                                              },
                                              onSaved: (value) {
                                                // selectedDistrict = value.toString();
                                                // setState(() {
                                                //   if (selectedDistrict == 'เขตสุขภาพที่ 1') {
                                                //     province = healtProvinced[0];
                                                //     selectedProvince = healtProvinced[0][0];
                                                //   }
                                                // });
                                              },
                                              buttonStyleData: ButtonStyleData(
                                                padding: EdgeInsets.only(right: 8),
                                              ),
                                              iconStyleData: IconStyleData(
                                                icon: Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.black45,
                                                ),
                                                iconSize: isPhone(context) ? 24 : 54,
                                              ),
                                              dropdownStyleData: DropdownStyleData(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                              ),
                                              menuItemStyleData: MenuItemStyleData(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 16,
                                                ),
                                                height: size.height * 0.06,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          provinces.isNotEmpty
                              ? Padding(
                                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                                  child: Row(
                                    children: [
                                      Text(
                                        'จังหวัด',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: isPhone(context) ? 20 : 30,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 8,
                                child: provinces.isNotEmpty
                                    ? Material(
                                        elevation: 5,
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        child: Container(
                                          height: size.height * 0.08,
                                          width: size.width * 0.68,
                                          decoration: BoxDecoration(
                                            color: kBackgroundColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          child: Center(
                                            child: DropdownButtonFormField2<Provinces>(
                                              isExpanded: true,
                                              decoration: InputDecoration(
                                                // Add Horizontal padding using menuItemStyleData.padding so it matches
                                                // the menu padding when button's width is not specified.
                                                contentPadding: EdgeInsets.symmetric(vertical: 16),
                                                fillColor: kBackgroundColor,
                                                filled: true,
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                  borderSide: BorderSide.none,
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                  borderSide: BorderSide.none,
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                              value: selectedProvince,
                                              hint: Text(
                                                'เลือกจังหวัด',
                                                style: TextStyle(fontSize: isPhone(context) ? 20 : 30),
                                              ),
                                              items: provinces
                                                  .map((items) => DropdownMenuItem<Provinces>(
                                                        value: items,
                                                        child: Text(
                                                          items.name,
                                                          style: TextStyle(
                                                            fontSize: isPhone(context) ? 20 : 30,
                                                          ),
                                                        ),
                                                      ))
                                                  .toList(),
                                              validator: (value) {
                                                if (value == null) {
                                                  return 'โปรดเลือกจังหวัด.';
                                                }
                                                return null;
                                              },
                                              onChanged: (value) {
                                                //Do something when selected item is changed.
                                                setState(() {
                                                  selectedProvince = value;
                                                  hospitals = selectedProvince!.hospitals!;
                                                  if (hospitals.isNotEmpty) {
                                                    selectedHospitals = selectedProvince!.hospitals![0];
                                                  } else {
                                                    selectedHospitals = null;
                                                  }
                                                });
                                                //readHospitalJson(name: selecteProvince!);
                                              },
                                              onSaved: (value) {
                                                // selectedProvince = value.toString();
                                              },
                                              buttonStyleData: ButtonStyleData(
                                                padding: EdgeInsets.only(right: 8),
                                              ),
                                              iconStyleData: IconStyleData(
                                                icon: Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.black45,
                                                ),
                                                iconSize: isPhone(context) ? 24 : 54,
                                              ),
                                              dropdownStyleData: DropdownStyleData(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                              ),
                                              menuItemStyleData: MenuItemStyleData(
                                                padding: EdgeInsets.symmetric(horizontal: 16),
                                                height: size.height * 0.06,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          hospitals.isNotEmpty
                              ? Padding(
                                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                                  child: Row(
                                    children: [
                                      Text(
                                        'โรงพยาบาล',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: isPhone(context) ? 20 : 30,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : SizedBox(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 8,
                                child: hospitals.isNotEmpty
                                    ? Material(
                                        elevation: 5,
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        child: Container(
                                          height: size.height * 0.08,
                                          width: size.width * 0.68,
                                          decoration: BoxDecoration(
                                            color: kBackgroundColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          child: Center(
                                            child: DropdownButtonFormField2<Hospital>(
                                              isExpanded: true,
                                              decoration: InputDecoration(
                                                // Add Horizontal padding using menuItemStyleData.padding so it matches
                                                // the menu padding when button's width is not specified.
                                                contentPadding: EdgeInsets.symmetric(vertical: 16),
                                                fillColor: kBackgroundColor,
                                                filled: true,
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                  borderSide: BorderSide.none,
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                  borderSide: BorderSide.none,
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                              value: selectedHospitals,
                                              hint: Text(
                                                'เลือกโรงพยาบาล',
                                                style: TextStyle(fontSize: isPhone(context) ? 20 : 30),
                                              ),
                                              items: hospitals
                                                  .map((item) => DropdownMenuItem<Hospital>(
                                                        value: item,
                                                        child: Text(
                                                          item.name,
                                                          style: TextStyle(
                                                            fontSize: isPhone(context) ? 20 : 30,
                                                          ),
                                                        ),
                                                      ))
                                                  .toList(),
                                              validator: (value) {
                                                if (value == null) {
                                                  return 'โปรดเลือกโรงพยาบาล.';
                                                }
                                                return null;
                                              },
                                              onChanged: (value) {
                                                //Do something when selected item is changed.
                                              },
                                              onSaved: (value) {
                                                setState(() {
                                                  selectedHospitals = value;
                                                });
                                              },
                                              buttonStyleData: ButtonStyleData(
                                                padding: EdgeInsets.only(right: 8),
                                              ),
                                              iconStyleData: IconStyleData(
                                                icon: Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.black45,
                                                ),
                                                iconSize: isPhone(context) ? 24 : 54,
                                              ),
                                              dropdownStyleData: DropdownStyleData(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                              ),
                                              menuItemStyleData: MenuItemStyleData(
                                                padding: EdgeInsets.symmetric(horizontal: 16),
                                                height: size.height * 0.07,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.08,
                          ),
                          // GestureDetector(
                          //   onTap: () async {
                          //     if (isPhone(context)) {
                          //       // final ok2 = await showDialog(
                          //       //   context: context,
                          //       //   barrierDismissible: false,
                          //       //   builder: (context) => SuccessDialog(
                          //       //     title: 'ท่านดำเนินการสำเร็จ โปรดรอการติดต่อกลับจาก รพ.',
                          //       //     pressYes: () {
                          //       //       Navigator.pop(context, true);
                          //       //     },
                          //       //   ),
                          //       // );
                          //       // if (ok2 == true) {
                          //       //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);
                          //       // }
                          //       try {
                          //         LoadingDialog.open(context);
                          //         final _member =
                          //             await HomeApi.addMembers(fname: widget.fname, lname: widget.lname, idcard: widget.idcard, email: widget.email, phone: widget.phone, address: widget.address);
                          //         if (!mounted) return;
                          //         LoadingDialog.close(context);
                          //         if (_member != null) {
                          //           final ok2 = await showDialog(
                          //             context: context,
                          //             barrierDismissible: false,
                          //             builder: (context) => SuccessDialog(
                          //               title: '${_member} โปรดเลือก รพ. ในขั้นตอนถัดไป',
                          //               pressYes: () {
                          //                 Navigator.pop(context, true);
                          //               },
                          //             ),
                          //           );
                          //           if (ok2 == true) {
                          //             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);
                          //           }
                          //         } else {}
                          //       } on Exception catch (e) {
                          //         if (!mounted) return;
                          //         LoadingDialog.close(context);
                          //         showDialog(
                          //           context: context,
                          //           barrierDismissible: false,
                          //           builder: (context) => SuccessDialog(
                          //             title: '${e}',
                          //             pressYes: () {
                          //               Navigator.pop(context, true);
                          //             },
                          //           ),
                          //         );
                          //       }
                          //     } else {
                          //       // final ok2 = await showDialog(
                          //       //   context: context,
                          //       //   barrierDismissible: false,
                          //       //   builder: (context) => SuccessDialogTablet(
                          //       //     page: 1,
                          //       //     title: 'บันทึกข้อมูลสำเร็จ โปรดเลือก รพ. ในขั้นตอนถัดไป',
                          //       //     pressYes: () {
                          //       //       Navigator.pop(context, true);
                          //       //     },
                          //       //   ),
                          //       // );
                          //       // if (ok2 == true) {
                          //       //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);
                          //       // }
                          //       try {
                          //         LoadingDialog.open(context);
                          //         // final _member =
                          //         //     await HomeApi.addMembers(fname: widget.fname, lname: widget.lname, idcard: widget.idcard, email: widget.email, phone: widget.phone, address: widget.address);
                          //         if (!mounted) return;
                          //         LoadingDialog.close(context);
                          //         final ok2 = await showDialog(
                          //           context: context,
                          //           barrierDismissible: false,
                          //           builder: (context) => NewScessDialog(
                          //             title: 'ลงทะเบียนสำเร็จแล้ว',
                          //             pressYes: () async {
                          //               Navigator.pop(context, true);
                          //             },
                          //           ),
                          //         );
                          //         // if (_member != null) {
                          //         //   final ok2 = await showDialog(
                          //         //     context: context,
                          //         //     barrierDismissible: false,
                          //         //     builder: (context) => NewScessDialog(
                          //         //       title: 'ลงทะเบียนสำเร็จแล้ว',
                          //         //       pressYes: () async {
                          //         //         Navigator.pop(context, true);
                          //         //       },
                          //         //     ),
                          //         //   );
                          //         //   if (ok2 == true) {
                          //         //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);
                          //         //   }
                          //         // } else {}

                          //         // if (_member != null) {
                          //         //   final ok2 = await showDialog(
                          //         //     context: context,
                          //         //     barrierDismissible: false,
                          //         //     builder: (context) => SuccessDialogTablet(
                          //         //       page: 1,
                          //         //       title: '${_member} โปรดเลือก รพ. ในขั้นตอนถัดไป',
                          //         //       pressYes: () {
                          //         //         Navigator.pop(context, true);
                          //         //       },
                          //         //     ),
                          //         //   );
                          //         //   if (ok2 == true) {
                          //         //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);
                          //         //   }
                          //         // } else {}
                          //       } on Exception catch (e) {
                          //         if (!mounted) return;
                          //         LoadingDialog.close(context);
                          //         showDialog(
                          //           context: context,
                          //           barrierDismissible: false,
                          //           builder: (context) => SuccessDialogTablet(
                          //             page: 0,
                          //             title: '${e}',
                          //             pressYes: () {
                          //               Navigator.pop(context, true);
                          //             },
                          //           ),
                          //         );
                          //       }
                          //     }
                          //   },
                          //   child: Container(
                          //     width: size.width * 0.90,
                          //     height: size.height * 0.07,
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
                          //             style: TextStyle(color: kContentTextColor, fontSize: isPhone(context) ? 18 : 28, fontWeight: FontWeight.bold),
                          //             textAlign: TextAlign.center,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: size.height * 0.02,
                          // ),
                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.pop(context);
                          //   },
                          //   child: Container(
                          //     width: size.width * 0.90,
                          //     height: size.height * 0.07,
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
                          //               kButtonNoColor,
                          //               kButtonNoColor,
                          //             ],
                          //             begin: Alignment.topLeft,
                          //             end: Alignment.bottomRight,
                          //           ),
                          //         ),
                          //         child: Center(
                          //           child: Text(
                          //             'กลับ',
                          //             style: TextStyle(
                          //               color: Colors.white,
                          //               fontSize: isPhone(context) ? 18 : 28,
                          //             ),
                          //             textAlign: TextAlign.center,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: size.height * 0.04,
                          // ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kContentColor3,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              kContentColor3,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            GestureDetector(
              onTap: () async {
                if (isPhone(context)) {
                  // if (ok2 == true) {
                  //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);
                  // }
                  try {
                    LoadingDialog.open(context);
                    if (selectedProvince != null && selectedDistrict != null && selectedHospitals != null) {
                      final _member = await HomeApi.addMembers(
                          fname: widget.fname,
                          lname: widget.lname,
                          idcard: widget.idcard,
                          email: widget.email,
                          phone: widget.phone,
                          address: widget.address,
                          khet_id: selectedDistrict!.id.toString(),
                          province_id: selectedProvince!.id.toString(),
                          hospital_id: selectedHospitals!.id.toString(),
                          sex: widget.sex,
                          birthday: widget.age);
                      if (!mounted) return;
                      LoadingDialog.close(context);
                      if (_member != null) {
                        // final ok2 = await showDialog(
                        //   context: context,
                        //   barrierDismissible: false,
                        //   builder: (context) => SuccessDialog(
                        //     title: '${_member} โปรดเลือก รพ. ในขั้นตอนถัดไป',
                        //     pressYes: () {
                        //       Navigator.pop(context, true);
                        //     },
                        //   ),
                        // );
                        final ok2 = await showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => NewScessDialog(
                            title: 'ลงทะเบียนสำเร็จแล้ว',
                            pressYes: () async {
                              Navigator.pop(context, true);
                            },
                          ),
                        );
                        if (ok2 == true) {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);
                        }
                      } else {}
                    } else {
                      if (!mounted) return;
                      LoadingDialog.close(context);
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => SuccessDialog(
                          title: 'ไม่ได้เลือก เขต จังหวัด หรือโรงพยาบาล',
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
                        title: '${e}',
                        pressYes: () {
                          Navigator.pop(context, true);
                        },
                      ),
                    );
                  }
                } else {
                  // final ok2 = await showDialog(
                  //   context: context,
                  //   barrierDismissible: false,
                  //   builder: (context) => SuccessDialogTablet(
                  //     page: 1,
                  //     title: 'บันทึกข้อมูลสำเร็จ โปรดเลือก รพ. ในขั้นตอนถัดไป',
                  //     pressYes: () {
                  //       Navigator.pop(context, true);
                  //     },
                  //   ),
                  // );
                  // if (ok2 == true) {
                  //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);
                  // }
                  try {
                    LoadingDialog.open(context);
                    if (selectedProvince != null && selectedDistrict != null && selectedHospitals != null) {
                      final _member = await HomeApi.addMembers(
                          fname: widget.fname,
                          lname: widget.lname,
                          idcard: widget.idcard,
                          email: widget.email,
                          phone: widget.phone,
                          address: widget.address,
                          khet_id: selectedDistrict!.id.toString(),
                          province_id: selectedProvince!.id.toString(),
                          hospital_id: selectedHospitals!.id.toString(),
                          sex: widget.sex,
                          birthday: widget.age);
                      if (!mounted) return;
                      LoadingDialog.close(context);
                      // final ok2 = await showDialog(
                      //   context: context,
                      //   barrierDismissible: false,
                      //   builder: (context) => NewScessDialog(
                      //     title: 'ลงทะเบียนสำเร็จแล้ว',
                      //     pressYes: () async {
                      //       Navigator.pop(context, true);
                      //     },
                      //   ),
                      // );
                      if (_member != null) {
                        final ok2 = await showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => NewScessDialog(
                            title: 'ลงทะเบียนสำเร็จแล้ว',
                            pressYes: () async {
                              Navigator.pop(context, true);
                            },
                          ),
                        );
                        if (ok2 == true) {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);
                        }
                      } else {}
                    } else {
                      if (!mounted) return;
                      LoadingDialog.close(context);
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => SuccessDialogTablet(
                          page: 0,
                          title: 'ไม่ได้เลือก เขต จังหวัด หรือโรงพยาบาล',
                          pressYes: () {
                            Navigator.pop(context, true);
                          },
                        ),
                      );
                    }

                    // if (_member != null) {
                    //   final ok2 = await showDialog(
                    //     context: context,
                    //     barrierDismissible: false,
                    //     builder: (context) => SuccessDialogTablet(
                    //       page: 1,
                    //       title: '${_member} โปรดเลือก รพ. ในขั้นตอนถัดไป',
                    //       pressYes: () {
                    //         Navigator.pop(context, true);
                    //       },
                    //     ),
                    //   );
                    //   if (ok2 == true) {
                    //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FirstPage()), (route) => false);
                    //   }
                    // } else {}
                  } on Exception catch (e) {
                    if (!mounted) return;
                    LoadingDialog.close(context);
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
                          kContentColor1,
                          kContentColor2,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'ลงทะเบียน',
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
                Navigator.pop(context);
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
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isPhone(context) ? 18 : 28,
                        ),
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
          ],
        ),
      ),
    );
  }
}
