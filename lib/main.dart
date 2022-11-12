import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TechBlog',
      // ignore: prefer_const_literals_to_create_immutables
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // ignore: prefer_const_literals_to_create_immutables
      supportedLocales: [
        const Locale('fa', ''), // English, no country code
      ],
      theme: ThemeData(
        textTheme: const TextTheme(
            headline1: TextStyle(
                fontFamily: "cinema", fontSize: 20, color: Colors.black),
            headline2: TextStyle(
                fontFamily: "cinema", fontSize: 20, color: Colors.white),
            headline3: TextStyle(
                fontFamily: "cinema", fontSize: 16, color: Colors.black),
            bodyText1: TextStyle(
                fontFamily: "homa", fontSize: 12, color: Colors.black),
            bodyText2: TextStyle(
                fontFamily: "homa", fontSize: 12, color: Colors.white)),
        primarySwatch: Colors.purple,
      ),
      home: const Scaffold(),
    );
  }
}
