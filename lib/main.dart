import 'package:bird_app/db/surveylist_db.dart';
import 'package:bird_app/model/survey.dart';
import 'package:bird_app/page/bird_detail.dart';
import 'package:bird_app/page/survey_page_main.dart';
import 'package:bird_app/widget/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './page/dictionary_page.dart';
import './page/profile_page.dart';
import './page/search_bar.dart';
import './page/home_page.dart';
import './widget/bottomNavBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:bird_app/l10n.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bird App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: const Locale("en"),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      home: const MyHomePage(title: 'Bird app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  bool isLoading = false;
  late List<Survey> surveys;

  @override
  void initState() {
    super.initState();
    print('running');
    refreshSurveys();
  }

  void updatePage(int currentIndex) {
    setState(() => _currentIndex = currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.language ?? "not found"),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomePage(
            updatePage: refreshSurveys,
          ), //index 0
          BirdDetail(
            birdID: 1,
            englishName: 'testing',
            sciName: 'sciName',
            imageUrl: './assets/images/001.jpg',
            long: 12345,
            lat: 12345,
            confirmCallback: confirmCallback,
          ), //index 1
          SurveyPageMain(
            confirmCallback: confirmCallback,
          ), //index 2
          SurveyPageMain(
            confirmCallback: confirmCallback,
          ), //index 3
          const ProfilePage(), //index 4
          SurveyPageMain(
            confirmCallback: confirmCallback,
          ), //index 5
        ],
      ),
      bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black45,
                blurRadius: 8,
              ),
            ],
          ),
          child: BottomNavBar(
            currentIndex: _currentIndex <= 3 ? _currentIndex : 0,
            pageChangeCallback: updatePage,
          )),
    );
  }

  void confirmCallback(int birdID, int count, DateTime surveyTime, double lat,
      double long, String activity, String status, File? image, File? video) {
    if (count == 0) return;

    addSurvey(birdID, long, lat, surveyTime, image, video, status, activity,
        DateTime.now(), count);

    print(
      'callback ok: ${birdID}, count: ${count}, time: ${surveyTime}, coordinate: ${lat},${long}, activity: ${activity}, status: ${status}',
    );
  }

  Future addSurvey(
    birdID,
    long,
    lat,
    recordTime,
    File? image,
    File? video,
    birdStatus,
    birdActivity,
    createdTime,
    count,
  ) async {
    final survey = Survey(
      birdID: birdID,
      long: long,
      lat: lat,
      recordTime: recordTime,
      image: image,
      video: video,
      birdStatus: birdStatus,
      birdActivity: birdActivity,
      count: count,
    );

    await SurveyListDb.instance.create(survey);
  }

  Future refreshSurveys() async {
    setState(() => isLoading = true);

    surveys = await SurveyListDb.instance.readAllSurveys();

    setState(() => isLoading = false);
    print('hello');
    for (var survey in surveys) {
      print(
          'BirdID: ${survey.birdID}, BirdCount: ${survey.count}, Activity: ${survey.birdActivity}');
    }
  }



  // Future submitSurveys() async {
  //   var response = await http.get(Uri.http('192.168.1.3:9003', '/birdlist'));
  //   var jsonData = jsonDecode(response.body);
  //   List<Bird> birdList = [];
  //
  //   for (var b in jsonData) {
  //     Bird bird = Bird(
  //         b['BirdID'], b['EnglishName'], b['ChineseName'], b['ScientificName']);
  //     birdList.add(bird);
  //   }
  //   print(birdList.length);
  //   return birdList;
  // }
}
