import 'package:emoji_translator/views/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:emoji_translator/views/widgets/error_box.dart';
import 'package:emoji_translator/views/widgets/output.dart';

class Homepage extends StatefulWidget{
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Color(0xFFBD6E4E5),
      child: Column(
        children: <Widget>[
          InputBox(),
          Errorbox(),
          OutputBox(),
        ],
      ),
    );
  }
}