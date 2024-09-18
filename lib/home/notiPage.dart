import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thaicancerfree/constants.dart';
import 'package:thaicancerfree/models/noti.dart';
import 'dart:convert' as convert;

class NotiPage extends StatefulWidget {
  const NotiPage({super.key});

  @override
  State<NotiPage> createState() => _NotiPageState();
}

class _NotiPageState extends State<NotiPage> {
  List<Noti> notis = [];

  @override
  void initState() {
    super.initState();
    readNotiJson();
  }

  //เรียกดูข้อมูชจากไฟล์ json ที่อยู่ในโฟลเดอร์ assets
  Future<void> readNotiJson() async {
    final String response = await rootBundle.loadString('assets/noti.json');
    final resdata = convert.jsonDecode(response);
    final list = resdata['notification'] as List;

    setState(() {
      notis = list.map((e) => Noti.fromJson(e)).toList();
    });
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
                    IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios, size: isPhone(context) ? 25 : 35,)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      child: Text(
                        'แจ้งเตือน',
                        style: TextStyle(
                          color: kButtonNoColor,
                          fontSize: isPhone(context) ? 25 : 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03, width: size.width * 0.05,),
                  ],
                ),
              ],
            ),
          ),
        ),
        // child: AppBar(
        //   centerTitle: true,
        //   title: Text(
        //     'แจ้งเตือน',
        //     style: TextStyle(color: Colors.black, fontSize: isPhone(context) ? 22 : 32, fontWeight: FontWeight.w700),
        //   ),
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
              colors: [
                // Color.fromARGB(255, 236, 39, 227),
                // Color.fromARGB(255, 229, 121, 233),
                kContentColor3,
                kContentColor3
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              // Center(
              //   child: Image.asset('assets/images/comingsoon110.jpg'),
              // ),
              // Center(
              //   child: Text(
              //     "ไม่พบข้อมูล",
              //     style: TextStyle(
              //       color: kButtonNoColor,
              //       fontSize: 33,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              Column(
                children: List.generate(
                  notis.length,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                    child: Container(
                      width: size.width * 0.95,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 1,
                            spreadRadius: 1,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.notifications,
                          color: kContentColor1,
                          size: isPhone(context) ? 35 : 45,
                        ),
                        title: Text(
                          '${notis[index].title}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: isPhone(context) ? 18 : 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'โรงพยาบาล ${notis[index].hospital}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: isPhone(context) ? 16.53 : 26.53,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'วันที่ ${notis[index].date}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: isPhone(context) ? 16 : 26,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
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
    );
  }
}
