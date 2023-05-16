import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_bloc/component/my_strings.dart';
import 'package:tech_bloc/constants/api_constant.dart';
import 'package:tech_bloc/services/dio_services.dart';

import '../constants/storage_constant.dart';
import '../gen/assets.gen.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditController = TextEditingController();
  TextEditingController activateCodeTextEditController =
      TextEditingController();
  String email = "";
  String userId = "";
  String status = "";
  register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditController.text,
      'command': 'register'
    };
    var response =
        await DioServices().postMethod(ApiConstant.postRegister, map);
    log(response.data);
    String jsonsDataString = response.data.toString();
    var jsonData = jsonDecode(jsonsDataString);
    email = emailTextEditController.text;
    userId = jsonData["user_id"];
  }

  verifyAndGoPage() async {
    Map<String, dynamic> map = {
      'email': emailTextEditController.text,
      'user_id': userId,
      'code': activateCodeTextEditController.text,
      'command': 'verify'
    };

    var response =
        await DioServices().postMethod(ApiConstant.postRegister, map);
    log(response.data + "ddf");
        String jsonsDataString = response.data.toString();
    var jsonData = jsonDecode(jsonsDataString);
    status = jsonData["response"];

    log("${status}eeee");
    switch (status) {
      case 'verified':
        {
          var storage = GetStorage();
          storage.write('token', jsonData['token']);
          storage.write('userId', jsonData['user_id']);

          Get.snackbar("تایید", "خوش آمدید!",
              backgroundColor: Colors.greenAccent);
        }
        Get.offAllNamed(FromStrings.routMainScreen);

        break;
      case 'incorrect_code':
        Get.snackbar("خطا", "کد نادرست است", backgroundColor: Colors.redAccent);
        break;
      case 'expired':
        Get.snackbar("خطا", "کد منقضی است", backgroundColor: Colors.redAccent);
        break;
      default:
    }
  }

  toggleLogin() {
    if (GetStorage().read(token) == null) {
      Get.toNamed(FromStrings.routRegisterIntro);
    } else {
      Get.bottomSheet(Container(
        height: Get.height / 2.7,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.icons.techBot.path,
                    width: 60,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: Text(
                      FromStrings.shareYourKnowledge,
                      style: Get.textTheme.displaySmall,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Text(FromStrings.detailWritingText,
                  style: Get.textTheme.displaySmall,
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(FromStrings.routManageArticalScreen);
                    },
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.icons.writeArticles.path,
                            width: 40,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(FromStrings.manageArts,
                              style: Get.textTheme.displaySmall,
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        Assets.icons.writePodcasts.path,
                        width: 40,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(FromStrings.managePods,
                          style: Get.textTheme.displaySmall,
                          textAlign: TextAlign.center),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ));
    }
  }
}
