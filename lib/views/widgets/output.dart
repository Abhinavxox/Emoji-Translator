import 'package:flutter/material.dart';

class OutputBox extends StatefulWidget {
  @override
  State<OutputBox> createState() => _OutputBoxState();

  //get the props
  final String result;
  final bool toPerform;
  //constructor
  OutputBox({this.result, this.toPerform});
}

class _OutputBoxState extends State<OutputBox> {

  TextEditingController outputbox = TextEditingController();

  void OutputToShow(String output) {
    if(widget.toPerform) {
      outputbox.text = widget.result;
    }else{
      outputbox.text = "...";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
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
                maxLines: 10,
                enabled: false,
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
    );
  }
}
