import 'package:automated_elective_processing/common/app_colors.dart';
import 'package:flutter/material.dart';


class logout extends StatelessWidget {
  const logout({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: AppColor.bgSideMenu,
      body:  Column(
          children: [
          Center(
           child:SizedBox(
            height: 400,
            width: 400,
            child: Image.asset('assets/sidebar_image.png'),
          ),),
          Text('Thank You. Please log in again', 
          textAlign: TextAlign.center, 
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: AppColor.yellow
            ))
        ]
        ),
        );
  }
}