import 'package:automated_elective_processing/common/app_colors.dart';
import 'package:automated_elective_processing/pages/add_elective.dart';
import 'package:automated_elective_processing/pages/add_user.dart';
import 'package:automated_elective_processing/pages/chooseElective.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'logout.dart';

class tempDash extends StatefulWidget {
  const tempDash({Key? key}) : super(key: key);

  @override
  State<tempDash> createState() => _tempDashState();
}

class _tempDashState extends State<tempDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Dashboard", textAlign: TextAlign.center, style: TextStyle(color: AppColor.yellow, fontWeight: FontWeight.bold, fontSize: 30),),backgroundColor: AppColor.purple,),
      backgroundColor: AppColor.yellow,
      body:Center( 
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Container(
        height: 250,
        width: 300,
        child: Image.asset('assets/sidebar_image.png')
        ),
      SizedBox(
        height: 25
      ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_add, size: 30, color: AppColor.purple,),
            TextButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => addUser()));// re
            }, child: Text("Add User", style: TextStyle(color: AppColor.purple, fontWeight: FontWeight.bold, fontSize: 25),)),
          ],
        ), /*
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(Icons.select_all, size: 30, color: AppColor.purple, ),
            TextButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => chooseElective()));// re
            }, child: Text("Choose Elective", style: TextStyle(color: AppColor.purple, fontWeight: FontWeight.bold, fontSize: 25),)),
          ],
        ),

        */

        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.document_scanner, size: 30, color: AppColor.purple,),
            TextButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => addElective()));
            }, child: Text("Add Elective", style: TextStyle(color: AppColor.purple, fontWeight: FontWeight.bold, fontSize: 25),)),
          ],
        ),
          SizedBox(
            height: 50,
          ),
          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.logout, size: 30, color: AppColor.purple,),
              TextButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => logout()));
              }, child: Text("Logout", style: TextStyle(color: AppColor.purple, fontWeight: FontWeight.bold, fontSize: 25),)),
            ],
          ),

      ],
      ),
      )

    );
  }
}
