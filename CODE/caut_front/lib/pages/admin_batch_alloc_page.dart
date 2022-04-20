import 'package:automated_elective_processing/common/app_colors.dart';
import 'package:automated_elective_processing/pages/add_elective.dart';
import 'package:automated_elective_processing/pages/add_user.dart';
import 'package:automated_elective_processing/pages/chooseElective.dart';
import 'package:automated_elective_processing/pages/admin_top_bar_contents.dart';
import 'package:automated_elective_processing/pages/responsive.dart';
import 'package:automated_elective_processing/pages/admin_menu_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'logout.dart';

class batchAlloc extends StatefulWidget {
  const batchAlloc({Key? key}) : super(key: key);


  @override
  State<batchAlloc> createState() => _batchAllocState();
}

class _batchAllocState extends State<batchAlloc> {
  String dropDownValue = 'Select Year';
  String dropDownValue2 = 'Select Semester';
  String dropDownValue3 = 'Select Elective';
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(title: Text("Admin Dashboard", textAlign: TextAlign.center, style: TextStyle(color: AppColor.yellow, fontWeight: FontWeight.bold, fontSize: 30),),backgroundColor: AppColor.purple,),
        appBar: ResponsiveWidget.isSmallScreen(context)?
        AppBar(
          iconTheme: IconThemeData(color: Color(0xFF077bd7)),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Admin",
            style: TextStyle(
              color: Color(0xFF077bd7),
              fontSize: 26,
              fontWeight: FontWeight.w900,
            ),
          ),
        ):
        PreferredSize(
          preferredSize: Size(screenSize.width, 70),
          child:AdminTopBarContents(),
        ),
        drawer: MenuDrawer(),
        backgroundColor: AppColor.yellow,
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: 25
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              Column(
                children: [
                  DropdownButton<String>(
                    value: dropDownValue,
                    items: <String>['Select Year','1', '2', '3', '4'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  )
                ],
          ),
                  Column(
                    children: [
                      DropdownButton<String>(
                        value: dropDownValue2,
                        items: <String>['Select Semester','1', '2', '3', '4'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      )
                    ],
                  ),
          ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              Column(
              children: [
              DropdownButton<String>(
                value: dropDownValue3,
                items: <String>['Select Elective','bla', 'abl', 'lab', 'bal'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              )
            ],
          ),
                  Column(
                    children:[
                      SizedBox(
                          width: 150.0,
                          child: TextField(
                              style: TextStyle(
                                  fontSize: 20.0,
                                  height: 1.0,
                                  color: Colors.black
                              ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Batch Size',
                              hintText: 'Batch Size',
                            ),
                          )
                      )
                    ]
                  ),
                  Column(
                      children:[
                        SizedBox(
                            width: 200.0,
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 20.0,
                                  height: 0.8,
                                  color: Colors.black
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Number of Batches',
                                hintText: 'Total Batches',
                              ),
                            )
                        )
                      ]
                  )
          ],
              ),
            ],
          ),
        )

    );
  }
}
