import 'package:emoji_translator/views/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:emoji_translator/views/widgets/error_box.dart';
import 'package:emoji_translator/views/widgets/output.dart';

class Homepage extends StatefulWidget{
  @override
  _HomepageState createState() => _HomepageState();

}

class _HomepageState extends State<Homepage> {

  String result = "";

  TextEditingController outputbox = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Color(0xFFBD6E4E5),
      child: Column(
        children: <Widget>[
          //input box
          InputBox(
            OutputPass: (String output) {
              //setstate to update the output box
              result = output;
            },
            callback: () {
              outputbox.text = result;
            },
          ),
          //output box
          Container(
            margin: EdgeInsets.only(top: 250, bottom: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFFBEFF5F5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: outputbox,
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'NotoColorEmoji',
                    ),
                    maxLines: 10,
                    // enabled: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '...',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],


            ),
          ),
          // //error box
          // ErrorBox(),
        ],
      ),
    );
  }
}