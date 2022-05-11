import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:automated_elective_processing/pages/admin_top_bar_contents.dart';
import 'package:automated_elective_processing/common/app_colors.dart';
import 'package:automated_elective_processing/pages/admin_menu_drawer.dart';
import 'package:automated_elective_processing/models/sem_elective.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../functions/notify.dart';
import '../main.dart';
class semElective extends StatefulWidget {
  const semElective({Key? key}) : super(key: key);

  @override
  State<semElective> createState() => _semElectiveState();
}

class _semElectiveState extends State<semElective> {
  String dropDownValue = 'Select Year';
  String dropDownValue2 = 'Select Semester';
  String dropDownValue3 = 'Select No. of Electives';
  final addBatch = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Admin Dashboard", textAlign: TextAlign.center, style: TextStyle(color: AppColor.yellow, fontWeight: FontWeight.bold, fontSize: 30),),backgroundColor: AppColor.purple,),
        appBar:  AppBar(
          iconTheme: IconThemeData(color: Color(0xFF077bd7)),

          toolbarHeight: 120,
          flexibleSpace: Container(child: AdminTopBarContents(),),
        )
        ,
        drawer: MenuDrawer(),
        backgroundColor: AppColor.yellow,
        body: Center(
          child: Form(
            key: addBatch,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        DropdownButton<String>(
                          value: dropDownValue,
                          items: <String>['Select Year', '1', '2', '3', '4']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue = newValue!;
                            });
                          },
                        )
                      ],
                    ),
                    Column(
                      children: [
                        DropdownButton<String>(
                          value: dropDownValue2,
                          items: <String>['Select Semester', '1', '2', '3', '4','5','6','7','8']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue2 = newValue!;
                            });
                          },
                        )
                      ],
                    ),
                    Column(
                      children: [
                        DropdownButton<String>(
                          value: dropDownValue3,
                          items: <String>['Select No. of Electives', '1', '2', '3', '4','5']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue3 = newValue!;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if (addBatch.currentState!.validate()) {
                                      SemElective bat = SemElective(
                                          dropDownValue,
                                          dropDownValue2,
                                          dropDownValue3,
                                      );
                                      String json = jsonEncode(bat);
                                      print(json);
                                      String resp = await addSemElective(json);
                                      if (resp.contains('ID is not available')) {
                                        showScreenDialog(context, 'ID is not available!!');
                                      } else {
                                        showScreenDialog(context, 'Added Successfully');
                                      }
                                    }

                                  },
                                  child: Text('Submit')),
                            )),
                      ],
                    )
                  ],
                ),
            ),
          ),
        );
  }
}
Future<String> addSemElective(String stu) async {
  final response = await http.post(
    Uri.parse(src + '/addSemElective'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: stu,
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return response.body.toString();
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to add Batches.');
  }
}
