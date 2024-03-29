import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_bloc/controller/file_picker_controller.dart';

FilePickerController filePickerController = Get.put(FilePickerController());
Future openFile() async {
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.image);
  filePickerController.file.value = result!.files.first;
  debugPrint("${filePickerController.file.value.path}ffff");
}
