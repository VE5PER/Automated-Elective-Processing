import 'package:flutter/material.dart';
import 'package:automated_elective_processing/common/app_colors.dart';

import 'package:provider/provider.dart';

import 'dashboard/dashboard.dart';
import 'dashboard/widget/side_bar_menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      backgroundColor: AppColor.bgSideMenu,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SideBar(),
            ),

            /// Main Body Part
            Expanded(
              flex: 4,
              child: Dashboard(),
            ),
          ],
        ),
      ),
    );
  }
}
