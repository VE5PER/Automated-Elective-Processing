import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:automated_elective_processing/dashboard.dart';
import 'package:automated_elective_processing/common/app_colors.dart';

class WIP extends StatelessWidget {
  const WIP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColor.yellow),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => dashboard()));
            }),
      ),
      body: Icon(
        Icons.construction,
        size: 500,
      ),
    );
  }
}
