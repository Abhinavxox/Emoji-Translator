import 'package:flutter/material.dart';

class Errorbox extends StatefulWidget {

  @override
  State<Errorbox> createState() => _ErrorboxState();

  final VoidCallback errorClose;

  Errorbox({this.errorClose});

}

class _ErrorboxState extends State<Errorbox> {

  void errorClose() {
    widget.errorClose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
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
                onPressed: () {
                  errorClose();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
