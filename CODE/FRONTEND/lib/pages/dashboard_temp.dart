import 'package:automated_elective_processing/pages/add_elective.dart';
import 'package:automated_elective_processing/pages/add_user.dart';
import 'package:automated_elective_processing/pages/chooseElective.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class tempDash extends StatefulWidget {
  const tempDash({Key? key}) : super(key: key);

  @override
  State<tempDash> createState() => _tempDashState();
}

class _tempDashState extends State<tempDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Temp Dashboard"),),
      body: Column(children: [
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => addUser()));// re
        }, child: Text("Add User")),
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => chooseElective()));// re
        }, child: Text("Choose Elective")),
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => addElective()));// re
        }, child: Text("Add Elective")),


      ],),

    );
  }
}
