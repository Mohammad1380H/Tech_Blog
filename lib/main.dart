import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_bloc/bindings.dart';
import 'package:tech_bloc/component/my_colors.dart';
import 'package:tech_bloc/component/my_strings.dart';
import 'package:tech_bloc/my_http_overrides.dart';
import 'package:tech_bloc/view/artical/artical_list_screen.dart';
import 'package:tech_bloc/view/artical/manage_artical_screen.dart';
import 'package:tech_bloc/view/artical/single_manage_artical_screen.dart';
import 'package:tech_bloc/view/mainScreen/main_page_screen.dart';
import 'package:tech_bloc/view/register/register_intro.dart';
import 'package:tech_bloc/view/artical/single_artical_screen.dart';
import 'package:tech_bloc/view/splash_screen.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
  await GetStorage.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
            name: FromStrings.routMainScreen,
            page: () => MainPage(),
            binding: RegisterBinding()),
        GetPage(
          name: FromStrings.routSingleScreen,
          page: () => SingleArticalScreen(),
        ),
        GetPage(
          name: FromStrings.routRegisterIntro,
          page: () => RegisterIntro(),
        ),
        GetPage(
          name: FromStrings.routArticalListScreen,
          page: () => ArticalListScreen(),
        ),
        GetPage(
            name: FromStrings.routManageArticalScreen,
            page: () => ManageArticalScreen(),
            binding: ManageArticalBinding()),
        GetPage(
            name: FromStrings.routSingleManageArticalScreen,
            page: () => SingleManageArticalScreen(),
            binding: ManageArticalBinding()),

      ],
      debugShowCheckedModeBanner: false,
      title: 'TechBlog',
      locale: const Locale('fa'),
      theme: lightTheme(),
      home: const Scaffold(
        body: SplashScreen(),
      ),
    );
  }

  ThemeData lightTheme() {
    return ThemeData(
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
      }), backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
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
    );
  }
}
