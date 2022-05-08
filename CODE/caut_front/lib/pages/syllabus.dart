
import 'package:automated_elective_processing/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:automated_elective_processing/common/app_colors.dart';
import 'package:automated_elective_processing/pages/syllabus.dart';
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
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ Color.fromARGB(191, 52, 15, 152), Color.fromARGB(255, 111, 78, 151)],
          stops: [
            0.4,
            0.7,
          ]
        ),
      ),
    child:  Container(
  child: GridView.count(
  primary: false,
  padding: const EdgeInsets.all(5),
  childAspectRatio: 1.5,
  crossAxisSpacing: 5,
  mainAxisSpacing: 5,
  crossAxisCount: 3,
  children: <Widget>[
    Container(
      padding: const EdgeInsets.all(8),
      child: 
      Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Artificial Intelligence Electives",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColor.yellow),
        ),
        SizedBox(height:35),
        ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 117, 28, 144),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold)),  
        child: Text('Neural Networks and Deep Learning', style: TextStyle(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),),
        onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => nndl()));
              },
      ),
      SizedBox(height:35),
      ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 117, 28, 144),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold)),
      child: Text('Natural Language Processing', style: TextStyle(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),),
      onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => nlp()));
              },
      ),
      ],
      ),
      color: AppColor.green,
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: 
      Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Cyber Security Electives",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColor.yellow),
        ),
        SizedBox(height:35),
        ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 117, 28, 144),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold)),
        child: Text('Cryptography', style: TextStyle(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),),
        onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => crypto()));
              },
      ),
      SizedBox(height:35),
      ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 117, 28, 144),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold)),
      child: Text('Ethical Hacking', style: TextStyle(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),),
      onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ethicalhacking()));
              },
      ),
      ],
      ),
      color: AppColor.green,
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: 
      Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Computer Vision Electives",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColor.yellow),
        ),
        SizedBox(height:35),
        ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 117, 28, 144),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold)),
        child: Text('Digital Image Processing', style: TextStyle(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),),
        onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => digimg()));
              },
      ),
      SizedBox(height:35),
      ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 117, 28, 144),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold)),
      child: Text('Computer Vision', style: TextStyle(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),),
      onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => compvis()));
              },
      ),
      ],
      ),
      color: Colors.teal[300],
    ),

    Container(
      padding: const EdgeInsets.all(8),
      child: 
      Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Data Science Electives",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColor.yellow),
        ),
        SizedBox(height:35),
        ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 117, 28, 144),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold)),
        child: Text('Big Data Analytics', style: TextStyle(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),),
        onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => bigdata()));
              },
      ),
      SizedBox(height:35),
      ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 117, 28, 144),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold)),
      child: Text('Web Mining', style: TextStyle(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),),
      onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => webmining()));
              },
      ),
      ],
      ),
      color: Colors.teal[400],
    ),

    Container(
      padding: const EdgeInsets.all(8),
      child:  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Networks Electives",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColor.yellow),
        ),
        SizedBox(height:35),
        ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 117, 28, 144),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold)),
        child: Text('Advanced Computer Networks', style: TextStyle(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),),
        onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => advcompnet()));
              },
      ),
      SizedBox(height:35),
      ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 117, 28, 144),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold)),
      child: Text('Wireless Sensor Networks', style: TextStyle(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),),
      onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => wirsens()));
              },
      ),
      ],
      ),
      color: Colors.teal[400],
      ),

          Container(
      padding: const EdgeInsets.all(8),
      child:  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Cyber Physical Systems Electives",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColor.yellow),
        ),
        SizedBox(height:35),
        ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 117, 28, 144),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold)),
        child: Text('Cloud Computing', style: TextStyle(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),),
        onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => cloud()));
              },
      ),
      SizedBox(height:35),
      ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 117, 28, 144),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold)),
      child: Text('Internet of Things', style: TextStyle(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),),
      onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => iot()));
              },
      ),
      ],
      ),
      color: Colors.teal[400],
      ),
      
  ],
  ),
   ),
    ),
    );
  }
}


