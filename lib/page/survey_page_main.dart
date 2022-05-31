import 'dart:convert';

import 'package:bird_app/page/bird_detail.dart';
import 'package:bird_app/widget/card_survey_bird.dart';
import 'package:bird_app/widget/card_survey_bird_big.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './search_bar.dart';
import '../class/Bird.dart';

class SurveyPageMain extends StatefulWidget {
  const SurveyPageMain({Key? key, required this.confirmCallback}) : super(key: key);

  final Function confirmCallback;
  @override
  State<SurveyPageMain> createState() => _SurveyPageMainState();
}

class _SurveyPageMainState extends State<SurveyPageMain> {
  final String apiUri = '';

  //fetch full Bird list from API
  Future getBirdList() async {
    var response = await http.get(Uri.http('192.168.1.3:9003', '/birdlist'));
    var jsonData = jsonDecode(response.body);
    List<Bird> birdList = [];

    for (var b in jsonData) {
      Bird bird = Bird(
          b['BirdID'], b['EnglishName'], b['ChineseName'], b['ScientificName']);
      birdList.add(bird);
    }
    print(birdList.length);
    return birdList;
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Expanded(
            flex: 2,
            child: Container(
              child: Flex(
                direction: Axis.horizontal,
                children: [Text('Search Widget')],
              ),
              color: Colors.green,
            )),
        Expanded(
          flex: 8,
          child: Container(
            height: 500,
            width: double.infinity,
            color: Colors.blue,
            child: FutureBuilder(
              future: getBirdList(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: const Center(
                      child: Text(
                        'Loading...',
                      ),
                    ),
                  );
                } else {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, i) {
                      return cardSurveyBirdBig(
                          birdID: snapshot.data[i].birdID,
                          englishName: snapshot.data[i].englishName,
                          chineseName: snapshot.data[i].chineseName,
                          onClickListener: showBirdDialog);
                    },
                    itemCount: snapshot.data?.length ?? 0,
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  void showBirdDialog(
    BuildContext context,
    int birdID,
    String englishName,
    String chineseName,
  ) =>
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: BirdDetail(
                birdID: birdID,
                englishName: englishName,
                sciName: chineseName,
                key: UniqueKey(),
                confirmCallback: widget.confirmCallback,
              ));
        },
      );



}
