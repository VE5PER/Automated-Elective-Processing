


import 'package:automated_elective_processing/pages/fac_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class changeElective extends StatefulWidget {
  const changeElective({Key? key}) : super(key: key);

  @override
  State<changeElective> createState() => _changeElectiveState();
}

class _changeElectiveState extends State<changeElective> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Change Elective'),
    ),);
  }
}
