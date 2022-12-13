import 'package:flutter/material.dart';

class InputBox extends StatefulWidget {

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          //box1
          Container(
            alignment: Alignment.centerLeft,
            child: Container(

              margin: EdgeInsets.only(bottom: 5),
              padding: EdgeInsets.all(10),
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
              decoration: InputDecoration(
                hintText: "...",
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
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
                      // onPressed: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => Homepage()),
                      //   );
                      // },
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
                      // onPressed: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => Homepage()),
                      //   );
                      // },
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
