import 'package:automated_elective_processing/functions/notify.dart';
import 'package:automated_elective_processing/models/elective.dart';
import 'package:automated_elective_processing/common/app_colors.dart';
import 'package:automated_elective_processing/pages/dashboard_temp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../main.dart';

class addElective extends StatefulWidget {
  const addElective({Key? key}) : super(key: key);

  @override
  State<addElective> createState() => _addElectiveState();
}

class _addElectiveState extends State<addElective> {
  @override
  Widget build(BuildContext context) {
    String txt = '';
    final TextEditingController ELECTIVE_ID = TextEditingController();
    final TextEditingController ELECTIVE_NAME = TextEditingController();
    final TextEditingController ELECTIVE_PDF_LINK = TextEditingController();
    final TextEditingController SEATS = TextEditingController();
    final addElective = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => tempDash()));
          },
        ),
        title: Text(
          'Add Elective',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColor.purple,
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
        backgroundColor: AppColor.black,
      ),
      backgroundColor: AppColor.green,
      body: Row(
        children: [
          Expanded(
            child: Container(),
            flex: 1,
          ),
          Expanded(
            flex: 2,
            child: Form(
              key: addElective,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: AppColor.purple,
                      ),
                      label: Text(
                        'Enter Elective ID',
                        style: TextStyle(
                            color: AppColor.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Elective ID';
                      }
                      return null;
                    },
                    controller: ELECTIVE_ID,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: AppColor.purple,
                      ),
                      label: Text(
                        'Enter Elective Name',
                        style: TextStyle(
                            color: AppColor.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Name';
                      }
                      return null;
                    },
                    controller: ELECTIVE_NAME,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: AppColor.purple,
                      ),
                      label: Text(
                        'Give Elective reference Link',
                        style: TextStyle(
                            color: AppColor.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter ref Link';
                      }
                      return null;
                    },
                    controller: ELECTIVE_PDF_LINK,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: AppColor.purple,
                      ),
                      label: Text(
                        'Enter the Number of seats',
                        style: TextStyle(
                            color: AppColor.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Number of seats';
                      }
                      return null;
                    },
                    controller: SEATS,
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                      onPressed: () async {
                        if (addElective.currentState!.validate()) {
                          Elective course = Elective(
                              ELECTIVE_ID.text,
                              ELECTIVE_NAME.text,
                              ELECTIVE_PDF_LINK.text,
                              SEATS.text);
                          String json = jsonEncode(course);
                          String resp = await addElectiveFn(json);

                          if (resp.contains('ID is not available')) {
                            showScreenDialog(context, 'ID is not available!!');
                          } else {
                            showScreenDialog(context, 'Added Successfully');
                          }
                        }
                      },
                      child: Text('SUBMIT')),
                  Text(txt),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(),
            flex: 1,
          ),
        ],
      ),
    );
  }
}

Future<String> addElectiveFn(String stu) async {
  final response = await http.post(
    Uri.parse(src + '/addElective'),
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
    throw Exception('Failed to add Elective.');
  }
}
