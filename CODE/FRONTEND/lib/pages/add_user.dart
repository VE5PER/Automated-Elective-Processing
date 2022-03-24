import 'package:automated_elective_processing/functions/notify.dart';
import 'package:automated_elective_processing/models/student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class addUser extends StatefulWidget {
  const addUser({Key? key}) : super(key: key);

  @override
  State<addUser> createState() => _addUserState();
}

class _addUserState extends State<addUser> {
  @override
  Widget build(BuildContext context) {
    String txt='';
    final TextEditingController S_ID = TextEditingController();
    final TextEditingController PASSWORD = TextEditingController();
    final TextEditingController S_NAME = TextEditingController();
    final TextEditingController YEAR = TextEditingController();
    final TextEditingController SEMESTER = TextEditingController();
    final TextEditingController USER_NAME = TextEditingController();
    final TextEditingController E_MAIL = TextEditingController();
    final addUser = GlobalKey<FormState>();
    return Scaffold(
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
                      icon: Icon(Icons.person),
                      label: Text("Enter Student ID"),
                    ),
                    controller: S_ID,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      label: Text("Enter Student PASSWORD"),
                    ),
                    controller: PASSWORD,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      label: Text("Enter Student NAME"),
                    ),
                    controller: S_NAME,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      label: Text("Enter Student YEAR"),
                    ),
                    controller: YEAR,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      label: Text("Enter Student SEMESTER"),
                    ),
                    controller: SEMESTER,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      label: Text("Enter Student USER_NAME"),
                    ),
                    controller: USER_NAME,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      label: Text("Enter Student E_MAIL"),
                    ),
                    controller: E_MAIL,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (addUser.currentState!.validate()) {
                          setState(() async {
                           Student user =  Student(S_ID.text,PASSWORD.text,S_NAME.text,YEAR.text,SEMESTER.text,USER_NAME.text,E_MAIL.text);
                           String json = jsonEncode(user);
                           String resp =await addStudent(json);
                           showScreenDialog(context, resp==''?resp:"HTTP Error");


                          });
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
    Uri.parse('http://localhost:8080/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: stu,
  );
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return response.body.toString();
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to add student.');

  }
}
