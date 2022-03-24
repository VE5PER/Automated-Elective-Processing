import 'package:automated_elective_processing/functions/notify.dart';
import 'package:automated_elective_processing/pages/add_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: dashBoard(),
  debugShowCheckedModeBanner: false,));
}

class dashBoard extends StatefulWidget {
  const dashBoard({Key? key}) : super(key: key);

  @override
  State<dashBoard> createState() => _dashBoardState();
}

class _dashBoardState extends State<dashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          IconButton(
            icon: Icon(Icons.ac_unit_sharp),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => addUser()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.access_alarm ),
            onPressed: () {
              showScreenDialog(context, "Notify");
            },
          ),
        ],
      ),
    );
  }
}
