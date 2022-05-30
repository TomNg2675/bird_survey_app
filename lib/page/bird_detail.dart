import 'dart:convert';

import 'package:bird_app/presentation/my_flutter_app_icons.dart';
import 'package:bird_app/utils/hero_dialog_route.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widget/btn_ImagePicker.dart';
import '../widget/btn_VideoPicker.dart';

class BirdDetail extends StatefulWidget {
  BirdDetail({
    Key? key,
    required this.birdID,
    required this.englishName,
    required this.sciName,
    this.imageUrl,
    this.dateTime,
    this.long,
    this.lat,
    this.birdCount,
  }) : super(key: key);

  final int birdID;
  final String englishName;
  final String sciName;
  final String? imageUrl;
  final String? dateTime;
  final double? long;
  final double? lat;
  int? birdCount;
  final int imageCount = 1;
  final int VideoCount = 2;

  @override
  State<BirdDetail> createState() => _BirdDetail();
}

class _BirdDetail extends State<BirdDetail> {
  int _pageIndex = 0;
  String? selectedActivity;
  TextEditingController _controller = TextEditingController();


  String? selectedStatus;
  List<String> birdAct = [
    "Flying",
    "Singing",
    "Nest Building",
    "Carrying food",
    "Feeding"
  ];
  List<String> birdStat = ["Injured", "Sick"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Hero(
        tag: widget.birdID,
        child: Material(
          borderRadius: BorderRadius.circular(16),
          color: Colors.blueGrey,
          child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    flex: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 4,
                            spreadRadius: 4,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 35,
                                right: 20,
                                top: 35,
                                bottom: 35,
                              ),
                              child: Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 3,
                                        spreadRadius: 3,
                                        offset: Offset(2, 2),
                                      ),
                                    ]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    widget.imageUrl ??
                                        './assets/images/001.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(widget.englishName),
                                            ),
                                          )),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Text(widget.sciName),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Column(
                                      children: [
                                        const Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text('Date'),
                                              ),
                                            )),
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                  widget.dateTime ?? '0:0:0'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Column(
                                      children: [
                                        const Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 20),
                                            child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text('Location'),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                  widget.long?.toString() ??
                                                      '0.00'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: _pageIndex == 0
                                      ? InkWell(
                                          onTap: () => {updatePage()},
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 20),
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Text('More Info'),
                                            ),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () => {updatePage()},
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 20),
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Text('Survey'),
                                            ),
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Text('Multimedia'),
                                ), //Area2a1
                              ),
                              Expanded(
                                flex: 7,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: widget.imageCount > 0 ? 30 : 0,
                                            child: BtnImagePicker(),
                                          ),
                                          Positioned(
                                            left:
                                                widget.imageCount > 0 ? 60 : 0,
                                            child: SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: Visibility(
                                                visible: widget.imageCount > 0
                                                    ? true
                                                    : false,
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black54,
                                                            blurRadius: 3,
                                                            spreadRadius: 0,
                                                            offset:
                                                                Offset(0, 2),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(widget
                                                          .imageCount
                                                          .toString()),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: widget.imageCount > 0 ? 30 : 0,
                                            child: BtnVideoPicker(),
                                          ),
                                          Positioned(
                                            left:
                                                widget.imageCount > 0 ? 60 : 0,
                                            child: SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: Visibility(
                                                visible: widget.imageCount > 0
                                                    ? true
                                                    : false,
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black54,
                                                            blurRadius: 3,
                                                            spreadRadius: 0,
                                                            offset:
                                                                Offset(0, 2),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(widget
                                                          .imageCount
                                                          .toString()),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                color: Colors.blue,
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 20, bottom: 30),
                                child: Container(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blueGrey,
                                    ),
                                    child: DropdownButton<String>(
                                      dropdownColor: Colors.blueGrey,

                                      value: selectedActivity,
                                      isExpanded: true,
                                      hint: Text("Activity"),
                                      items: birdAct
                                          .map(
                                            (item) => DropdownMenuItem<String>(
                                                value: item, child: Text(item)),
                                          )
                                          .toList(),
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconSize: 42,
                                      underline: SizedBox(),
                                      onChanged: (item) => setState(() {
                                        selectedActivity = item;
                                      }),
                                    )

                                    // ElevatedButton.icon(
                                    //   onPressed: () {},
                                    //   icon: Icon(
                                    //     CustomIcons.triangle_down,
                                    //     color: Colors.white,
                                    //   ),
                                    //   label: Text('Bird activity'),
                                    //   //dropdown list
                                    //   style: ElevatedButton.styleFrom(
                                    //     primary: Colors.red,
                                    //     shape: new RoundedRectangleBorder(
                                    //       borderRadius:
                                    //           new BorderRadius.circular(16),
                                    //     ),
                                    //   ),
                                    // ),
                                    ),
                              ),
                              Container(
                                width: double.infinity,
                                color: Colors.blue,
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  child: Container(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: DropdownButton<String>(
                                        value: selectedStatus,
                                        isExpanded: true,
                                        hint: Text("Status"),
                                        items: birdStat
                                            .map(
                                              (item) =>
                                                  DropdownMenuItem<String>(
                                                      value: item,
                                                      child: Text(item)),
                                            )
                                            .toList(),
                                        icon: Icon(Icons.arrow_drop_down),
                                        iconSize: 42,
                                        underline: SizedBox(),
                                        onChanged: (item) => setState(() {
                                          selectedStatus = item;
                                        }),
                                      )

                                      // ElevatedButton.icon(
                                      //   onPressed: () {},
                                      //   icon: Icon(
                                      //     CustomIcons.triangle_down,
                                      //     color: Colors.white,
                                      //   ),
                                      //   label: Text('Bird activity'),
                                      //   //dropdown list
                                      //   style: ElevatedButton.styleFrom(
                                      //     primary: Colors.red,
                                      //     shape: new RoundedRectangleBorder(
                                      //       borderRadius:
                                      //           new BorderRadius.circular(16),
                                      //     ),
                                      //   ),
                                      // ),
                                      ),

                                  //     child: Container(
                                  //       decoration: BoxDecoration(
                                  //         borderRadius:
                                  //             BorderRadius.circular(16),
                                  //       ),
                                  //       child: ElevatedButton.icon(
                                  //         onPressed: () {},
                                  //         icon: Icon(
                                  //           CustomIcons.triangle_down,
                                  //           color: Colors.white,
                                  //         ),
                                  //         label: Text('Bird status'),
                                  //         style: ElevatedButton.styleFrom(
                                  //           primary: Colors.red,
                                  //           shape: new RoundedRectangleBorder(
                                  //             borderRadius:
                                  //                 new BorderRadius.circular(16),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ),
                              ),
                            ],
                          ),
                        ), //Area2b
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 18,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text('Opservation'),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            child: Row(
                              //plus button
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () => {updateBirdCount(1)},
                                      child: DecoratedIcon(
                                        CustomIcons.plus,
                                        size: 50.0,
                                        color: Colors.white,
                                        shadows: [
                                          BoxShadow(
                                            blurRadius: 20.0,
                                            color: Colors.white54,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: TextFormField(
                                      controller: _controller,
                                      cursorColor: Colors.white,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(2)
                                      ],
                                      //birdcount
                                      onChanged: (text) => {

                                        setState(
                                          () {
                                            widget.birdCount = int.parse(text);
                                          },
                                        )
                                      },

                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            widget.birdCount?.toString() ?? '0',
                                        hintStyle: TextStyle(
                                          color: Colors.white
                                        )
                                      ),

                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  //minus button
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () => {updateBirdCount(2)},
                                      child: DecoratedIcon(
                                        CustomIcons.minus,
                                        size: 40.0,
                                        color: Colors.white,
                                        shadows: [
                                          BoxShadow(
                                            blurRadius: 20.0,
                                            color: Colors.white54,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: Align(
                      alignment: Alignment.center,
                      child: FractionallySizedBox(
                          //Confirm btn
                          widthFactor: 0.5,
                          heightFactor: 0.5,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Text('Confirm'),
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  void updateBirdCount(int action) {
    int count = widget.birdCount ?? 0; //check null
    //bird count add
    if (action == 1) {
      setState(() {
        if(count < 99) {
          widget.birdCount = count + 1;
          _controller.text = (count + 1).toString();
        }
      });

      return;
    }
    //bird count minus
    if (action == 2) {
      if (count <= 0) return; // no minus on 0 count
      setState(() {
        widget.birdCount = count - 1;
        _controller.text = (count - 1).toString();
      });

      return;
    }
  }

  void updatePage() {
    setState(() => _pageIndex = ((_pageIndex + 1) % 2));
  }
}
