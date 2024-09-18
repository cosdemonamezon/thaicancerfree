import 'package:flutter/material.dart';
import 'package:thaicancerfree/constants.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            //
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Center(
              //   child: Image.asset('assets/images/comingsoon110.jpg'),
              // ),
              Center(
                child: Text(
                  'COMING SOON',
                  style: TextStyle(
                    color: kButtonNoColor,
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
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
