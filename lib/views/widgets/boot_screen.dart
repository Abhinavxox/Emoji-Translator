import 'package:flutter/material.dart';
import 'package:emoji_translator/views/home.dart';

class BootScreen extends StatefulWidget {
  @override
  State<BootScreen> createState() => _BootScreenState();
}

class _BootScreenState extends State<BootScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: mediaQuery.width,
        height: mediaQuery.height,
        color: Color(0xFFBD6E4E5),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                child: Column(
                    children: <Widget>[
                      Container(
                        child: Container(
                          child: Text("EMOJI TRANSLATOR",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Image.asset('assets/images/box.png'),
                        ),
                      ),

                    ]
                )
            ),

            Container(
              // Change language button

              child: Container(
                margin: EdgeInsets.only(top: 100),
                padding: EdgeInsets.all(10),
                width: 200,
                decoration: BoxDecoration(
                  color: Color(0xFFBEB6440),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage()),
                    );
                  },
                  child: Text("Get Started",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}