class nndl extends StatelessWidget {
  const nndl({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColor.yellow),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => syllabus()));
            }),
        title: Text(
          "Neural Networks and Deep Learning",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColor.yellow),
        ),
      ),
      backgroundColor: AppColor.purple,  
      body:  SfPdfViewer.asset(
   'assets/NNDL.pdf',
      ),
    );
   
  }
}
class nlp extends StatelessWidget {
  const nlp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColor.yellow),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => syllabus()));
            }),
        title: Text(
          "Natural Language Processing",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColor.yellow),
        ),
      ),
      backgroundColor: AppColor.purple,  
      body:  SfPdfViewer.asset(
   'assets/NLP.pdf',
      ),
    );
   
  }
}
class webmining extends StatelessWidget {
  const webmining({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColor.yellow),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => syllabus()));
            }),
        title: Text(
          "Web Mining",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColor.yellow),
        ),
      ),
      backgroundColor: AppColor.purple,  
      body:  SfPdfViewer.asset(
   'assets/WebMining.pdf',
      ),
    );
   
  }
}
class ethicalhacking extends StatelessWidget {
  const ethicalhacking({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColor.yellow),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => syllabus()));
            }),
        title: Text(
          "Ethical Hacking",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColor.yellow),
        ),
      ),
      backgroundColor: AppColor.purple,  
      body:  SfPdfViewer.asset(
   'assets/EthicalHacking.pdf',
      ),
    );
   
  }
}
class bigdata extends StatelessWidget {
  const bigdata({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColor.yellow),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => syllabus()));
            }),
        title: Text(
          "Big Data",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColor.yellow),
        ),
      ),
      backgroundColor: AppColor.purple,  
      body:  SfPdfViewer.asset(
   'assets/BigData.pdf',
      ),
    );
   
  }
}
class advcompnet extends StatelessWidget {
  const advcompnet({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColor.yellow),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => syllabus()));
            }),
        title: Text(
          "Advanced Computer Networks",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColor.yellow),
        ),
      ),
      backgroundColor: AppColor.purple,  
      body:  SfPdfViewer.asset(
   'assets/AdvancedComputerNetworks.pdf',
      ),
    );
   
  }
}
class compvis extends StatelessWidget {
  const compvis({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColor.yellow),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => syllabus()));
            }),
        title: Text(
          "Computer Vision",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColor.yellow),
        ),
      ),
      backgroundColor: AppColor.purple,  
      body:  SfPdfViewer.asset(
   'assets/ComputerVision.pdf',
      ),
    );
   
  }
}
class crypto extends StatelessWidget {
  const crypto({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColor.yellow),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => syllabus()));
            }),
        title: Text(
          "Cryptography",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColor.yellow),
        ),
      ),
      backgroundColor: AppColor.purple,  
      body:  SfPdfViewer.asset(
   'assets/Cryptography.pdf',
      ),
    );
   
  }
}
class digimg extends StatelessWidget {
  const digimg({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColor.yellow),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => syllabus()));
            }),
        title: Text(
          "Digital Image Processing",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColor.yellow),
        ),
      ),
      backgroundColor: AppColor.purple,  
      body:  SfPdfViewer.asset(
   'assets/DigitalImageProcessing.pdf',
      ),
    );
   
  }
}

class wirsens extends StatelessWidget {
  const wirsens({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColor.yellow),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => syllabus()));
            }),
        title: Text(
          "Wireless Sensor Networks",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColor.yellow),
        ),
      ),
      backgroundColor: AppColor.purple,  
      body:  SfPdfViewer.asset(
   'assets/WirelessSensorNetworks.pdf',
      ),
    );
   
  }
}

class cloud extends StatelessWidget {
  const cloud({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColor.yellow),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => syllabus()));
            }),
        title: Text(
          "Cloud Computing",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColor.yellow),
        ),
      ),
      backgroundColor: AppColor.purple,  
      body:  SfPdfViewer.asset(
   'assets/CloudComputing.pdf',
      ),
    );
   
  }
}
class iot extends StatelessWidget {
  const iot({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColor.yellow),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => syllabus()));
            }),
        title: Text(
          "Internet of Things",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: AppColor.yellow),
        ),
      ),
      backgroundColor: AppColor.purple,  
      body:  SfPdfViewer.asset(
   'assets/IOT.pdf',
      ),
    );
   
  }
}