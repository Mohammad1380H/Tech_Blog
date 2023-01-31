import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_bloc/component/my_colors.dart';
import 'package:tech_bloc/view/splash_screen.dart';

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
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(textStyle:
                MaterialStateProperty.resolveWith<TextStyle?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return const TextStyle(
                fontFamily: "homa",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: FromColors.hintTexes);
          }
          return const TextStyle(
                fontFamily: "homa",
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: FromColors.hintTexes);

        }), backgroundColor:
                MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return FromColors.primaryColor;
          }
          return FromColors.regiterBtnColor;
        }))),
        textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontFamily: "homa",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: FromColors.posterTitle),
            displayMedium: TextStyle(
                fontFamily: "homa",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: FromColors.linkedTextColor),
            displaySmall: TextStyle(
                fontFamily: "homa",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: FromColors.articalPreviewTitle),
            headlineMedium: TextStyle(
                fontFamily: "homa",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: FromColors.hintTexes),
            titleMedium: TextStyle(
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
