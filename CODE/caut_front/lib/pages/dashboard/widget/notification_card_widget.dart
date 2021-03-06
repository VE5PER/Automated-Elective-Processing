import 'package:automated_elective_processing/models/student.dart';
import 'package:flutter/material.dart';
import 'package:automated_elective_processing/common/app_colors.dart';

import '../../../globals.dart';

class NotificationCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.yellow, borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: 16, color: AppColor.black),
                  children: [
                    TextSpan(text: 'Welcome '),
                    TextSpan(
                      text: currentUser['S_NAME'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Choose your elective preference!',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.black,
                  height: 1.5,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              /*Text(
                "Read More",
                style: TextStyle(
                    fontSize: 14,
                    color: AppColor.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              )*/
            ],
          ),
          if (MediaQuery.of(context).size.width >= 620) ...{
            Spacer(),
            Image.asset(
              'assets/notification_image.png',
              height: 160,
            )
          }
        ],
      ),
    );
  }
}
