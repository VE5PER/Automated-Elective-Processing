import 'package:automated_elective_processing/functions/notify.dart';
import 'package:automated_elective_processing/models/elective.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class addElective extends StatefulWidget {
  const addElective({Key? key}) : super(key: key);

  @override
  State<addElective> createState() => _addElectiveState();
}

class _addElectiveState extends State<addElective> {
  @override
  Widget build(BuildContext context) {
    String txt='';
    final TextEditingController ELECTIVE_ID = TextEditingController();
    final TextEditingController ELECTIVE_NAME = TextEditingController();
    final TextEditingController ELECTIVE_PDF_LINK = TextEditingController();
    final addElective = GlobalKey<FormState>();
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
              key: addElective,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      label: Text("Enter Elective ID"),
                    ),
                    controller: ELECTIVE_ID,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      label: Text("Enter Elective Name"),
                    ),
                    controller: ELECTIVE_NAME,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      label: Text("Give Elective PDF Link"),
                    ),
                    controller: ELECTIVE_PDF_LINK,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (addElective.currentState!.validate()) {
                          setState(() async {
                            Elective course =  Elective(ELECTIVE_ID.text,ELECTIVE_NAME.text,ELECTIVE_PDF_LINK.text);
                            String json = jsonEncode(course);
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


Future<String> addElective(String stu) async {
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
