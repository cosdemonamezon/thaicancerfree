import 'package:flutter/material.dart';

import 'package:thaicancerfree/home/homePage.dart';
import 'package:thaicancerfree/news/newsPage.dart';
import 'package:thaicancerfree/setting/settingPage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int selectedIndex = 1;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentPage = HomePage();

  void onItemSelect(int index) {
    setState(() {
      selectedIndex = index;
      if (selectedIndex == 0) {
        currentPage = NewsPage();
      } else if (selectedIndex == 1) {
        currentPage = HomePage();
      } else if (selectedIndex == 2) {
        currentPage = SettingPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: PageStorage(bucket: bucket, child: currentPage),
      ),
      // bottomNavigationBar: Container(
      //   height: size.height * 0.35, // Custom height
      //   decoration: BoxDecoration(
      //     color: Colors.blue,
      //   ),
      //   child: Column(
      //     children: [],
      //   ),
      // ),
    );
  }
}
