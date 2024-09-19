import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thaicancerfree/constants.dart';
import 'package:thaicancerfree/home/femaleBreastCancer.dart';
import 'package:thaicancerfree/home/widgets/AppTextForm.dart';
import 'package:thaicancerfree/home/widgets/AppTextFormIcons.dart';
import 'package:thaicancerfree/models/province.dart';
import 'package:thaicancerfree/models/provinces.dart';
import 'dart:convert' as convert;
import 'package:intl/intl.dart'; // ใช้ในการฟอร์แมตวันที่

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController idcard = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController sex = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController provin = TextEditingController();
  List<Province> provinces = [];
  Province? selecteProvinces;
  List<String> kOptions = [];
  int ageValue = 0;

  int groupValue = 1;

  // สร้างตัวแปรเพื่อเก็บวันที่ที่เลือก
  DateTime? selectedDate;
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    readProvincesJson();
    setState(() {
      final dateToday = DateTime.now();
      age.text = DateFormat('dd/MM/yyyy').format(dateToday);
    });
  }

  void _increment() {
    setState(() {
      ageValue++;
      age.text = ageValue.toString(); // Update the value in the TextFormField
    });
  }

  void _decrement() {
    setState(() {
      if (ageValue > 0) {
        ageValue--;
        age.text = ageValue.toString(); // Update the value in the TextFormField
      }
    });
  }

  //เรียกดูข้อมูชจากไฟล์ json ที่อยู่ในโฟลเดอร์ assets
  Future<void> readProvincesJson() async {
    final String response = await rootBundle.loadString('assets/provinced.json');
    final resdata = convert.jsonDecode(response);
    final list = resdata['provinces'] as List;

    setState(() {
      provinces = list.map((e) => Province.fromJson(e)).toList();
      selecteProvinces = provinces[0];
      for (var i = 0; i < provinces.length; i++) {
        kOptions.add(provinces[i].name);
      }
      //inspect(kOptions);
    });
  }

  // ฟังก์ชันสำหรับเปิด DatePicker
  Future<void> onSelectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // วันที่เริ่มต้นคือวันที่ปัจจุบัน
      firstDate: DateTime(1900), // วันที่แรกที่สามารถเลือกได้
      lastDate: DateTime.now(), // วันที่ล่าสุดที่สามารถเลือกได้
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        // ฟอร์แมตวันที่ที่เลือกให้เป็นสตริง
        dateController.text = DateFormat('dd/MM/yyyy').format(picked);
        age.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
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
                        'ลงทะเบียนประวัติ',
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
        //     'ลงทะเบียนประวัติ',
        //     style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w700),
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // width: size.width,
          // height: size.height,
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
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Column(
                  children: [
                    Container(
                      width: size.width * 0.98,
                      height: size.height * 1.64,
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
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                              child: Row(
                                children: [
                                  Text(
                                    'ชื่อ',
                                    style: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 20 : 30, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            AppTextForm(
                              controller: fname,
                              //labelText: 'ชื่อผู้ใช้',
                              labelStyle: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 25 : 35, fontWeight: FontWeight.bold),
                              validator: (val) => val == '' || val == null || val.isEmpty ? 'กรุณากรอกชื่อผู้ใช้งาน' : null,
                            ),
                            SizedBox(height: size.height * 0.02),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                              child: Row(
                                children: [
                                  Text(
                                    'นามสกุล',
                                    style: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 20 : 30, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            AppTextForm(
                              controller: lname,
                              //labelText: 'ชื่อผู้ใช้',
                              labelStyle: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 25 : 35, fontWeight: FontWeight.bold),
                              validator: (val) => val == '' || val == null || val.isEmpty ? 'กรุณากรอกนามสกุล' : null,
                            ),
                            SizedBox(height: size.height * 0.02),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                              child: Row(
                                children: [
                                  Text(
                                    'เลขบัตรประชาชน',
                                    style: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 20 : 30, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            AppTextForm(
                              controller: idcard,
                              keyboardType: TextInputType.number,
                              inputFormatters: [LengthLimitingTextInputFormatter(13)],
                              labelStyle: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 25 : 35, fontWeight: FontWeight.bold),
                              validator: (val) => val == '' || val == null || val.isEmpty
                                  ? 'กรุณากรอกเลขบัตรประชาชน'
                                  : val.length < 13
                                      ? 'กรอกเลขบัตรประชาชนไม่คบ'
                                      : null,
                            ),
                            SizedBox(height: size.height * 0.02),
                            isPhone(context)
                                ? Column(
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'วัน/เดือน/ปีเกิด',
                                                  style: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 20 : 30, fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          AppTextFormIcons(
                                            controller: age,
                                            readOnly: true,
                                            //labelText: 'อายุ',
                                            keyboardType: TextInputType.number,
                                            labelStyle: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 25 : 35, fontWeight: FontWeight.bold),
                                            //validator: (val) => val == '' || val == null || val.isEmpty ? 'กรุณากรอกอายุ' : null,
                                            onChanged: (valueText) {
                                              // setState(() {
                                              //   age.text = valueText;
                                              //   if (age.text != '') {
                                              //     ageValue = int.parse(age.text);
                                              //   } else {
                                              //     ageValue = 0;
                                              //   }
                                              // });
                                            },
                                            suffixIcon: IconButton(
                                              icon: Icon(Icons.calendar_today),
                                              onPressed: () {
                                                onSelectDate(context); // เรียกฟังก์ชัน DatePicker
                                              },
                                            ),
                                            // suffixIcon: IconButton(
                                            //   icon: Icon(
                                            //     Icons.add,
                                            //     size: isPhone(context) ? 25 : 45,
                                            //   ), // Plus icon
                                            //   onPressed: _increment, // Increment the value
                                            // ),
                                            // prefixIcon: IconButton(
                                            //   icon: Icon(
                                            //     Icons.remove,
                                            //     size: isPhone(context) ? 25 : 45,
                                            //   ), // Minus icon
                                            //   onPressed: _decrement, // Decrement the value
                                            // ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: size.height * 0.02),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'เพศ',
                                                  style: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 20 : 30, fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: size.height * 0.01),
                                          SizedBox(
                                            width: size.width * 0.55,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    EasyRadio<int>(
                                                      value: 1,
                                                      groupValue: groupValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          groupValue = value!;
                                                          sex.text = 'ชาย';
                                                        });
                                                      },
                                                      dotStyle: DotStyle.check(StrokeCap.round),
                                                      activeBorderColor: kContentColor4,
                                                      inactiveBorderColor: kContentColor2,
                                                      dotColor: kContentColor4,
                                                      radius: 18,
                                                      dotRadius: 15,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                                                      child: Text(
                                                        'ชาย',
                                                        style: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 20 : 30, fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    EasyRadio<int>(
                                                      value: 2,
                                                      groupValue: groupValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          groupValue = value!;
                                                          sex.text = 'หญิง';
                                                        });
                                                      },
                                                      dotStyle: DotStyle.check(StrokeCap.round),
                                                      activeBorderColor: kContentColor4,
                                                      inactiveBorderColor: kContentColor2,
                                                      dotColor: kContentColor4,
                                                      radius: 18,
                                                      dotRadius: 15,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                                                      child: Text(
                                                        'หญิง',
                                                        style: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 20 : 30, fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: size.height * 0.01),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'วัน/เดือน/ปีเกิด',
                                                  style: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 20 : 30, fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.45,
                                            child: AppTextFormIcons(
                                              controller: age,
                                              readOnly: true,
                                              //labelText: 'อายุ',
                                              keyboardType: TextInputType.number,
                                              labelStyle: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 25 : 35, fontWeight: FontWeight.bold),
                                              //validator: (val) => val == '' || val == null || val.isEmpty ? 'กรุณากรอกอายุ' : null,
                                              onChanged: (valueText) {
                                                // setState(() {
                                                //   age.text = valueText;
                                                //   if (age.text != '') {
                                                //     ageValue = int.parse(age.text);
                                                //   } else {
                                                //     ageValue = 0;
                                                //   }
                                                // });
                                              },
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  Icons.calendar_today,
                                                  size: isPhone(context) ? 25 : 35,
                                                ),
                                                onPressed: () {
                                                  onSelectDate(context); // เรียกฟังก์ชัน DatePicker
                                                },
                                              ),
                                              // suffixIcon: IconButton(
                                              //   icon: Icon(
                                              //     Icons.add,
                                              //     size: isPhone(context) ? 25 : 45,
                                              //   ), // Plus icon
                                              //   onPressed: _increment, // Increment the value
                                              // ),
                                              // prefixIcon: IconButton(
                                              //   icon: Icon(
                                              //     Icons.remove,
                                              //     size: isPhone(context) ? 25 : 45,
                                              //   ), // Minus icon
                                              //   onPressed: _decrement, // Decrement the value
                                              // ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'เพศ',
                                                  style: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 20 : 30, fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.45,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    EasyRadio<int>(
                                                      value: 1,
                                                      groupValue: groupValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          groupValue = value!;
                                                          sex.text = 'ชาย';
                                                        });
                                                      },
                                                      dotStyle: DotStyle.check(StrokeCap.round),
                                                      activeBorderColor: kContentColor4,
                                                      inactiveBorderColor: kContentColor2,
                                                      dotColor: kContentColor4,
                                                      radius: 18,
                                                      dotRadius: 15,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                                                      child: Text(
                                                        'ชาย',
                                                        style: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 20 : 30, fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    EasyRadio<int>(
                                                      value: 2,
                                                      groupValue: groupValue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          groupValue = value!;
                                                          sex.text = 'หญิง';
                                                        });
                                                      },
                                                      dotStyle: DotStyle.check(StrokeCap.round),
                                                      activeBorderColor: kContentColor4,
                                                      inactiveBorderColor: kContentColor2,
                                                      dotColor: kContentColor4,
                                                      radius: 18,
                                                      dotRadius: 15,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                                                      child: Text(
                                                        'หญิง',
                                                        style: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 20 : 30, fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                            SizedBox(height: size.height * 0.02),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                              child: Row(
                                children: [
                                  Text(
                                    'อีเมล',
                                    style: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 20 : 30, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            AppTextForm(
                              controller: email,
                              //labelText: 'อีเมล',
                              keyboardType: TextInputType.emailAddress,
                              labelStyle: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 25 : 35, fontWeight: FontWeight.bold),
                              validator: (val) => val == '' || val == null || val.isEmpty ? 'กรุณากรอกอีเมล' : null,
                            ),
                            SizedBox(height: size.height * 0.02),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                              child: Row(
                                children: [
                                  Text(
                                    'เบอร์โทรศัพท์',
                                    style: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 20 : 30, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            AppTextForm(
                              controller: phone,
                              //labelText: 'เบอร์โทรศัพท์',
                              keyboardType: TextInputType.number,
                              inputFormatters: [LengthLimitingTextInputFormatter(10)],
                              labelStyle: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 25 : 35, fontWeight: FontWeight.bold),
                              validator: (val) => val == '' || val == null || val.isEmpty
                                  ? 'กรุณากรอกเบอร์โทรศัพท์'
                                  : val.length < 10
                                      ? 'กรอกเบอร์โทรศัพท์ไม่ครบ'
                                      : null,
                            ),
                            SizedBox(height: size.height * 0.02),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                              child: Row(
                                children: [
                                  Text(
                                    'ที่อยู่',
                                    style: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 20 : 30, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            AppTextForm(
                              controller: address,
                              //labelText: 'เบอร์โทรศัพท์',
                              //keyboardType: TextInputType.number,
                              maxline: 2,
                              labelStyle: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 25 : 35, fontWeight: FontWeight.bold),
                              validator: (val) => val == '' || val == null || val.isEmpty ? 'กรุณากรอกที่อยู่' : null,
                            ),
                            SizedBox(height: size.height * 0.02),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                              child: Row(
                                children: [
                                  Text(
                                    'จังหวัด',
                                    style: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 20 : 30, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            kOptions.isNotEmpty
                                ? Autocomplete<String>(
                                    optionsMaxHeight: 300,
                                    optionsBuilder: (TextEditingValue textEditingValue) {
                                      if (textEditingValue.text.isEmpty) {
                                        return Iterable<String>.empty();
                                      }
                                      return kOptions.where((String option) {
                                        return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                                      });
                                    },
                                    onSelected: (String selection) {
                                      setState(() {
                                        provin.text = selection;
                                      });
                                      print('You selected: ${provin.text}');
                                    },
                                    fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
                                      return AppTextForm(
                                        controller: textEditingController,
                                        //labelText: 'อีเมล',
                                        focusNode: focusNode,
                                        keyboardType: TextInputType.emailAddress,
                                        labelStyle: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 25 : 35, fontWeight: FontWeight.bold),
                                        onFieldSubmitted: (String value) {
                                          onFieldSubmitted();
                                        },
                                        //validator: (val) => val == '' || val == null || val.isEmpty ? 'กรุณากรอกอีเมล' : null,
                                      );
                                    },
                                    optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                                      return Align(
                                        alignment: Alignment.topLeft,
                                        child: Material(
                                          child: ListView.builder(
                                              padding: EdgeInsets.all(8.0),
                                              itemCount: options.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                final String option = options.elementAt(index);
                                                return GestureDetector(
                                                  onTap: () {
                                                    onSelected(option);
                                                    //print(option);
                                                  },
                                                  child: ListTile(
                                                    title: Text(
                                                      option,
                                                      style: TextStyle(
                                                        fontSize: isPhone(context) ? 18.0 : 28, // Custom text size
                                                        color: Colors.black87, // Custom text color
                                                        fontWeight: FontWeight.w500, // Custom font weight
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                      );
                                    })
                                : SizedBox(),
                            // provinces.isEmpty
                            //     ? SizedBox()
                            //     : Card(
                            //         elevation: 5,
                            //         shape: RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
                            //         ),
                            //         child: Container(
                            //           height: size.height * 0.09,
                            //           width: size.width * 0.93,
                            //           decoration: BoxDecoration(
                            //             color: kBackgroundColor,
                            //             borderRadius: BorderRadius.all(
                            //               Radius.circular(8.0),
                            //             ),
                            //             boxShadow: [
                            //               BoxShadow(
                            //                 offset: Offset(0, 0),
                            //                 blurRadius: 0,
                            //                 spreadRadius: 0,
                            //                 //color: Colors.black26,
                            //               ),
                            //             ],
                            //           ),
                            //           child: DropdownButtonHideUnderline(
                            //             child: DropdownButton2<Provinces>(
                            //               isExpanded: true,
                            //               hint: Text(
                            //                 'จังหวัด',
                            //                 style: TextStyle(
                            //                   fontSize: isPhone(context) ? 22 : 32,
                            //                   color: Theme.of(context).hintColor,
                            //                 ),
                            //               ),
                            //               items: provinces
                            //                   .map((Provinces item) => DropdownMenuItem<Provinces>(
                            //                         value: item,
                            //                         child: Text(
                            //                           item.name,
                            //                           style: TextStyle(
                            //                             fontSize: isPhone(context) ? 22 : 32,
                            //                           ),
                            //                         ),
                            //                       ))
                            //                   .toList(),
                            //               value: selecteProvinces,
                            //               onChanged: (Provinces? value) {
                            //                 setState(() {
                            //                   selecteProvinces = value;
                            //                 });
                            //               },
                            //               iconStyleData: IconStyleData(
                            //                 icon: Icon(
                            //                   Icons.arrow_drop_down,
                            //                   color: Colors.black45,
                            //                 ),
                            //                 iconSize: isPhone(context) ? 24 : 54,
                            //               ),
                            //               buttonStyleData: ButtonStyleData(
                            //                 padding: EdgeInsets.symmetric(horizontal: isPhone(context) ? 16 : 26),
                            //                 height: isPhone(context) ? 40 : 80,
                            //                 width: isPhone(context) ? 140 : 180,
                            //               ),
                            //               menuItemStyleData: MenuItemStyleData(
                            //                 height: isPhone(context) ? 40 : 80,
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            // SizedBox(
                            //   height: size.height * 0.04,
                            // ),
                            // GestureDetector(
                            //   onTap: () async {
                            //     if (_formKey.currentState!.validate()) {
                            //       if (isPhone(context)) {
                            //         Navigator.push(
                            //             context,
                            //             MaterialPageRoute(
                            //                 builder: (context) => FemaleBreastCancer(
                            //                       fname: fname.text,
                            //                       lname: lname.text,
                            //                       sex: sex.text,
                            //                       address: address.text,
                            //                       phone: phone.text,
                            //                       age: age.text,
                            //                       email: email.text,
                            //                       idcard: idcard.text,
                            //                       selecteProvinces: provin.text,
                            //                     )));
                            //         // try {
                            //         //   LoadingDialog.open(context);
                            //         //   final _member = await HomeApi.addMembers(fname: fname.text, lname: lname.text, idcard: idcard.text, email: email.text, phone: phone.text, address: address.text);
                            //         //   if (!mounted) return;
                            //         //   LoadingDialog.close(context);
                            //         //   if (_member != null) {
                            //         //     final ok2 = await showDialog(
                            //         //       context: context,
                            //         //       barrierDismissible: false,
                            //         //       builder: (context) => SuccessDialog(
                            //         //         title: '${_member} โปรดเลือก รพ. ในขั้นตอนถัดไป',
                            //         //         pressYes: () {
                            //         //           Navigator.pop(context, true);
                            //         //         },
                            //         //       ),
                            //         //     );
                            //         //     if (ok2 == true) {
                            //         //       Navigator.push(context, MaterialPageRoute(builder: (context) => FemaleBreastCancer()));
                            //         //     }
                            //         //   } else {}
                            //         // } on Exception catch (e) {
                            //         //   if (!mounted) return;
                            //         //   LoadingDialog.close(context);
                            //         //   showDialog(
                            //         //     context: context,
                            //         //     barrierDismissible: false,
                            //         //     builder: (context) => SuccessDialog(
                            //         //       title: '${e}',
                            //         //       pressYes: () {
                            //         //         Navigator.pop(context, true);
                            //         //       },
                            //         //     ),
                            //         //   );
                            //         // }
                            //       } else {
                            //         Navigator.push(
                            //             context,
                            //             MaterialPageRoute(
                            //                 builder: (context) => FemaleBreastCancer(
                            //                       fname: fname.text,
                            //                       lname: lname.text,
                            //                       sex: sex.text,
                            //                       address: address.text,
                            //                       phone: phone.text,
                            //                       age: age.text,
                            //                       email: email.text,
                            //                       idcard: idcard.text,
                            //                       selecteProvinces: selecteProvinces!.name,
                            //                     )));
                            //         // try {
                            //         //   LoadingDialog.open(context);
                            //         //   final _member = await HomeApi.addMembers(fname: fname.text, lname: lname.text, idcard: idcard.text, email: email.text, phone: phone.text, address: address.text);
                            //         //   if (!mounted) return;
                            //         //   LoadingDialog.close(context);
                            //         //   if (_member != null) {
                            //         //     final ok2 = await showDialog(
                            //         //       context: context,
                            //         //       barrierDismissible: false,
                            //         //       builder: (context) => SuccessDialogTablet(
                            //         //         page: 1,
                            //         //         title: '${_member} โปรดเลือก รพ. ในขั้นตอนถัดไป',
                            //         //         pressYes: () {
                            //         //           Navigator.pop(context, true);
                            //         //         },
                            //         //       ),
                            //         //     );
                            //         //     if (ok2 == true) {
                            //         //       Navigator.push(context, MaterialPageRoute(builder: (context) => FemaleBreastCancer()));
                            //         //     }
                            //         //   } else {}
                            //         // } on Exception catch (e) {
                            //         //   if (!mounted) return;
                            //         //   LoadingDialog.close(context);
                            //         //   showDialog(
                            //         //     context: context,
                            //         //     barrierDismissible: false,
                            //         //     builder: (context) => SuccessDialogTablet(
                            //         //       page: 0,
                            //         //       title: '${e}',
                            //         //       pressYes: () {
                            //         //         Navigator.pop(context, true);
                            //         //       },
                            //         //     ),
                            //         //   );
                            //         // }
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
                            //             'ถัดไป',
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
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.16),
                  ],
                ),
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
                if (_formKey.currentState!.validate()) {
                  if (isPhone(context)) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FemaleBreastCancer(
                                  fname: fname.text,
                                  lname: lname.text,
                                  sex: sex.text,
                                  address: address.text,
                                  phone: phone.text,
                                  age: age.text,
                                  email: email.text,
                                  idcard: idcard.text,
                                  selecteProvinces: provin.text,
                                )));
                    // try {
                    //   LoadingDialog.open(context);
                    //   final _member = await HomeApi.addMembers(fname: fname.text, lname: lname.text, idcard: idcard.text, email: email.text, phone: phone.text, address: address.text);
                    //   if (!mounted) return;
                    //   LoadingDialog.close(context);
                    //   if (_member != null) {
                    //     final ok2 = await showDialog(
                    //       context: context,
                    //       barrierDismissible: false,
                    //       builder: (context) => SuccessDialog(
                    //         title: '${_member} โปรดเลือก รพ. ในขั้นตอนถัดไป',
                    //         pressYes: () {
                    //           Navigator.pop(context, true);
                    //         },
                    //       ),
                    //     );
                    //     if (ok2 == true) {
                    //       Navigator.push(context, MaterialPageRoute(builder: (context) => FemaleBreastCancer()));
                    //     }
                    //   } else {}
                    // } on Exception catch (e) {
                    //   if (!mounted) return;
                    //   LoadingDialog.close(context);
                    //   showDialog(
                    //     context: context,
                    //     barrierDismissible: false,
                    //     builder: (context) => SuccessDialog(
                    //       title: '${e}',
                    //       pressYes: () {
                    //         Navigator.pop(context, true);
                    //       },
                    //     ),
                    //   );
                    // }
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FemaleBreastCancer(
                                  fname: fname.text,
                                  lname: lname.text,
                                  sex: sex.text,
                                  address: address.text,
                                  phone: phone.text,
                                  age: age.text,
                                  email: email.text,
                                  idcard: idcard.text,
                                  selecteProvinces: selecteProvinces!.name,
                                )));
                    // try {
                    //   LoadingDialog.open(context);
                    //   final _member = await HomeApi.addMembers(fname: fname.text, lname: lname.text, idcard: idcard.text, email: email.text, phone: phone.text, address: address.text);
                    //   if (!mounted) return;
                    //   LoadingDialog.close(context);
                    //   if (_member != null) {
                    //     final ok2 = await showDialog(
                    //       context: context,
                    //       barrierDismissible: false,
                    //       builder: (context) => SuccessDialogTablet(
                    //         page: 1,
                    //         title: '${_member} โปรดเลือก รพ. ในขั้นตอนถัดไป',
                    //         pressYes: () {
                    //           Navigator.pop(context, true);
                    //         },
                    //       ),
                    //     );
                    //     if (ok2 == true) {
                    //       Navigator.push(context, MaterialPageRoute(builder: (context) => FemaleBreastCancer()));
                    //     }
                    //   } else {}
                    // } on Exception catch (e) {
                    //   if (!mounted) return;
                    //   LoadingDialog.close(context);
                    //   showDialog(
                    //     context: context,
                    //     barrierDismissible: false,
                    //     builder: (context) => SuccessDialogTablet(
                    //       page: 0,
                    //       title: '${e}',
                    //       pressYes: () {
                    //         Navigator.pop(context, true);
                    //       },
                    //     ),
                    //   );
                    // }
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
                        'ถัดไป',
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
