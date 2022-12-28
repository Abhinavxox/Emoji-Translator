import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:google_fonts/google_fonts.dart';


class InputBox extends StatefulWidget {

  @override
  State<InputBox> createState() => _InputBoxState();

  //voidbackcall for button
  final VoidCallback callback;

  final Function(String) OutputPass;

  final String language;

  //constructor
  InputBox({this.callback, this.OutputPass, this.language});

}

class _InputBoxState extends State<InputBox> {

  String _selectedLanguage;

  String inputRegex;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = widget.language;

    if(_selectedLanguage == "English") {
      inputRegex = r"([a-zA-Z])";
    } else if(_selectedLanguage == "Spanish") {
      inputRegex = r"([a-zA-Z])";
    } else if(_selectedLanguage == "French") {
      inputRegex = r"([a-zA-Z])";
    } else if(_selectedLanguage == "German") {
      inputRegex = r"([a-zA-Z])";
    } else if(_selectedLanguage == "Italian") {
      inputRegex = r"([a-zA-Z])";
    } else if(_selectedLanguage == "Japanese") {
      inputRegex = r"([a-zA-Z])";
    } else if(_selectedLanguage == "Korean") {
      inputRegex = r"([a-zA-Z])";
    } else if(_selectedLanguage == "Russian") {
      inputRegex = r"([a-zA-Z])";
    } else if(_selectedLanguage == "Chinese") {
      inputRegex = r"([a-zA-Z])";
    } else if(_selectedLanguage == "Arabic") {
      inputRegex = r"([a-zA-Z])";
    } else if(_selectedLanguage == "Hindi") {
      inputRegex = r"([a-zA-Z])";
    } else if(_selectedLanguage == "Portuguese") {
      inputRegex = r"([a-zA-Z])";
    } else if(_selectedLanguage == "Turkish") {
      inputRegex = r"([a-zA-Z])";
    } else if(_selectedLanguage == "Vietnamese") {
      inputRegex = r"([a-zA-Z])";
    } else if(_selectedLanguage == "Greek") {
      inputRegex = r"([a-zA-Z])";
    } else if(_selectedLanguage == "Hebrew") {
      inputRegex = r"([a-zA-Z])";
    } else if(_selectedLanguage == "Indonesian") {
      inputRegex = r"([a-zA-Z])";
    } else if(_selectedLanguage == "Polish") {
      inputRegex = r"([a-zA-Z])";
    } else if(_selectedLanguage == "Swedish") {
      inputRegex = r"([a-zA-Z])";
    } else if(_selectedLanguage == "Thai") {
      inputRegex = r"([a-zA-Z])";
    } else if(_selectedLanguage == "Urdu") {
      inputRegex = r"([a-zA-Z])";
    }
  }

  //controller for input text box
  TextEditingController inputbox = TextEditingController();

  void callbackResult() {
    widget.callback();
  }

  void OutputPass(String output) {
    widget.OutputPass(output);
  }

  //api function
  void getEmoji() async {
    //get the text from the text area
    String text = inputbox.text;

    //if text is empty
    if(text==''){
      OutputPass('Error');
      callbackResult();
      return;
    }

    // //get the response from the api
    // var response = await http.get(Uri.parse("https://emoji-api.com/emojis?search=$text&access_key=ff75e24e8949a1087ebaf607bc2406711f0ef96a"));
    // //decode the response
    // var data = jsonDecode(response.body);
    // if (data==null) {
    //   OutputPass("No Emoji Found");
    // } else {
    //   List emojis = [];
    //   for(var i in data){
    //     emojis.add(i["character"]);
    //   }
    //   OutputPass(emojis.join("  "));
    // }

    // //convert the words in the text to emoji if possible and return the text
    // String output = "";
    // var words = text.split(" ");
    // for (int i = 0; i < words.length; i++) {
    //   if (words[i] == ' ') {
    //     output += ' ';
    //   } else {
    //     var test = words[i].toLowerCase();
    //     var response = await http.get(Uri.parse("https://emoji-api.com/emojis?search=$test&access_key=ff75e24e8949a1087ebaf607bc2406711f0ef96a"));
    //     var data = jsonDecode(response.body);
    //     if (data==null) {
    //       output += words[i];
    //     } else {
    //       output += words[i];
    //       output += data[0]["character"];
    //     }
    //   }
    // }
    // OutputPass(output);

    var parser = EmojiParser();
    String output = "";
    var words = text.split(" ");
    for (int i = 0; i < words.length; i++) {
      if (words[i] == ' ') {
        output += ' ';
      } else {
        var test = words[i].toLowerCase();
        output += test;
        output += parser.get(test).code;
        output += ' ';
      }
    }
    OutputPass(output);


    callbackResult();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100, bottom: 10),
      child: Column(
        children: <Widget>[
          //box1
          Container(
            alignment: Alignment.centerLeft,
            child: Container(

              margin: EdgeInsets.only(bottom: 5),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xFFBEB6440),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text('Enter your text here',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          //box2
          Container(
            color: Color(0xFFBEFF5F5),
            child: TextField(
              controller: inputbox,
              //this textfiled should only take input as hindi from google fonts
              style: GoogleFonts.abhayaLibre(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(inputRegex)),
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          //box3
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Container(
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFBEB6440),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        inputbox.clear();
                        OutputPass('');
                        callbackResult();
                        // outputbox.clear();
                      },
                      child: Text("Clear",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Container(
                    //align this column at the right
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFB497174),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        getEmoji();
                      },
                      child: Text("Translate",
                        style: TextStyle(
                          color: Colors.white,
                        ),
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
}
