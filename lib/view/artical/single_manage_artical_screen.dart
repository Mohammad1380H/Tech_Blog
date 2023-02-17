import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tech_bloc/component/my_strings.dart';
import 'package:tech_bloc/constants/dimens.dart';
import 'package:tech_bloc/controller/file_picker_controller.dart';
import 'package:tech_bloc/controller/home_screen_controller.dart';
import 'package:tech_bloc/controller/manage_artical_controller.dart';
import 'package:tech_bloc/services/file_picker_service.dart';
import 'package:tech_bloc/view/artical/artical_content_editor_screen.dart';
import '../../component/my_colors.dart';
import '../../component/my_component.dart';

// ignore: must_be_immutable
class SingleManageArticalScreen extends StatelessWidget {
  var manageArticalController = Get.find<ManageArticalController>();
  var pickerFileController = Get.find<FilePickerController>();
  SingleManageArticalScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double listViewHeight = 170;
    double marginTag = size.width / 96;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => manageArticalController.singleManageArticalModel.value.title ==
                  null
              ? SizedBox(
                  width: Get.width,
                  child: SizedBox(height: Get.height - 100, child: loading(50)))
              : Column(
                  children: [
                    Stack(children: [
                      SizedBox(
                        height: Get.height / 2.9,
                        width: Get.width,
                        child: filePickerController.file.value.name == "nothing"
                            ? CachedNetworkImage(
                                imageUrl: manageArticalController
                                    .singleManageArticalModel.value.image!,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30)),
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover)),
                                ),
                                placeholder: (context, url) =>
                                    const SpinKitDualRing(
                                  color: FromColors.primaryColor,
                                  size: 20,
                                ),
                                errorWidget: (context, url, error) =>
                                    const Center(
                                        child: Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 100,
                                )),
                              )
                            : Image.file(
                                File(filePickerController.file.value.path!),
                                fit: BoxFit.cover),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: FromGradiant.singleAppBar,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                        ),
                        height: 60,
                        child: Row(children: [
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          const Expanded(child: SizedBox()),
                          const SizedBox(
                            width: 10,
                          ),
                        ]),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: GestureDetector(
                            onTap: () async {
                              await openFile();
                            },
                            child: Container(
                              width: 100,
                              height: 40,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                color: Colors.purple,
                              ),
                              child: Center(
                                  child: Text(
                                "انتخاب تصویر +",
                                textAlign: TextAlign.center,
                                style: textTheme.headlineMedium,
                              )),
                            ),
                          ),
                        ),
                      )
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 32,
                          ),
                          //edit here
                          GestureDetector(
                            onTap: () {
                              changeTitle();
                            },
                            child: SeeMoreDocs(
                                marginTag: marginTag,
                                textTheme: textTheme,
                                title: FromStrings.editHere),
                          ),
                          //title
                          Text(
                            manageArticalController
                                .singleManageArticalModel.value.title!,
                            style: textTheme.displaySmall,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          //profile
                          Row(
                            children: const [
                              SizedBox(
                                width: 12,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //edit content
                          GestureDetector(
                            onTap: () {
                              Get.to(() => ArticalContentEditorScreen());
                            },
                            child: SeeMoreDocs(
                                marginTag: marginTag,
                                textTheme: textTheme,
                                title: FromStrings.editContent),
                          ),
                          //content
                          HtmlWidget(
                            "<p style='text-align:center;'>${manageArticalController.singleManageArticalModel.value.content!}</p>",
                            textStyle: textTheme.displaySmall,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // select cate
                          GestureDetector(
                            onTap: () => chooseCatBottonSheet(textTheme, size),
                            child: SeeMoreDocs(
                                marginTag: marginTag,
                                textTheme: textTheme,
                                title: FromStrings.selectCat),
                          ),
                          //tags
                          Text(
                            manageArticalController
                                    .singleManageArticalModel.value.catName ??
                                "متنی برای نمایش وجود ندارد",
                            style: textTheme.displaySmall,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                              onPressed: () async{
                                await manageArticalController.postArtical();
                              },
                              child: Text(
                                  manageArticalController.isLoading.value
                                      ? "صبر کنید"
                                      : "ارسال مقاله"))
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    ));
  }

  void changeTitle() {
    Get.defaultDialog(
      radius: 8,
      title: "ویرایش عنوان مقاله",
      titleStyle: const TextStyle(color: FromColors.scaffColor),
      backgroundColor: FromColors.primaryColor,
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          keyboardType: TextInputType.text,
          controller: manageArticalController.titleTextEditingController,
          style: const TextStyle(color: FromColors.linkedTextColor),
          decoration: const InputDecoration(
            filled: true,
            fillColor: FromColors.scaffColor,
            border: OutlineInputBorder(),
            hintText: "اینجا بنویس",
            hintStyle: TextStyle(color: FromColors.linkedTextColor),
          ),
        ),
      ),
      confirm: ElevatedButton(
          onPressed: () {
            manageArticalController.updateTitle();
            Get.back();
          },
          child: const Text("تایید")),
    );
  }

  chooseCatBottonSheet(TextTheme textTheme, Size size) {
    var homeScreenController = Get.find<HomeScreenController>();
    Get.bottomSheet(Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: FromColors.scaffColor,
      ),
      height: Get.height / 1.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          const SizedBox(
            height: 16,
          ),
          Text(
            "انتخاب دسته بندی ",
            style: textTheme.displaySmall,
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: Get.height / 8,
            width: double.maxFinite,
            child: GridView.builder(
              padding: EdgeInsets.only(right: FromDimens.marginTag / 2),
              scrollDirection: Axis.horizontal,
              itemCount: homeScreenController.tagList.length,
              shrinkWrap: true,
              //physics: ClampingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 0.3,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    manageArticalController.singleManageArticalModel
                        .update((val) {
                      val!.catId = homeScreenController.tagList[index].id;
                      val.catName = homeScreenController.tagList[index].title;
                    });
                    Get.back();
                  },
                  child: RelatedTags(
                    size: size,
                    textTheme: textTheme,
                    title: homeScreenController.tagList[index].title!,
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    ));
  }
}
//flutter build apk --split-per-abi
