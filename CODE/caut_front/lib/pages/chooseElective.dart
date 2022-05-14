import 'dart:convert';

import 'package:automated_elective_processing/dashboard.dart';
import 'package:automated_elective_processing/functions/notify.dart';
import 'package:automated_elective_processing/models/student.dart';
import 'package:automated_elective_processing/pages/dashboard/widget/profile_card_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../globals.dart';
import '../main.dart';

List eleIds = [];
List eleSeats = [];

class chooseElective extends StatefulWidget {
  const chooseElective({Key? key}) : super(key: key);

  @override
  State<chooseElective> createState() => _chooseElectiveState();
}

class _chooseElectiveState extends State<chooseElective> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          print(eleIds);

          if (eleIds.isEmpty) {
            showScreenDialog(context, 'Please choose something!!');
          } else {
            int success = 1;
            // for (var i in eleIds) {
            //   String electiveJson = '''{
            //           "S_ID":"${currentUser["S_ID"]}",
            //           "ELECTIVE_ID":"${i.toString()}"
            //           }
            //       ''';
            //   String status = await setElective(electiveJson);
            //   print(status);
            //   if (status.contains('Already Registered')) {
            //     showScreenDialog(context, 'Already Registered');
            //     success = 0;
            //     break;
            //   }
            // }
            for (var i = 0; i < eleIds.length; i++) {
              String electiveJson = '''{
                      "S_ID":"${currentUser["S_ID"]}",
                      "ELECTIVE_ID":"${eleIds[i].toString()}"
                      }
                  ''';
              String seatsJson = '''{
                      "ELECTIVE_ID":"${eleIds[i].toString()}",
                      "newSeat":"${eleSeats[i]}"
                      }
                  ''';
              String status = await setElective(electiveJson);
              print(status);
              if (status.contains('Already Registered')) {
                showScreenDialog(context, 'Already Registered');
                success = 0;
                break;
              } else {
                seatChange(seatsJson);
              }
            }
            if (success == 1) {
              showScreenDialog(context, 'Successfully registered');

              eleIds.clear();
              await takeElectives();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => dashboard()));
            }
          }
        },
        label: Text('Confirm Selection'),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => dashboard()));
          },
        ),

        actions: [
          Text('Time left to Choose: ', style:  TextStyle(
              color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold),),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: CountdownTimer(
              endTime:
                  DateTime.parse('2022-05-17 08:00:00').millisecondsSinceEpoch,
              textStyle: TextStyle(
                  color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
        ],

         
        title: Text('Choose Electives'),
      ),
      body: eleDisplay.length > 0
          ? Container(
            padding: EdgeInsets.all(20),
            child: GridView.builder(
                gridDelegate:
                    const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: eleDisplay.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                       onTap: () {
                         if(currentUser['ELECTIVE_REM']- eleChosen.length) {
                           print(currentUser['ELECTIVE_REM']);
                           setState(() {
                             if (eleIds.contains(eleDisplay[index][0])) {
                               eleIds.remove(eleDisplay[index][0]);
                               var temp = int.parse(eleDisplay[index][3]);
                               temp = temp - 1;
                               String temp1 = temp.toString();
                               eleSeats.remove(temp1);
                             } else {
                               eleIds.add(eleDisplay[index][0]);
                               var temp = int.parse(eleDisplay[index][3]);
                               temp = temp - 1;
                               String temp1 = temp.toString();
                               eleSeats.add(temp1);
                             }
                           });
                         }
                         else {
                           showScreenDialog(context, 'Elective Limit Reached');
                         }
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Elective ID: ${eleDisplay[index][0]}'),
                          Text('Elective Name: ${eleDisplay[index][1]}'),
                          Text('Ref link: ${eleDisplay[index][2]}'),
                          Text('No of Seats: ${eleDisplay[index][3]}'),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: eleIds.contains(eleDisplay[index][0])
                              ? Colors.red
                              : Colors.amber,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  );
                }),
          )
          : Container(),
    );
  }
}

Future<List> getElectives() async {
  final response = await http.get(Uri.parse(src + '/getElectives'));

  if (response.statusCode == 200 || response.statusCode == 201) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    eleDisplay = [];
    var x = jsonDecode(response.body);
    var electiveList = x['ElectiveList'];
    electAll = [];
    for (var i in electiveList) {
      electAll.add([
        i['ELECTIVE_ID'],
        i['ELECTIVE_NAME'],
        i['ELECTIVE_PDF_LINK'],
        i['SEATS']
      ]);

      //elect.add(Elective(i['ELECTIVE_ID'], i['ELECTIVE_NAME'], i['ELECTIVE_PDF_LINK'], i['SEATS']));
    }
    for (int i = 0; i < electAll.length; i++) {
      if ((electAll[i].toSet().intersection(eleChosen.toSet()).length) == 0) {
        eleDisplay.add(electAll[i]);
      }
    }

    //eleDisplay = electAll;
    return electAll;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load elective list');
  }
}

Future<String> setElective(String stu) async {
  final response = await http.post(
    Uri.parse(src + '/StudentElective'),
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
    throw Exception('Elective Add error');
  }
}

Future<String> seatChange(String stu) async {
  final response = await http.post(
    Uri.parse(src + '/updateSeats'),
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
