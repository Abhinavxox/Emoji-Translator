import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart' as mlkit;
import 'package:flutter_easyloading/flutter_easyloading.dart';


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

    // EasyLoading.addStatusCallback((status) {
    //   print('EasyLoading Status $status');
    //   if (status == EasyLoadingStatus.dismiss) {
    //     _timer?.cancel();
    //   }
    // });
    // EasyLoading.showSuccess('Use in initState');
    // // EasyLoading.removeCallbacks();
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
    print(_selectedLanguage);
    if(_selectedLanguage!='English'){
      mlkit.TranslateLanguage sourceLanguage = mlkit.TranslateLanguage.hindi;
      if(_selectedLanguage == "English") {

      } else if(_selectedLanguage == "Spanish") {
        sourceLanguage = mlkit.TranslateLanguage.spanish;
      } else if(_selectedLanguage == "French") {
        sourceLanguage = mlkit.TranslateLanguage.french;
      } else if(_selectedLanguage == "German") {
        sourceLanguage = mlkit.TranslateLanguage.german;
      } else if(_selectedLanguage == "Italian") {
        sourceLanguage = mlkit.TranslateLanguage.italian;
      } else if(_selectedLanguage == "Japanese") {
        sourceLanguage = mlkit.TranslateLanguage.japanese;
      } else if(_selectedLanguage == "Korean") {
        sourceLanguage = mlkit.TranslateLanguage.korean;
      } else if(_selectedLanguage == "Russian") {
        sourceLanguage = mlkit.TranslateLanguage.russian;
      } else if(_selectedLanguage == "Chinese") {
        sourceLanguage = mlkit.TranslateLanguage.chinese;
      } else if(_selectedLanguage == "Arabic") {
        sourceLanguage = mlkit.TranslateLanguage.arabic;
      } else if(_selectedLanguage == "Hindi") {
        sourceLanguage = mlkit.TranslateLanguage.hindi;
      } else if(_selectedLanguage == "Portuguese") {
        sourceLanguage = mlkit.TranslateLanguage.portuguese;
      } else if(_selectedLanguage == "Turkish") {
        sourceLanguage = mlkit.TranslateLanguage.turkish;
      } else if(_selectedLanguage == "Vietnamese") {
        sourceLanguage = mlkit.TranslateLanguage.vietnamese;
      } else if(_selectedLanguage == "Greek") {
        sourceLanguage = mlkit.TranslateLanguage.greek;
      } else if(_selectedLanguage == "Hebrew") {
        sourceLanguage = mlkit.TranslateLanguage.hebrew;
      } else if(_selectedLanguage == "Indonesian") {
        sourceLanguage = mlkit.TranslateLanguage.indonesian;
      } else if(_selectedLanguage == "Polish") {
        sourceLanguage = mlkit.TranslateLanguage.polish;
      } else if(_selectedLanguage == "Swedish") {
        sourceLanguage = mlkit.TranslateLanguage.swedish;
      } else if(_selectedLanguage == "Thai") {
        sourceLanguage = mlkit.TranslateLanguage.thai;
      } else if(_selectedLanguage == "Urdu") {
        sourceLanguage = mlkit.TranslateLanguage.urdu;
      }

      sourceLanguage = mlkit.TranslateLanguage.french;
      const mlkit.TranslateLanguage targetLanguage = mlkit.TranslateLanguage.english;
      final onDeviceTranslator = mlkit.OnDeviceTranslator(sourceLanguage: sourceLanguage, targetLanguage: targetLanguage);
      final translation = await onDeviceTranslator.translateText(
        "Bonjour"
      );
      text = translation;
      print(text);
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

    //loader
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    // print(_selectedLanguage);
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
                        //loader
                        EasyLoading.show(status: 'loading...');
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
