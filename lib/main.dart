import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_bloc/my_colors.dart';
import 'package:tech_bloc/splash_screen.dart';

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
                fontFamily: "homa",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: FromColors.posterTitle),
            subtitle1: TextStyle(
                fontFamily: "homa",
                fontSize: 14,
                color: FromColors.posterSubTitle)),
        primarySwatch: Colors.purple,
      ),
      home: const Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
