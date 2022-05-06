import 'package:flutter/material.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({Key? key}) : super(key: key);

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Dictionary',style: TextStyle(fontSize: 60))),
    );
  }
}
