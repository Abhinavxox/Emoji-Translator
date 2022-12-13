import 'package:flutter/material.dart';

class OutputBox extends StatefulWidget {
  @override
  State<OutputBox> createState() => _OutputBoxState();
}

class _OutputBoxState extends State<OutputBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xFFBEFF5F5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          //give the list of all the emojis from the api

        ),
      ),
    );
  }
}
