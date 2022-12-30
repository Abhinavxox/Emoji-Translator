import 'package:emoji_translator/views/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:emoji_translator/views/widgets/error_box.dart';
import 'package:emoji_translator/views/menu.dart';
import 'package:emoji_translator/languageProvider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget{
  @override
  _HomepageState createState() => _HomepageState();

}

class _HomepageState extends State<Homepage> {

  String result = "";
  TextEditingController outputbox = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<LanguageProvider>(
          builder: (context, languageProvider, _) {
            return Container(
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
                        Container(
                          child: IconButton(
                            icon: Icon(Icons.settings),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  //input box
                  InputBox(
                    OutputPass: (String output) {
                      result = output;
                    },
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
                ],
              ),
            );
          }
        )
    );
  }
}