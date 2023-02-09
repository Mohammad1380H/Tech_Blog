import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_bloc/controller/home_screen_controller.dart';
import 'package:tech_bloc/controller/register_controller.dart';
import 'package:tech_bloc/controller/single_artical_controller.dart';

import 'controller/artical_controller.dart';

class ArticalBindings implements Bindings {
  @override
  void dependencies() {
    debugPrint("اتصال مقاله");
    Get.put(ArticalController());
    Get.lazyPut(() => SingleArticalController());
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    debugPrint("اتصال رجیستر");
    Get.put(RegisterController());
  }
}

class HomeScreenBinding implements Bindings {
  @override
  void dependencies() {
    debugPrint("اتصال صفحه خانه");
    Get.put(HomeScreenController());
  }
}
