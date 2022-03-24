import 'package:dashboard/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/dashboard.dart';

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
      backgroundColor: AppColor.bgSideMenu,
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
  final _passwaord = TextEditingController();
  double _formProgress = 0;
  void _updateFormProgress() {
    var progress = 0.0;
    final controllers = [
      _username,
      _passwaord,
    ];

    for (final controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  void _showWelcomeScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => dashboard()));// redirect to dashboard student or faculty //
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: _updateFormProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(value: _formProgress),
          Text('Welcome', style: Theme.of(context).textTheme.headline4),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _username,
              decoration: const InputDecoration(hintText: 'username'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _passwaord,
              obscureText: true,
              decoration: const InputDecoration(hintText: 'password'),
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
            onPressed: _formProgress == 1 ? _showWelcomeScreen : null,
            child: const Text('login'),
          ),
        ],
      ),
    );
  }
}
