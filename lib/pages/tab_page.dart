import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:madcamp_week2/constants/colors.dart';
import 'package:madcamp_week2/pages/note_page.dart';
import 'package:madcamp_week2/pages/review_page.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();

    //// Use normal tab controller
    // _tabController = TabController(
    //   initialIndex: 1,
    //   length: 4,
    //   vsync: this,
    // );

    //// use "MotionTabBarController" to replace with "TabController", if you need to programmatically change the tab
    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );

  }

  @override
  void dispose() {
    super.dispose();
    // _tabController.dispose();
    _motionTabBarController!.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('바리바리', style: TextStyle(color: myColor.mainColor, fontWeight: FontWeight.bold),),
            IconButton(
              onPressed: (){
                Fluttertoast.showToast(
                    msg: "로그아웃 되었습니다",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: myColor.mainColor,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
                userProvider.signOutKakao();




              },
              icon: Icon(Icons.logout_outlined)
            )
          ],
        ),
        backgroundColor: myColor.background,
        foregroundColor: myColor.textColor,
      ),

      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController, // ADD THIS if you need to change your tab programmatically
        initialSelectedTab: "커핑노트",
        labels: const ["커핑노트", "평점", "커뮤니티", "나의 기록"],
        icons: const [Icons.edit_note_outlined, Icons.bar_chart_outlined, Icons.group_outlined, Icons.analytics_outlined],

        // optional badges, length must be same with labels

        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: myColor.mainColor,
          fontWeight: FontWeight.w800,
        ),
        tabIconColor: myColor.mainColor,
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: myColor.mainColor,
        tabIconSelectedColor: Colors.white,
        tabBarColor: Colors.white,
        onTabItemSelected: (int value) {
          setState(() {
            // _tabController!.index = value;
            _motionTabBarController!.index = value;
          });
        },
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        // controller: _tabController,
        controller: _motionTabBarController,
        children: [
          NotePage(),
          ReviewPage(),
          Text('안녕'),
          Text('안녕'),
        ],
      ),
    );
  }
}


