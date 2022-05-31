import 'dart:io';


final String tableSurveys = 'surveys';

class SurveyFields {
  static final List<String> values = [
    /// Add all fields
    id,
    birdID,
    long,
    lat,
    recordTime,
    image,
    video,
    birdStatus,
    birdActivity
  ];

  static const String id = '_id';
  static const String birdID = 'birdID';
  static const String long = 'long';
  static const String lat = 'lat';
  static const String recordTime = 'recordTime';
  static const String image = 'image';
  static const String video = 'video';
  static const String birdStatus = 'birdStatus';
  static const String birdActivity = 'birdActivity';
  static const String count = 'count';
}

class Survey {
  final int? id;
  final int birdID;
  final double long;
  final double lat;
  final DateTime recordTime;
  final File? image;
  final File? video;
  final String birdStatus;
  final String birdActivity;
  final int count;

  const Survey({
    this.id,
    required this.birdID,
    required this.long,
    required this.lat,
    required this.recordTime,
    this.image,
    this.video,
    required this.birdStatus,
    required this.birdActivity,
    required this.count,
  });

  Survey copy({
    int? id,
    int? birdID,
    double? long,
    double? lat,
    DateTime? recordTime,
    File? image,
    File? video,
    String? birdStatus,
    String? birdActivity,
  }) =>
      Survey(
        id: id ?? this.id,
        birdID: birdID ?? this.birdID,
        long: long ?? this.long,
        lat: lat ?? this.lat,
        recordTime: recordTime ?? this.recordTime,
        image: image ?? this.image,
        video: video ?? this.video,
        birdStatus: birdStatus ?? this.birdStatus,
        birdActivity: birdActivity ?? this.birdActivity,
        count: this.count
      );

  static Survey fromJson(Map<String, Object?> json) => Survey(
        id: json[SurveyFields.id] as int?,
        birdID: json[SurveyFields.birdID] as int,
        long: double.parse(json[SurveyFields.long].toString()),
        lat: double.parse(json[SurveyFields.lat].toString()),
        recordTime: DateTime.parse(json[SurveyFields.recordTime] as String),
        image: json[SurveyFields.image] as File?,
        video: json[SurveyFields.video] as File?,
        birdStatus: json[SurveyFields.birdStatus] as String,
        birdActivity: json[SurveyFields.birdActivity] as String,
        count: json[SurveyFields.count] as int,
       );

  Map<String, Object?> toJson() => {
        SurveyFields.id: id,
        SurveyFields.birdID: birdID,
        SurveyFields.long: long,
        SurveyFields.lat: lat,
        SurveyFields.recordTime: recordTime.toIso8601String(),
        SurveyFields.image: image,
        SurveyFields.video: video,
        SurveyFields.birdStatus: birdStatus,
        SurveyFields.birdActivity: birdActivity,
        SurveyFields.count: count
      };
}
