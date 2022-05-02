import 'package:automated_elective_processing/functions/notify.dart';
import 'package:automated_elective_processing/models/faculty.dart';
import 'package:automated_elective_processing/common/app_colors.dart';
import 'package:flutter/cupertino.dart';
import '../../../main.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'dashboard_temp.dart';

class addFaculty extends StatefulWidget {
  const addFaculty({Key? key}) : super(key: key);

  @override
  State<addFaculty> createState() => _addFacultyState();
}

class _addFacultyState extends State<addFaculty> {
  @override
  Widget build(BuildContext context) {
    String txt = '';
    final TextEditingController FACULTY_ID = TextEditingController();
    final TextEditingController PASSWORD = TextEditingController();
    final TextEditingController FACULTY_NAME = TextEditingController();
    final TextEditingController FACULTY_DOJ = TextEditingController();
    final TextEditingController FACULTY_POS = TextEditingController();
    final TextEditingController USER_NAME = TextEditingController();
    final TextEditingController E_MAIL = TextEditingController();
    final addFaculty = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Faculty",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColor.yellow,
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
        backgroundColor: AppColor.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => tempDash()));
          },
        ),
      ),
      backgroundColor: AppColor.purple,
      body: Row(
        children: [
          Expanded(
            child: Container(),
            flex: 1,
          ),
          Expanded(
            flex: 2,
            child: Form(
              key: addFaculty,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: AppColor.yellow,
                      ),
                      label: Text(
                        "Enter Faculty ID",
                        style: TextStyle(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    controller: FACULTY_ID,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Faculty ID';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: AppColor.yellow,
                      ),
                      label: Text(
                        "Enter Faculty PASSWORD",
                        style: TextStyle(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Password';
                      }
                      return null;
                    },
                    controller: PASSWORD,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: AppColor.yellow,
                      ),
                      label: Text(
                        "Enter Faculty NAME",
                        style: TextStyle(
                            color: AppColor.yellow,
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
                    controller: FACULTY_NAME,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.numbers_rounded,
                        color: AppColor.yellow,
                      ),
                      label: Text(
                        "Enter Faculty DOJ",
                        style: TextStyle(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter DOJ';
                      }
                      return null;
                    },
                    controller: FACULTY_DOJ,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.numbers_rounded,
                        color: AppColor.yellow,
                      ),
                      label: Text(
                        "Enter Faculty Position",
                        style: TextStyle(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the Position';
                      }
                      return null;
                    },
                    controller: FACULTY_POS,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.verified_user,
                        color: AppColor.yellow,
                      ),
                      label: Text(
                        "Enter Faculty USER_NAME",
                        style: TextStyle(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter USER_NAME';
                      }
                      return null;
                    },
                    controller: USER_NAME,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: AppColor.yellow,
                      ),
                      label: Text(
                        "Enter Faculty E_MAIL",
                        style: TextStyle(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter E_MAIL';
                      }
                      return null;
                    },
                    controller: E_MAIL,
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                      onPressed: () async {
                        if (addFaculty.currentState!.validate()) {
                          Faculty fac = Faculty(
                              FACULTY_ID.text,
                              PASSWORD.text,
                              FACULTY_NAME.text,
                              FACULTY_DOJ.text,
                              FACULTY_POS.text,
                              USER_NAME.text,
                              E_MAIL.text);
                          String json = jsonEncode(fac);
                          print(json);
                          String resp = await addTeacher(json);

                          if (resp.contains("ID is not available")) {
                            showScreenDialog(context, 'ID is not available!!');
                          } else {
                            showScreenDialog(context, "Added Successfully");
                          }
                          //showScreenDialog(context, resp);

                        }
                      },
                      child: Text("SUBMIT")),
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

Future<String> addTeacher(String stu) async {
  final response = await http.post(
    Uri.parse(src + '/addFaculty'),
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
    throw Exception('Failed to add Faculty.');
  }
}
