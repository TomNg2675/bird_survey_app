import 'dart:html';

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
    birdActivity,
    createdTime
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
  static const String createdTime = 'createdTime';
}

class Survey {
  final int? id;
  final int birdID;
  final double long;
  final double lat;
  final DateTime recordTime;
  final File image;
  final File video;
  final String birdStatus;
  final String birdActivity;
  final DateTime createdTime;

  const Survey({
    this.id,
    required this.birdID,
    required this.long,
    required this.lat,
    required this.recordTime,
    required this.image,
    required this.video,
    required this.birdStatus,
    required this.birdActivity,
    required this.createdTime,
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
    DateTime? createdTime,
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
        createdTime: createdTime ?? this.createdTime,
      );

  static Survey fromJson(Map<String, Object?> json) => Survey(
        id: json[SurveyFields.id] as int?,
        birdID: json[SurveyFields.birdID] as int,
        long: json[SurveyFields.long] as double,
        lat: json[SurveyFields.lat] as double,
        recordTime: DateTime.parse(json[SurveyFields.recordTime] as String),
        image: json[SurveyFields.image] as File,
        video: json[SurveyFields.video] as File,
        birdStatus: json[SurveyFields.birdStatus] as String,
        birdActivity: json[SurveyFields.birdActivity] as String,
        createdTime: DateTime.parse(json[SurveyFields.createdTime] as String),
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
        SurveyFields.createdTime: createdTime.toIso8601String(),
      };
}
