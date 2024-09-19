import 'dart:async';

import 'package:flutter/material.dart';
import 'package:thaicancerfree/home/firstPage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      fristLoad();
    });
  }

  Future<void> fristLoad() async {
    // prefs = await SharedPreferences.getInstance();
    // token = prefs.getString('token');
    // if (!mounted) return;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return FirstPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
        //     Color(0xFFffffff),
        //     Color(0xFFd5e8f9),
        //   ]),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/969_1054.png",
                  height: size.height * 0.5,
                  width: size.width * 0.8,
                ),
                // Text(
                //   "WelcomePage.WelcomePage".tr(),
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 18.0,
                //   ),
                // ),
              ],
            ),
            // CircularProgressIndicator(
            //   strokeWidth: 5.0,
            //   valueColor: AlwaysStoppedAnimation<Color>(kGreenAccent),
            // ),
          ],
        ),
      ),
    );
  }
}
