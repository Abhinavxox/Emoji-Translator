import 'package:flutter/material.dart';

class Errorbox extends StatefulWidget {

  @override
  State<Errorbox> createState() => _ErrorboxState();
}

class _ErrorboxState extends State<Errorbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //error message box with a cross button
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xFFBEB6440),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('WARNING : Empty input',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Container(
              child: IconButton(
                icon: Icon(Icons.close),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
