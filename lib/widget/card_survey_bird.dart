import 'dart:math';

import 'package:bird_app/presentation/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

class cardSurveyBird extends StatelessWidget {
  const cardSurveyBird({Key? key, this.cardTitle, this.cardDescriptions}) : super(key: key);

  final String? cardTitle;
  final String? cardDescriptions;
  final int birdCount = 0;
  final String imageAsset = 'assets/images/001.jpg';
  final bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 100,
      width: double.maxFinite,
      child: Card(
        elevation: 5,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  color: Colors.red,
                  padding: EdgeInsets.only(top: 10),
                  alignment: Alignment.topCenter,
                  child: Icon(
                    CustomIcons.plus,
                  )),
            ),
            Expanded(
              flex: 8,
              child: Container(
                color: Colors.green,
                height: double.infinity,
                alignment: Alignment.centerLeft,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      imageAsset,
                    ),
                  ),
                  title: Text(cardTitle??'null'),
                  subtitle: Text(cardDescriptions??'null'),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
                alignment: Alignment.center,
                child: Text('1'),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
                alignment: Alignment.center,
                child: Icon(
                  favorite ? CustomIcons.heart : CustomIcons.heart_empty,
                  color: Colors.black45,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
