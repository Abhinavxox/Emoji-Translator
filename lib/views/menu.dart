import 'dart:html' hide VoidCallback;
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  State<Menu> createState() => _MenuState();

  final Function(String) callback;
  //take props from the parent language
  String language;

  Menu({this.callback, this.language});
}

class _MenuState extends State<Menu> {

  String _selectedLanguage = "English";

  void callback(String value) {
    widget.callback(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFBD6E4E5),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            //Choose Language title
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                "CHOOSE LANGUAGE",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            //dropdown menu
            Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Color(0xFFBEB6440),
                borderRadius: BorderRadius.circular(10),
              ),
              //increase width
              width: 300,
              child: DropdownButton<String>(
                focusColor: Colors.white,
                value: _selectedLanguage,
                //elevation: 5,
                style: TextStyle(color: Colors.white),
                iconEnabledColor: Colors.black,
                items: <String>[
                  'English',
                  'Chinese',
                  'Nepali',
                  'Hindi',
                  'Spanish',
                  'French'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                hint: Container(
                  width: 270,
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "$_selectedLanguage",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                onChanged: (String value) {
                  setState(() {
                    _selectedLanguage = value;
                  });
                },
              ),
            ),
            //About the developer title
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                "ABOUT THE DEVELOPER",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            //Cicular photo
            Container(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/abhinav.JPG'),
              ),
            ),
            //Container for description and link
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "Abhinav Pandey",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  //link to github container
                  Container(
                    child: TextButton(
                      onPressed: () {
                        window.open('https://github.com/Abhinavxox', 'new tab');
                      },
                      child: Text(
                        "GITHUB",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // //amfoss logo
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Image.asset('assets/images/amfoss.png'),
            ),
          ],
        ),
      ),
    );
  }
}
