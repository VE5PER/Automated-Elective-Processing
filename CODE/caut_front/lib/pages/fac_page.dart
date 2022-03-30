import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:automated_elective_processing/pages/logout.dart';
import 'package:automated_elective_processing/pages/workflow.dart';
import 'dart:js';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Faculty Dashboard',
      theme: ThemeData(
        //
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FACULTY DASHBOARD')),
      drawer: Sidenav(navIndex, (int index) {
        setState(() {
          navIndex = index;
        });
      }),
      body: Builder(
        // ignore: missing_return
        builder: (context) {
          switch (navIndex) {
            case 0:
              /*Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TableSimple(
                            data: [],
                            titleColumn: [
                              'Topic 1',
                              'Topic 2',
                              'Topic 3',
                              'Topic 4',
                              'Topic 5',
                            ],
                            titleRow: [
                              'Day 1',
                              'Day 2',
                              'Day 3',
                              'Day 4',
                              'Day 5'
                            ],
                          )));
              break;*/

            case 1:
              return Center(child: Text('VIEW STUDENTS'));
            case 2:
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => logout()));
              break;
            default:
              return Home();
          }
          return Home();
        },
      ),
    );
  }
}

class Sidenav extends StatelessWidget {
  final Function setIndex;
  final int selectedIndex;

  Sidenav(this.selectedIndex, this.setIndex);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('DASHBOARD',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 21)),
          ),
          Divider(color: Colors.grey.shade400),
          _navItem(context, Icons.work, 'Workflow',
              suffix: Text(
                '',
                style: TextStyle(fontWeight: FontWeight.w500),
              ), onTap: () {
            _navItemClicked(context, 0);
          }, selected: selectedIndex == 0),
          _navItem(context, Icons.view_column, 'View Students',
              suffix: Text(
                '',
                style: TextStyle(fontWeight: FontWeight.w500),
              ), onTap: () {
            _navItemClicked(context, 1);
          }, selected: selectedIndex == 1),
          _navItem(context, Icons.logout, 'Logout',
              suffix: Text(
                '',
                style: TextStyle(fontWeight: FontWeight.w500),
              ), onTap: () {
            _navItemClicked(context, 2);
          }, selected: selectedIndex == 2),
        ],
      ),
    );
  }

  _navItem(BuildContext context, IconData icon, String text,
          {required Text suffix,
          required Function onTap,
          bool selected = false}) =>
      Container(
        color: selected ? Colors.grey.shade300 : Colors.transparent,
        child: ListTile(
          leading: Icon(icon,
              color: selected ? Theme.of(context).primaryColor : Colors.black),
          trailing: suffix,
          title: Text(text),
          selected: selected,
        ),
      );

  _navItemClicked(BuildContext context, int index) {
    setIndex(index);
    Navigator.of(context).pop();
  }
}
