import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class FilePickerController extends GetxController {
  @override
  onInit() {
    super.onInit();
    log("file controller created now !");
  }

  Rx<PlatformFile> file = PlatformFile(name: 'nothing', size: 0).obs;
}
