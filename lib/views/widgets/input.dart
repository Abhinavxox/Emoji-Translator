import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emoji_translator/languageProvider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;


class InputBox extends StatefulWidget {

  @override
  State<InputBox> createState() => _InputBoxState();

  //voidbackcall for button
  final VoidCallback callback;

  final Function(String) OutputPass;

  //constructor
  InputBox({this.callback, this.OutputPass});

}

class _InputBoxState extends State<InputBox> {
  String _selectedLanguage;

  String inputRegex;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = Provider.of<LanguageProvider>(context, listen: false).selectedLanguage;

    if(_selectedLanguage == "English") {
      inputRegex = "[a-zA-Z ]";
    } else if(_selectedLanguage == "Spanish") {
      inputRegex = "[a-zA-Z ]";
    } else if(_selectedLanguage == "French") {
      inputRegex = "[a-zA-Z ]";
    } else if(_selectedLanguage == "German") {
      inputRegex = "[a-zA-Z ]";
    } else if(_selectedLanguage == "Italian") {
      inputRegex = "[a-zA-Z ]";
    } else if(_selectedLanguage == "Japanese") {
      inputRegex = r"^[ぁ-んァ-ン一-龥]*\$";
    } else if(_selectedLanguage == "Korean") {
      inputRegex = r"^[가-힣]*\$";
    } else if(_selectedLanguage == "Chinese") {
      inputRegex = r"^[一-龥]*\$";
    } else if(_selectedLanguage == "Russian") {
      inputRegex = r"^[а-яА-Я]*\$";
    } else if(_selectedLanguage == "Arabic") {
      inputRegex = r"^[ء-ي]*\$";
    } else if(_selectedLanguage == "Hindi") {
      inputRegex = r"^[ँ-९]*\$";
    } else if(_selectedLanguage == "Portuguese") {
      inputRegex = "[a-zA-Z ]";
    } else if(_selectedLanguage == "Turkish") {
      inputRegex = "[a-zA-Z ]";
    } else if(_selectedLanguage == "Vietnamese"){
      inputRegex = "[a-zA-Z ]";
    } else if(_selectedLanguage == "Thai") {
      inputRegex = r"^[ก-๙]*\$";
    } else if(_selectedLanguage == "Indonesian") {
      inputRegex = "[a-zA-Z ]";
    }else if(_selectedLanguage == "Polish") {
      inputRegex = "[a-zA-Z ]";
    }else if(_selectedLanguage == "Swedish") {
      inputRegex = "[a-zA-Z ]";
    }else if(_selectedLanguage == "Urdu") {
      inputRegex = r"^[ء-ي]*\$";
    }else if(_selectedLanguage == "Thai") {
      inputRegex = r"^[ก-๙]*\$";
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
    _selectedLanguage = Provider
        .of<LanguageProvider>(context, listen: false)
        .selectedLanguage;

    //get the text from the text area
    String text = inputbox.text;

    //if text is empty
    if (text == '') {
      OutputPass('Error');
      callbackResult();
      return;
    }

    if(_selectedLanguage!='English'){
      var target = 'en';
      var source = '';
      if(_selectedLanguage == "Spanish") {
        source = 'es';
      } else if(_selectedLanguage == "French") {
        source = 'fr';
      } else if(_selectedLanguage == "German") {
        source = 'de';
      } else if(_selectedLanguage == "Italian") {
        source = 'it';
      } else if(_selectedLanguage == "Japanese") {
        source = 'ja';
      } else if(_selectedLanguage == "Korean") {
        source = 'ko';
      } else if(_selectedLanguage == "Chinese") {
        source = 'zh';
      } else if(_selectedLanguage == "Russian") {
        source = 'ru';
      } else if(_selectedLanguage == "Arabic") {
        source = 'ar';
      } else if(_selectedLanguage == "Hindi") {
        source = 'hi';
      } else if(_selectedLanguage == "Portuguese") {
        source = 'pt';
      } else if(_selectedLanguage == "Turkish") {
        source = 'tr';
      } else if(_selectedLanguage == "Vietnamese"){
        source = 'vi';
      } else if(_selectedLanguage == "Greek") {
        source = 'el';
      } else if(_selectedLanguage == "Hebrew") {
        source = 'he';
      } else if(_selectedLanguage == "Indonesian") {
        source = 'id';
      }else if(_selectedLanguage == "Polish") {
        source = 'pl';
      }else if(_selectedLanguage == "Swedish") {
        source = 'sv';
      }else if(_selectedLanguage == "Urdu") {
        source = 'ur';
      }else if(_selectedLanguage == "Thai") {
        source = 'th';
      }

      final encodedParams = "source_language=${Uri.encodeComponent(source)}&target_language=${Uri.encodeComponent(target)}&text=${Uri.encodeComponent(text)}";

      var headers = {
        'content-type': 'application/x-www-form-urlencoded',
        'Accept-Encoding': 'application/gzip',
        'X-RapidAPI-Key': '881f450017msh41cd9f347ce5a98p1e1536jsn42b8ed6494a1',
        'X-RapidAPI-Host': 'text-translator2.p.rapidapi.com'
      };

      await http.post(
        Uri.parse('https://text-translator2.p.rapidapi.com/translate'),
        headers: headers,
        body: encodedParams,
      ).then((response) {
        var data = JsonDecoder().convert(response.body);
        text = data['data']['translatedText'];
      }).catchError((error) {
        print(error);
      });
    }

    var parser = EmojiParser();
    String output = "";
    var words = text.split(" ");
    for (int i = 0; i < words.length; i++) {
      if (words[i] == ' ') {
        output += ' ';
      } else {
        var test = words[i].toLowerCase();
        output += test;
        try {
          print(parser.get(test));
          output += parser.get(test).code;
        } catch (e) {
          var emoji = await getEmojiFromJson(test);
          if (emoji != null) {
            output += emoji;
          }
        }
        output += ' ';
      }
    }
    OutputPass(output);
    callbackResult();
  }

  getEmojiFromJson(text) async {
    Map<String, dynamic> _emojiMap;
    String jsonString = await rootBundle.loadString('data.json');
    _emojiMap = json.decode(jsonString);
    for (String key in _emojiMap.keys) {
      List<String> keywords = _emojiMap[key]['keywords'].cast<String>();
      if (keywords.contains(text)) {
        return _emojiMap[key]['char'];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
        builder: (context, languageProvider, _) {
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
    );
  }
}
