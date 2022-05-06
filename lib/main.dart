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
            updatePage: updatePage,
          ), //index 0
          const BirdDetail(
            birdID: 1,
            englishName: 'testing',
            sciName: 'sciName',
            dateTime: '2021-1-1',
            imageUrl: './assets/images/001.jpg',
            long: 12345,
            lat: 12345,
          ), //index 1
          const SurveyPageMain(), //index 2
          const SurveyPageMain(), //index 3
          const ProfilePage(), //index 4
          const SurveyPageMain(), //index 5
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
}
