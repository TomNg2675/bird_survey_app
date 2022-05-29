import 'package:bird_app/widget/button_blue_big.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {

  final Function updatePage;
  const HomePage({Key? key, required this.updatePage}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.red,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      AppLocalizations.of(context)?.home_head_title ?? "hello",
                      style: const TextStyle(
                          fontSize: 30,
                          fontFamily: 'MaisonNeue',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8),
                    ),
                  )),
              Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(30),
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: double.infinity,
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/images/001.jpg',
                        fit: BoxFit.contain,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )),
              Flexible(
                  flex: 1,
                  child: Container(
                      color: Colors.green,
                      child: Flex(
                        direction: Axis.vertical,
                        children: [
                          Flexible(
                            flex: 5,
                            child: BtnBlueBig(onClickHandler: updatePage,toPage: 5,),
                          ),
                          Flexible(
                            flex: 5,
                            child: BtnBlueBig(onClickHandler: updatePage,toPage: 5,),
                          ),
                        ],
                      ))),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.black,
                  )),
            ],
          ),
        )
      ],
    );
  }


}
