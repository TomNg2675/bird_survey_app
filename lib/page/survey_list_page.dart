import 'package:bird_app/model/surveyList.dart';
import 'package:bird_app/widget/card_survey_list.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import '../db/surveylist_db.dart';
import '../model/survey.dart';
import 'package:http/http.dart' as http;

class SurveyListPage extends StatefulWidget {
  const SurveyListPage(
      {Key? key, required this.surveys, required this.refreshList})
      : super(key: key);

  @override
  State<SurveyListPage> createState() => _SurveyListPageState();

  final List<Survey> surveys;
  final Function refreshList;
}

class _SurveyListPageState extends State<SurveyListPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3,
      ),
      itemBuilder: (context, i) {
        return CardSurveyList(
            id: widget.surveys[i].birdID,
            count: widget.surveys[i].count,
            long: widget.surveys[i].long,
            lat: widget.surveys[i].lat,
            birdStatus: widget.surveys[i].birdStatus,
            birdActivity: widget.surveys[i].birdActivity);
      },
      itemCount: widget.surveys.length,
    ));
  }
}
