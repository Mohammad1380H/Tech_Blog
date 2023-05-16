import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tech_bloc/component/my_colors.dart';
import 'package:tech_bloc/component/my_strings.dart';
import 'package:tech_bloc/controller/register_controller.dart';
import 'package:tech_bloc/gen/assets.gen.dart';
import 'package:validators/validators.dart';

// ignore: must_be_immutable
class RegisterIntro extends StatelessWidget {
  RegisterIntro({super.key});
  var registerController = Get.find<RegisterController>();
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            Assets.icons.techBot.path,
            height: 120,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: FromStrings.registerIntroMsg,
                    style: textTheme.headline3)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style,
              onPressed: () {
                _showEmailButtomSheet(context, size, textTheme);
              },
              child: const Text("بزن بریم"),
            ),
          )
        ]),
      ),
    ));
  }

  Future<dynamic> _showEmailButtomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    // RegExp isEmail = RegExp('^[a-z-0-9]+@');
    bool isEmailCorrect = false;
    bool isEmailEmpty = true;

    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    FromStrings.insertEmail,
                    style: textTheme.headline3,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    child: TextField(
                      controller: registerController.emailTextEditController,
                      onChanged: (value) {
                        isEmailCorrect = isEmail(value);
                        isEmailEmpty = value.isEmpty;
                      },
                      style: const TextStyle(
                          color: FromColors.articalPreviewTitle),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          hintText: "techblog@gmail.com",
                          hintStyle: textTheme.headline4),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          if (isEmailCorrect) {
                            registerController.register();
                            Navigator.pop(context);
                            _showActivateCodeButtomSheet(
                                context, size, textTheme);
                          }
                        },
                        child: Text("ادامه")),
                  )
                ],
              )),
            ),
          );
        }));
  }

  Future<dynamic> _showActivateCodeButtomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    // RegExp isEmail = RegExp('^[a-z-0-9]+@');
    bool isEmailCorrect = false;

    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    FromStrings.insertActivateCode,
                    style: textTheme.headline3,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    child: TextField(
                      controller: Get.find<RegisterController>()
                          .activateCodeTextEditController,
                      onChanged: (value) {
                        isEmailCorrect = isEmail(value);
                      },
                      style: const TextStyle(
                          color: FromColors.articalPreviewTitle),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          alignLabelWithHint: true,
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          hintText: "*****",
                          hintStyle: textTheme.headline4),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                        onPressed: () {

                          registerController.verifyAndGoPage();
                          // Navigator.of(context).pushReplacement(MaterialPageRoute(
                          //     builder: (context) => Categories()));
                        },
                        child: const Text("ادامه")),
                  )
                ],
              )),
            ),
          );
        }));
  }
}
