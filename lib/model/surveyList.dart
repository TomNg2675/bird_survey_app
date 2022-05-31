import 'package:bird_app/model/survey.dart';

class SurveyList {
  final int? userID;
  final DateTime createdTime;
  final List<Survey> surveyList;


  const SurveyList({
    required this.userID,
    required this.createdTime,
    required this.surveyList
  });}