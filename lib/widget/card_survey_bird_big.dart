import 'dart:math';

import 'package:bird_app/presentation/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

class cardSurveyBirdBig extends StatelessWidget {
  const cardSurveyBirdBig({
    Key? key,
    required this.birdID,
    this.englishName,
    this.chineseName,
    this.imageAsset,
    this.favorite,
  }) : super(key: key);

  final String? englishName;
  final String? chineseName;
  final int birdID;
  final int birdCount = 0;
  final String? imageAsset;
  final bool? favorite;

  final TextStyle _textStyle = const TextStyle(
      fontSize: 18,
      fontFamily: 'MaisonNeue_B',
      fontWeight: FontWeight.w700,
      color: Colors.white,
      letterSpacing: 0.8);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              './assets/images/001.jpg',
              fit: BoxFit.cover,
            ),
            Container(
              height: 350.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.grey.withOpacity(0.0),
                        Colors.black87,
                      ],
                      stops: const [
                        0.0,
                        0.8,
                      ])),
            ),
            Positioned.fill(
              left: 10,
              bottom: 50,
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    englishName ?? 'null',
                    style: _textStyle,
                  )),
            ),
            Positioned.fill(
              left: 10,
              bottom: 20,
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    chineseName ?? 'null',
                    style: _textStyle,
                  )),
            ),
            const Positioned.fill(
              left: 10,
              top: 10,
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(
                  CustomIcons.info_circle,
                  color: Colors.white70,
                ),
              ),
            ),
            const Positioned.fill(
              right: 10,
              top: 10,
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(
                  CustomIcons.heart_empty,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
      ),
    );
  }
}
