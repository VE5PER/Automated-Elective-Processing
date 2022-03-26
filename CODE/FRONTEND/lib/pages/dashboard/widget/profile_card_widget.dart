import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:automated_elective_processing/models/student.dart';
import 'package:flutter/material.dart';
import 'package:automated_elective_processing/common/app_colors.dart';

List eleChosen=[];

class ProfileCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
takeElectives();
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Image.asset(
                  "assets/graduated.png",
                  height: 60,
                  width: 60,
                ),
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  Text(
                    currentUser['S_NAME'].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(currentUser['S_ID'].toString()),
                ],
              )
            ],
          ),
          Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          eleChosen.length==0?profileListTile("No Elective(s) Chosen", 'NA'):Container(),

           for(var i in eleChosen)     profileListTile(i.toString(), "REG"),

         ElevatedButton(onPressed: () async {
           await takeElectives();
         }, child: Text("Temp Button"))


         // profileListTile("Elective 2", "B"),

        ],
      ),
    );
  }

  Widget profileListTile(text, value) {
    print(eleChosen);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          Text(
            value,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: AppColor.black),
          ),
        ],
      ),
    );
  }
}

Future<List> takeElectives() async {
  final response = await http.get(Uri.parse('http://localhost:8080/takeElectives'));

  if (response.statusCode == 200 || response.statusCode == 201) {

    var x =  jsonDecode(response.body);
    print(x);
    var electiveList = x["ElectiveList"];
    List elect = [];

    for(var i in electiveList){
      elect.add(i['ELECTIVE_ID']);

    }
    print(eleChosen);
   eleChosen=elect;
    return elect;

  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load elective list');
  }
}