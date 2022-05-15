import 'package:automated_elective_processing/pages/admin_batch_alloc_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../dashboard.dart';
import '../functions/notify.dart';
import '../globals.dart';
import '../main.dart';
import 'dashboard/widget/profile_card_widget.dart';




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
        floatingActionButton: FloatingActionButton.extended(
          
          onPressed: () async {

          if(oldEle.length==newEle.length){
            print(oldEle);
            print(newEle);

            for(int i=0;i<oldEle.length;i++){
              String changeJson = '''{
                    "S_ID":"${currentUser["S_ID"]}",
                    "OLD_ID":"${oldEle[i].toString()}",
                    "NEW_ID":"${newEle[i].toString()}"
              }''';

            String status = await changeEle(changeJson);
            }
            showScreenDialog(context, 'Successfully Swapped');

            newEle.clear();
            oldEle.clear();
            await takeElectives();
            await getElective();

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => dashboard()));
          }
          else{
            showScreenDialog(context, 'Select Equal number of electives');
            setState(() {
              newEle.clear();
              oldEle.clear();
            });
          }
        }, label: Text('Swap Electives'),
        
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
                                setState(() {


                                  oldEle.contains(already[index][0]) ? oldEle.remove(already[index][0]) : oldEle.add(already[index][0]);
                                  print(oldEle);


                                });

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
                                        oldEle.contains(already[index][0])
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
                        style: TextStyle(color: Colors.white, fontSize: 20,),
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
                                setState(() {
                                  newEle.contains(eleDisplay[index][0]) ? newEle.remove(eleDisplay[index][0]) : newEle.add(eleDisplay[index][0]);
                                  print(newEle);
                                });
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
                                        newEle.contains(eleDisplay[index][0])
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



Future<String> changeEle(String data) async {
  final response = await http.post(
    Uri.parse(src+'/changeElective'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      },
      body:data,);
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