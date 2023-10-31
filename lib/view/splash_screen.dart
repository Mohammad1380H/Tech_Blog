import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_bloc/component/my_colors.dart';
import 'package:tech_bloc/component/my_strings.dart';
import 'package:tech_bloc/controller/home_screen_controller.dart';
import 'package:tech_bloc/gen/assets.gen.dart';
import 'package:get/get.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  @override
  void initState() {
    homeScreenController.getHomeItem();
    super.initState();
    Future.delayed(const Duration(microseconds: 200)).then(
      (value) {
        Get.offAndToNamed(FromStrings.routMainScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: Assets.images.splashIcon.provider()),
            SizedBox(
              height: size.height / 19,
            ),
            const SpinKitCircle(
              color: FromColors.primaryColor,
              size: 50.0,
            )
          ],
        ),
      )),
    );
  }
}
