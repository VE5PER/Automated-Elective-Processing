import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:automated_elective_processing/dashboard.dart';
import 'package:automated_elective_processing/functions/notify.dart';
import 'package:automated_elective_processing/common/app_colors.dart';
import 'package:flutter/material.dart';

class change_pwd extends StatelessWidget {
  const change_pwd();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text
      ("Change Password",  
      textAlign: TextAlign.center, 
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: AppColor.yellow),),
      ),
      backgroundColor: AppColor.purple,
      body:  Column(
          children: [
          Center(
           child:SizedBox(
            height: 400,
            width: 400,
            child: Image.asset('assets/notification_image.png'),
          ),),
          SizedBox(
          width: 400,
          child: Card(
            child: changeform(),
          ),
        ),
        ]
        ),
        );
  }
}

class changeform extends StatefulWidget {
  const changeform();

  @override
  _changeformState createState() => _changeformState();
}

class _changeformState extends State<changeform> {
  final _oldpwd = TextEditingController();
  final _newpwd = TextEditingController();
  double _formProgress = 0;
  final pwdform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: pwdform,
      child: Container(
        padding: EdgeInsets.only(bottom: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Text('Welcome', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 30)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _oldpwd,
                decoration: const InputDecoration(hintText: 'old password'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter old password';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _newpwd,
                obscureText: true,
                decoration: const InputDecoration(hintText: 'New Password'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter new Password';
                  }
                  else if( value.length < 8){
                    return 'Please enter a longer password';
                  }
                  return null;
                },
              ),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  return states.contains(MaterialState.disabled)
                      ? null
                      : AppColor.yellow;
                }),
                backgroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  return states.contains(MaterialState.disabled)
                      ? null
                      : AppColor.bgSideMenu;
                }),
              ),
              onPressed:() async {
                if(pwdform.currentState!.validate()){
                  String changepwdJson='''{
                      "S_ID":"${_oldpwd.text}",
                      "PASSWORD":"${_newpwd.text}"
                      }
                  ''';
                  String status = await pwdchange(changepwdJson);
                  print(status);

                  if(status.contains('ID or Password Incorrect')){
                    showScreenDialog(context, 'ID or Password Incorrect');
                  }
                }
              },
              child: const Text('Change'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> pwdchange(String stu) async {
  final response = await http.post(
    Uri.parse('http://localhost:8080/change_pwd'),
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
    throw Exception('Change error');

  }
}
