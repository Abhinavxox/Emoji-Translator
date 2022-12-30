import 'package:flutter/material.dart';
import 'package:emoji_translator/views/widgets/boot_screen.dart';
import 'package:provider/provider.dart';
import 'package:emoji_translator/languageProvider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Nunito"
      ),
      debugShowCheckedModeBanner: false,
      home : Scaffold(
        body: Container(
          child: BootScreen(),
        ),
      ),
    );
  }
}
