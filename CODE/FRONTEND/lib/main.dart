import 'dart:convert';

import 'package:automated_elective_processing/dashboard.dart';
import 'package:automated_elective_processing/functions/notify.dart';
import 'package:automated_elective_processing/models/student.dart';
import 'package:automated_elective_processing/pages/add_user.dart';
import 'package:automated_elective_processing/pages/chooseElective.dart';
import 'package:automated_elective_processing/pages/dashboard/widget/profile_card_widget.dart';
import 'package:automated_elective_processing/pages/dashboard_temp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List ele=[];


void main() => runApp(const login());

class login extends StatelessWidget {
  const login();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SignUpScreen(),
        '/welcome': (context) => WelcomeScreen(),
      },
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen();

  @override
  Widget build(BuildContext context) {
getElectives();
    return Scaffold(
      backgroundColor: Colors.amber,
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
            child: loginform(),
          ),
        ),
        ]
        ),
        );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('WELCOME!', style: Theme.of(context).textTheme.headline2),
      ),
    );
  }
}

class loginform extends StatefulWidget {
  const loginform();

  @override
  _loginformState createState() => _loginformState();
}

class _loginformState extends State<loginform> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  double _formProgress = 0;
  final login = GlobalKey<FormState>();

  void _showWelcomeScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => dashboard()));// redirect to dashboard student or faculty //
  }

  void _addStudent() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => addUser()));// redirect to dashboard student or faculty //
  }

  void _adminDash() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => tempDash()));// redirect to dashboard student or faculty //
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: login,
      child: Container(
        padding: EdgeInsets.only(bottom: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Text('Login', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 30)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _username,
                decoration: const InputDecoration(hintText: 'Username'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter USERNAME';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _password,
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Password'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Password';
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
                      : Colors.white;
                }),
                backgroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  return states.contains(MaterialState.disabled)
                      ? null
                      : Colors.blueAccent;
                }),
              ),
              onPressed:() async {
                if(_username.text=='admin' && _password.text=='admin'){
                  _adminDash();
                }
                else if(login.currentState!.validate()){
                  String loginJson='''{
                      "S_ID":"${_username.text}",
                      "PASSWORD":"${_password.text}"
                      }
                  ''';
                  String status = await validateUser(loginJson);
                  print(status);

                  if(status.contains('ID or Password Incorrect')){
                    showScreenDialog(context, 'ID or Password Incorrect');
                  }

                  else {
                    //instantiate user here
                    final parsedStudent = jsonDecode(status);

                   currentUser= parsedStudent;
                       //Student(parsedStudent['S_ID'], parsedStudent['PASSWORD'], parsedStudent['S_NAME'], parsedStudent['YEAR'], parsedStudent['SEMESTER'], parsedStudent['USER_NAME'], parsedStudent['E_MAIL']);
                    print(currentUser);
                    _username.clear();
                    _password.clear();
                    await takeElectives();



                    _showWelcomeScreen();
                  }


                }
              },
              child: const Text('Login'),
            ),
            IconButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => dashboard()));
            }, icon: Icon(Icons.dashboard))
          ],
        ),
      ),
    );
  }
}


Future<String> validateUser(String stu) async {
  final response = await http.post(
    Uri.parse('http://localhost:8080/signin'),
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
    throw Exception('Login error');

  }
}
