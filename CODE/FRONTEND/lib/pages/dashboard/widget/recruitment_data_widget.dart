import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:automated_elective_processing/common/app_colors.dart';


class RecruitmentDataWidget extends StatefulWidget {
  @override
  _RecruitmentDataWidgetState createState() => _RecruitmentDataWidgetState();
}

class _RecruitmentDataWidgetState extends State<RecruitmentDataWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
child: CarouselSlider(
    options: CarouselOptions(
      height: 400,
      aspectRatio: 16/9,
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
    ),
  items: ["When you have a dream, you’ve got to grab it and never let go. — Carol Burnett",

"Nothing is impossible. The word itself says ‘I’m possible!' — Audrey Hepburn",

    "There is nothing impossible to they who will try. — Alexander the Great",

"The bad news is time flies. The good news is you’re the pilot. — Michael Altshuler",

    "Life has got all those twists and turns. You’ve got to hold on tight and off you go. — Nicole Kidman"].map((i) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
                color: Colors.blue[100],
              borderRadius:  BorderRadius.all(Radius.circular(20))
            ),

            child: Center(child: Text('-> $i <-', style: TextStyle(fontSize:40.0, fontStyle: FontStyle.italic),))
        );
      },
    );
  }).toList(),

),
        );
  }

  Widget tableHeader(text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.black),
      ),
    );
  }
}
