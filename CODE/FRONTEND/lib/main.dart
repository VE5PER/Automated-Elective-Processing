import 'package:automated_elective_processing/pages/add_user.dart';
import 'package:automated_elective_processing/pages/dashboard_temp.dart';
import 'package:flutter/material.dart';

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
        child: Text('Welcome!', style: Theme.of(context).textTheme.headline2),
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => tempDash()));// redirect to dashboard student or faculty //
  }

  void _addStudent() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => addUser()));// redirect to dashboard student or faculty //
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: Form(
        key: login,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LinearProgressIndicator(value: _formProgress),
            Text('Welcome', style: Theme.of(context).textTheme.headline4),
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
              onPressed:() {
                if(_username.text=='admin' && _password.text=='admin'){
                  _addStudent();
                }
                else if(login.currentState!.validate()){
                  _showWelcomeScreen();
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
