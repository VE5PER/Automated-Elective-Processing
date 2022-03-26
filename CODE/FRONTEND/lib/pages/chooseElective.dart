import 'dart:convert';

import 'package:automated_elective_processing/models/elective.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class chooseElective extends StatefulWidget {
  const chooseElective({Key? key}) : super(key: key);

  @override
  State<chooseElective> createState() => _chooseElectiveState();
}

class _chooseElectiveState extends State<chooseElective> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Choose Electives"),
      actions: [
        ElevatedButton(
          child: Icon(Icons.access_alarm),
          onPressed: () async {
             setState(() async {
               ele = await getElectives();
             });
          },
        )
      ],),

      body: ele.length>0?Container(
        padding: EdgeInsets.all(20),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: ele.length,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Elective ID: ${ele[index][0]}'),
                    Text('Ref Link: ${ele[index][1]}'),
                    Text('Elective Name: ${ele[index][2]}'),
                    Text('No of Seats: ${ele[index][3]}'),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)),
              );
            }),
      ):Container(),




    );
  }
}

Future<List> getElectives() async {
  final response = await http.get(Uri.parse('http://localhost:8080/getElectives'));

  if (response.statusCode == 200 || response.statusCode == 201) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var x =  jsonDecode(response.body);
    var electiveList = x["ElectiveList"];
    List elect = [];

    for(var i in electiveList){
      elect.add([i['ELECTIVE_ID'], i['ELECTIVE_NAME'], i['ELECTIVE_PDF_LINK'],i['SEATS']]);

    //elect.add(Elective(i['ELECTIVE_ID'], i['ELECTIVE_NAME'], i['ELECTIVE_PDF_LINK'], i['SEATS']));
    }
    ele=elect;
    return elect;

  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load elective list');
  }
}
