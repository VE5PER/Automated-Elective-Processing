import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dashboard.dart';
import '../functions/notify.dart';
import '../globals.dart';

class changeElective extends StatefulWidget {
  const changeElective({Key? key}) : super(key: key);

  @override
  State<changeElective> createState() => _changeElectiveState();
}

class _changeElectiveState extends State<changeElective> {
  @override
  Widget build(BuildContext context) {
    List already=[];
    for(int i = 0;i<electAll.length;i++){
      if(eleChosen.contains(electAll[i][0])){
        already.add(electAll[i]);
      }
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Change Elective'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => dashboard()));
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        'Electives Chosen',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.height * 0.4,
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: already.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return InkWell(
                              onTap: () {
                                if (currentUser['ELECTIVE_REM'] -
                                    eleChosen.length) {
                                  print(currentUser['ELECTIVE_REM']);
                                  setState(() {
                                    /*
                        if (eleIds.contains(electAll[index][0])) {
                          eleIds.remove(electAll[index][0]);
                          var temp = int.parse(electAll[index][3]);
                          temp = temp - 1;
                          String temp1 = temp.toString();
                          eleSeats.remove(temp1);
                        } else {
                          eleIds.add(electAll[index][0]);
                          var temp = int.parse(electAll[index][3]);
                          temp = temp - 1;
                          String temp1 = temp.toString();
                          eleSeats.add(temp1);
                        } */
                                  });
                                } else {
                                  showScreenDialog(
                                      context, 'Elective Limit Reached');
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Elective ID: ${already[index][0]}'),
                                    Text(
                                        'Elective Name: ${already[index][1]}'),
                                    Text('Ref link: ${already[index][2]}'),
                                    Text('No of Seats: ${already[index][3]}'),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color:
                                        true //eleIds.contains(electAll[index][0])
                                            ? Colors.red
                                            : Colors.amber,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
              Expanded(
                child: VerticalDivider(
                  color: Colors.white,
                  thickness: 3,
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        'Electives Available',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.height * 0.4,
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
                                if (currentUser['ELECTIVE_REM'] -
                                    eleChosen.length) {
                                  print(currentUser['ELECTIVE_REM']);
                                  setState(() {
                                    /*
                        if (eleIds.contains(electAll[index][0])) {
                          eleIds.remove(electAll[index][0]);
                          var temp = int.parse(electAll[index][3]);
                          temp = temp - 1;
                          String temp1 = temp.toString();
                          eleSeats.remove(temp1);
                        } else {
                          eleIds.add(electAll[index][0]);
                          var temp = int.parse(electAll[index][3]);
                          temp = temp - 1;
                          String temp1 = temp.toString();
                          eleSeats.add(temp1);
                        } */
                                  });
                                } else {
                                  showScreenDialog(
                                      context, 'Elective Limit Reached');
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Elective ID: ${eleDisplay[index][0]}'),
                                    Text(
                                        'Elective Name: ${eleDisplay[index][1]}'),
                                    Text('Ref link: ${eleDisplay[index][2]}'),
                                    Text('No of Seats: ${eleDisplay[index][3]}'),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color:
                                        true //eleIds.contains(electAll[index][0])
                                            ? Colors.red
                                            : Colors.amber,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
