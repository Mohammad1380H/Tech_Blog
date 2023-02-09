import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tech_bloc/component/my_colors.dart';
import 'package:tech_bloc/component/my_strings.dart';
import 'package:tech_bloc/controller/register_controller.dart';
import 'package:tech_bloc/gen/assets.gen.dart';
import 'package:validators/validators.dart';

// ignore: must_be_immutable
class ManageArticalScreen extends StatelessWidget {
  ManageArticalScreen({super.key});
  var registerController = Get.find<RegisterController>();
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Expanded(child: SizedBox()),
          SvgPicture.asset(
            Assets.icons.techBotSad.path,
            height: 120,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: FromStrings.emptyManageArticalScreen,
                    style: textTheme.displaySmall)),
          ),
          const Expanded(child: SizedBox()),
          ElevatedButton(          
            style: Theme.of(context).elevatedButtonTheme.style,
            onPressed: () {},
            child: const Text("بریم برای نوشتن یه مقاله‌ی باحال"),
            
          ),
          const SizedBox(height: 20,)
        ]),
      ),
    ));
  }
}
