import 'dart:developer';

import 'package:dio/dio.dart' as dio_;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_bloc/component/my_strings.dart';
import 'package:tech_bloc/controller/file_picker_controller.dart';
import 'package:tech_bloc/models/article_model.dart';
import 'package:tech_bloc/models/single_artica_model.dart';
import 'package:tech_bloc/models/tags_model.dart';
import '../constants/api_constant.dart';
import '../services/dio_services.dart';

class ManageArticalController extends GetxController {
  TextEditingController titleTextEditingController = TextEditingController();
  RxList<ArticalModel> articalList = RxList();
  Rx<SingleArticalModel> singleManageArticalModel = SingleArticalModel.fakeData(
          "اینجا عنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن",
          """من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی""",
          "https://images.kojaro.com/2017/10/27b9d20a-bc85-4175-b144-536c4e42677f.jpg")
      .obs;
  RxList<TagsModel> tagsList = RxList();
  RxBool isLoading = false.obs;
  @override
  onInit() {
    super.onInit();
    getArticalList(GetStorage().read('userId'));
  }

  getArticalList(String id) async {
    articalList.clear(); // pull req and go to contribute
    isLoading.value = true; // pull req 2 """"""""""""""
    var response =
        await DioServices().getMethod(ApiConstant.getPublishedByMe + id);
    if (response.statusCode == 200) {
      response.data.forEach((el) {
        articalList.add(ArticalModel.fromJson(el));
      });
      isLoading.value = false;
    }
  }

  updateTitle() {
    //print(GetStorage().read(FromStrings.token));

    singleManageArticalModel.update((val) {
      val!.title = titleTextEditingController.text;
    });
  }

  postArtical() async {
    isLoading.value = true;

    var fileController = Get.find<FilePickerController>();
    debugPrint(singleManageArticalModel.value.title);
    debugPrint(singleManageArticalModel.value.content);
    debugPrint(singleManageArticalModel.value.catId);
    debugPrint(GetStorage().read(FromStrings.userId));
    debugPrint(GetStorage().read(FromStrings.token));
    debugPrint(fileController.file.value.path!);
    Map<String, dynamic> map = {
      ApiKeyConstant.title: singleManageArticalModel.value.title,
      ApiKeyConstant.content: singleManageArticalModel.value.content,
      ApiKeyConstant.catId: singleManageArticalModel.value.catId,
      ApiKeyConstant.tagList: [],
      ApiKeyConstant.userId: GetStorage().read(FromStrings.userId),
      ApiKeyConstant.image:
          await dio_.MultipartFile.fromFile(fileController.file.value.path!),
      ApiKeyConstant.command: "store",
    };
    var response =
        await DioServices().postMethod(ApiConstant.postArticals, map);
    isLoading.value = false;
    log(response.data.toString());
  }
}
