import 'package:flutter/material.dart';

class BtnBlueBig extends StatelessWidget {
  const BtnBlueBig({Key? key, required this.onClickHandler, required this.toPage }) : super(key: key);

  final Function onClickHandler;
  final int toPage;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onClickHandler(toPage),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(
                  0.8, 0.0), // 10% of the width, so there are ten blinds.
              colors: <Color>[Color(0xff62E3FF), Color(0xff227AFF)],
            ),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Wrap(

            children: [
              Container(
                constraints:
                    const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                // min sizes for Material buttons
                alignment: Alignment.center,
                child: const Text(
                  'Start New Survey',
                  style: TextStyle(
                      fontFamily: 'MaisonNeue_B',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 1.5),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )),
    );
  }
}
