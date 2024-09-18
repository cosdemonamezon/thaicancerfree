import 'package:ff_navigation_bar_plus/ff_navigation_bar_plus.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:thaicancerfree/constants.dart';
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
        currentPage =HomePage() ;
      } else if (selectedIndex == 2) {
        currentPage = SettingPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: PageStorage(bucket: bucket, child: currentPage),
      ),
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "Home",
        labels: ["News", "Home", "Profile"],
        icons: [Icons.search, Icons.home, Icons.person],
        tabIconSize: isPhone(context) ? 30 : 40,  // กำหนดขนาดไอคอนที่นี่
        tabIconSelectedSize: isPhone(context) ? 40 : 50,  // ขนาดไอคอนเมื่อเลือก
        tabSize: isPhone(context) ? 60 : 70,
        tabBarHeight: isPhone(context) ? 65 : 85,
        tabBarColor: Colors.white,
        tabSelectedColor: kContentColor2,
        tabIconColor: kContentColor2,
        textStyle: TextStyle(color: kContentColor1, fontSize: isPhone(context) ? 16 : 26),
        onTabItemSelected: (int value) {
          setState(() {
            onItemSelect(value);
          });
        },
      ),
      // bottomNavigationBar: FFNavigationBar(
      //   theme: FFNavigationBarTheme(
      //     barBackgroundColor: Colors.white,
      //     selectedItemBorderColor: kContentColor2,
      //     selectedItemBackgroundColor: kContentColor1,
      //     selectedItemIconColor: Colors.white,
      //     selectedItemLabelColor: Colors.black,
      //     selectedItemTextStyle: TextStyle(fontSize: isPhone(context) ? 16 : 26),
      //     unselectedItemTextStyle: TextStyle(fontSize: isPhone(context) ? 16 : 26),
      //     barHeight: isPhone(context) ? 56.0 : 100,
      //     showSelectedItemShadow: false,
      //   ),
      //   selectedIndex: selectedIndex,
      //   onSelectTab: (index) {
      //     setState(() {
      //       //selectedIndex = index;
      //       onItemSelect(index);
      //     });
      //   },
      //   items: [
      //     FFNavigationBarItem(
      //       iconData: Icons.home,
      //       label: 'หน้าหลัก',
      //       //iconSize: 30,
      //     ),
      //     FFNavigationBarItem(
      //       iconData: Icons.newspaper,
      //       label: 'ข่าวสาร',
      //     ),
      //     FFNavigationBarItem(
      //       iconData: Icons.settings,
      //       label: 'ตั้งค่า',
      //     ),
      //   ],
      // ),
      
    );
  }
}
