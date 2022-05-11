import 'dart:convert';

import 'package:automated_elective_processing/common/app_colors.dart';
import 'package:automated_elective_processing/pages/add_elective.dart';
import 'package:automated_elective_processing/pages/add_user.dart';
import 'package:automated_elective_processing/pages/chooseElective.dart';
import 'package:automated_elective_processing/pages/admin_top_bar_contents.dart';
import 'package:automated_elective_processing/pages/responsive.dart';
import 'package:automated_elective_processing/pages/admin_menu_drawer.dart';
import 'package:automated_elective_processing/models/batches.dart';
import 'package:automated_elective_processing/models/elective.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../main.dart';

import '../functions/notify.dart';
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
  final addBatch = GlobalKey<FormState>();
  final TextEditingController batchSize = TextEditingController();
  final TextEditingController noOfBatches = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String txt = '';
    elem.insert(0,dropDownValue3);
    print(elem[0]);
    var screenSize = MediaQuery.of(context).size;
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
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          DropdownButton<String>(
                            value: dropDownValue3,
                            items: elem.map((String value) {
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
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(children: [
                        SizedBox(
                          width: 150.0,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter Batch Size',
                              label: Text('Batch Size'),
                            ),
                            controller: batchSize,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter batch';
                              }
                              return null;
                            },
                          ),
                        )
                      ]),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(children: [
                        SizedBox(
                            width: 150.0,
                            child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Enter Number of Batches',
                                  label: Text('No. Of Batches'),
                                ),
                                controller: noOfBatches,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter batch count';
                                  }
                                  return null;
                                }
                            ))
                      ]),
                    ),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: ElevatedButton(
                              onPressed: () async {
                                print(batchSize.text);
                                if (addBatch.currentState!.validate()) {
                                  Batches bat = Batches(
                                      dropDownValue,
                                      dropDownValue2,
                                      dropDownValue3,
                                      batchSize.text,
                                      noOfBatches.text);
                                  String json = jsonEncode(bat);
                                  print(json);
                                  String resp = await addbatches(json);
                                  if (resp.contains('ID is not available')) {
                                    showScreenDialog(context, 'ID is not available!!');
                                  } else {
                                    showScreenDialog(context, 'Added Successfully');
                                  }
                                }

                              },
                              child: Text('Submit')),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
Future<String> addbatches(String stu) async {
  final response = await http.post(
    Uri.parse(src + '/addBatches'),
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
Future<List> getElective() async {
  final response = await http.get(Uri.parse(src + '/getElectives'));

  if (response.statusCode == 200 || response.statusCode == 201) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var x = jsonDecode(response.body);
    var electiveList = x['ElectiveList'];
    List elect = [];

    for (var i in electiveList) {
      elect.add(
        i['ELECTIVE_ID'],
        // i['ELECTIVE_NAME'],
        // i['ELECTIVE_PDF_LINK'],
        // i['SEATS']
      );

      //elect.add(Elective(i['ELECTIVE_ID'], i['ELECTIVE_NAME'], i['ELECTIVE_PDF_LINK'], i['SEATS']));
    }
    elem = List<String>.from(elect);
    return elect;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load elective list');
  }
}
