import 'package:emoji_translator/languageProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = Provider.of<LanguageProvider>(context, listen: false).selectedLanguage;
  }


  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<LanguageProvider>(
          builder: (context, languageProvider, _) {
        return SingleChildScrollView(
          child: Container(
            width: mediaQuery.width,
            height: mediaQuery.height,
            padding: EdgeInsets.all(20),
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
                  padding: EdgeInsets.only(left: 20),
                  child: DropdownButton<String>(
                    focusColor: Colors.white,
                    value: _selectedLanguage,
                    iconEnabledColor: Colors.white,
                    items: <String>[
                      'English',
                      'Spanish',
                      'French',
                      'German',
                      'Italian',
                      'Japanese',
                      'Korean',
                      'Russian',
                      'Chinese',
                      'Arabic',
                      'Hindi',
                      'Portuguese',
                      'Turkish',
                      'Vietnamese',
                      'Greek',
                      'Hebrew',
                      'Indonesian',
                      'Polish',
                      'Swedish',
                      'Thai',
                      'Urdu',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: Color(0xFFBD6E4E5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }).toList(),
                    hint: Container(
                      width: 270,
                      padding: EdgeInsets.only(left: 40),
                      child: Text(
                        "$_selectedLanguage",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onChanged: (String value) {
                      languageProvider.setSelectedLanguage(value);
                      setState(() {
                        _selectedLanguage = Provider.of<LanguageProvider>(context, listen: false).selectedLanguage;
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
                      fontSize: 20,
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
                            // window.open(
                            //     'https://github.com/Abhinavxox', 'new tab');
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
      }),
    );
  }
}
