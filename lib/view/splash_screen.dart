import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_bloc/gen/assets.gen.dart';
import 'package:tech_bloc/view/main_page_screen.dart';
import 'package:tech_bloc/my_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
          builder: (context) => const MainPage(),
        ));
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
            const SpinKitFoldingCube(
              color: FromColors.primaryColor,
              size: 50.0,
            )
          ],
        ),
      )),
    );
  }
}
