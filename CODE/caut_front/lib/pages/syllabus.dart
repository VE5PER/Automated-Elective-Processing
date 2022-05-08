
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:automated_elective_processing/common/app_colors.dart';
import 'package:automated_elective_processing/dashboard.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class syllabus extends StatelessWidget {
  const syllabus({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColor.yellow),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => dashboard()));
            }),
        title: Text(
          "Elective Syllabus and Curriculum",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColor.yellow),
        ),
      ),      
    backgroundColor: AppColor.purple,
    body: SfPdfViewer.asset(
      'assets/NNDL.pdf',
    ),
 
    );
  }
}