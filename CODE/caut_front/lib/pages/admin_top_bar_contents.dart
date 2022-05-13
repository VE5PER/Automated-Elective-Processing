import 'package:automated_elective_processing/common/app_colors.dart';
import 'package:automated_elective_processing/pages/add_elective.dart';
import 'package:automated_elective_processing/pages/add_faculty.dart';
import 'package:automated_elective_processing/pages/add_user.dart';
import 'package:automated_elective_processing/pages/admin_batch_alloc_page.dart';
import 'package:automated_elective_processing/pages/dashboard_temp.dart';
import 'package:automated_elective_processing/pages/sem_elective.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
// List ele = [];
List<String> elem =[];
List seat =[];
class AdminTopBarContents extends StatefulWidget {
  AdminTopBarContents();

  @override
  _AdminTopBarContentsState createState() => _AdminTopBarContentsState();
}

class _AdminTopBarContentsState extends State<AdminTopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  final List _isTap = [false, false, false, false, false, false, false, false];
  String? selectedValue;
  List<String> items = [
    'Add Student',
    'Add Elective',
    'Add Faculty',
    'Add No. of Elective'
  ];
  String d1 = 'Home';

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      color: AppColor.bgSideMenu,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 40,
              ),

              Text(
                'ADMIN',
                style: TextStyle(
                  color: Color(0xFF077bd7),
                  fontSize: 26,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3,
                ),
              ),
              SizedBox(width: screenSize.width / 15),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[0] = true : _isHovering[0] = false;
                  });
                },
                onTap: () {
                  _isTap[0] = !_isTap[0];
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => tempDash()));
                  setState(() {});
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Home',
                      style: TextStyle(
                          color: _isHovering[0]
                              ? Color(0xFF077bd7)
                              : Color(0xFF077bd7),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(height: 2),
                    Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      maintainSize: true,
                      visible: _isHovering[0],
                      child: Container(
                        height: 2,
                        width: 20,
                        color: Color(0xFF051441),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: screenSize.width / 15),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[1] = true : _isHovering[1] = false;
                  });
                },
                onTap: () {

                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Row(
                          children: const [
                            Icon(
                              Icons.list,
                              size: 16,
                              color:Color(0xFF077bd7),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                'Add Details',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color:Color(0xFF077bd7),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color:Color(0xFF077bd7),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          if (value == items[0])
                            {
                              getSeats();
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => addUser()));
                            }
                          if (value == items[1])
                          {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => addElective()));
                          }
                          if (value == items[2])
                          {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => addFaculty()));
                          }
                          if (value == items[3])
                          {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => semElective()));
                          }
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                        ),
                        iconSize: 14,
                        iconEnabledColor: Color(0xFF077bd7),
                        iconDisabledColor: Colors.grey,
                        buttonHeight: 40,
                        buttonWidth: 140,
                        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                        buttonElevation: 2,
                        itemHeight: 40,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 200,
                        dropdownWidth: 200,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                            // color: Colors.white.withOpacity(0.5)
                        ),
                        dropdownElevation: 8,
                        scrollbarRadius: const Radius.circular(40),
                        scrollbarThickness: 6,
                        scrollbarAlwaysShow: true,
                        offset: const Offset(-20, 0),
                      ),
                    ),
                    SizedBox(height: 5),
                    Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      maintainSize: true,
                      visible: _isHovering[1],
                      child: Container(
                        height: 2,
                        width: 20,
                        color: Color(0xFF051441),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(width: screenSize.width / 15),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[2] = true : _isHovering[2] = false;
                  });
                },
                  onTap: () async{
                    await getElective();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                        batchAlloc()));
                    setState(() {});
                  },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Allocate Electives',
                      style: TextStyle(
                          color: _isHovering[2]
                              ? Color(0xFF077bd7)
                              : Color(0xFF077bd7),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      maintainSize: true,
                      visible: _isHovering[2],
                      child: Container(
                        height: 2,
                        width: 20,
                        color: Color(0xFF051441),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: screenSize.width / 15),
              InkWell(
                onHover: (value) {
                  setState(() {
                    value ? _isHovering[3] = true : _isHovering[3] = false;
                  });
                },
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Check Reports',
                      style: TextStyle(
                          color: _isHovering[3]
                              ? Color(0xFF077bd7)
                              : Color(0xFF077bd7),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      maintainSize: true,
                      visible: _isHovering[3],
                      child: Container(
                        height: 2,
                        width: 20,
                        color: Color(0xFF051441),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    //);
  }
}
