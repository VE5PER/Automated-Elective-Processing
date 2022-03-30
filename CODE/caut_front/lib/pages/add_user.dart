import 'package:automated_elective_processing/functions/notify.dart';
import 'package:automated_elective_processing/models/student.dart';
import 'package:automated_elective_processing/common/app_colors.dart';
import 'package:flutter/cupertino.dart';
import '../../../main.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'dashboard_temp.dart';

class addUser extends StatefulWidget {
  const addUser({Key? key}) : super(key: key);

  @override
  State<addUser> createState() => _addUserState();
}

class _addUserState extends State<addUser> {
  @override
  Widget build(BuildContext context) {
    String txt = '';
    final TextEditingController S_ID = TextEditingController();
    final TextEditingController PASSWORD = TextEditingController();
    final TextEditingController S_NAME = TextEditingController();
    final TextEditingController YEAR = TextEditingController();
    final TextEditingController SEMESTER = TextEditingController();
    final TextEditingController USER_NAME = TextEditingController();
    final TextEditingController E_MAIL = TextEditingController();
    final addUser = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add User",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColor.yellow,
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
        backgroundColor: AppColor.black,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {

          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => tempDash()));
        }, ),
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
              key: addUser,
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
                        "Enter Student ID",
                        style: TextStyle(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    controller: S_ID,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Student ID';
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
                        "Enter Student PASSWORD",
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
                        "Enter Student NAME",
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
                    controller: S_NAME,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.numbers_rounded,
                        color: AppColor.yellow,
                      ),
                      label: Text(
                        "Enter Student YEAR",
                        style: TextStyle(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Year';
                      }
                      return null;
                    },
                    controller: YEAR,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.numbers_rounded,
                        color: AppColor.yellow,
                      ),
                      label: Text(
                        "Enter Student SEMESTER",
                        style: TextStyle(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Semester';
                      }
                      return null;
                    },
                    controller: SEMESTER,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.verified_user,
                        color: AppColor.yellow,
                      ),
                      label: Text(
                        "Enter Student USER_NAME",
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
                        "Enter Student E_MAIL",
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
                        if (addUser.currentState!.validate()) {
                          Student user = Student(
                              S_ID.text,
                              PASSWORD.text,
                              S_NAME.text,
                              YEAR.text,
                              SEMESTER.text,
                              USER_NAME.text,
                              E_MAIL.text);
                          String json = jsonEncode(user);
                          print(json);
                          String resp = await addStudent(json);

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

Future<String> addStudent(String stu) async {
  final response = await http.post(
    Uri.parse(src + '/signup'),
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
    throw Exception('Failed to add student.');
  }
}
