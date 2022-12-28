import 'package:emoji_translator/views/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:emoji_translator/views/widgets/error_box.dart';
import 'package:emoji_translator/views/menu.dart';

class Homepage extends StatefulWidget{
  @override
  _HomepageState createState() => _HomepageState();

}

class _HomepageState extends State<Homepage> {

  String result = "";
  String language = "English";

  TextEditingController outputbox = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: mediaQuery.width,
        height: mediaQuery.height,
        padding: EdgeInsets.all(20),
        color: Color(0xFFBD6E4E5),
        child: Column(
          children: <Widget>[
            //back button
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
                  //three bars button
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.settings),
                      color: Colors.white,
                      //on press open drawer
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Menu(
                          language: this.language,
                          callback: (String value) {
                            setState(() {
                              language = value;
                            });
                          },
                        )));
                      },
                    ),
                  ),
                ],
              ),
            ),

            //input box
            InputBox(
              OutputPass: (String output) {
                //setstate to update the output box
                result = output;
              },
              language: language,
              callback: () {
                setState(() {
                  if(result != "Error") {
                    outputbox.text = result;
                  }else{
                    outputbox.text = "...";
                  }

                });
              },
            ),
            if (result == "Error") Errorbox(
              errorClose: () {
                setState(() {
                  result = "";
                });
              },
            ),
            //output box
            Container(
              margin: EdgeInsets.only(top: 150, bottom: 10),
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
                      maxLines: 5,
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
      ),
    );
  }
}