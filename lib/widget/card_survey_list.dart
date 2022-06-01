import 'package:flutter/material.dart';

class CardSurveyList extends StatelessWidget {
  const CardSurveyList(
      {Key? key,
      required this.id,
      required this.count,
      required this.long,
      required this.lat,
      required this.birdStatus,
      required this.birdActivity})
      : super(key: key);

  final int id;
  final int count;
  final double long;
  final double lat;
  final String birdStatus;
  final String birdActivity;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: Center(
            child: Text(
                'BirdID: ${id.toString()}, BirdCount: ${count.toString()}, Coordinate: ${long.toString()}, ${lat.toString()}, BirdStatus: ${birdStatus.toString()}, BirdActivity: ${birdActivity.toString()}')),
      ),
    );
  }
}
