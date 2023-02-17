// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:tech_bloc/component/my_component.dart';
import 'package:tech_bloc/controller/manage_artical_controller.dart';

class ArticalContentEditorScreen extends StatelessWidget {
  ArticalContentEditorScreen({super.key});
  HtmlEditorController controller = HtmlEditorController();
  ManageArticalController manageArticalController =
      Get.find<ManageArticalController>();
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        controller.clearFocus();
      },
      child: Scaffold(
        appBar:
            specialAppBar(textTheme, action: const Text("نوشتن/ ویرایش مقاله")),
        body: SingleChildScrollView(
            child: Column(
          children: [
            HtmlEditor(
              controller: controller,
              htmlEditorOptions: HtmlEditorOptions(
                  hint: "مطلبتو اینجا بنویس",
                  shouldEnsureVisible: true,
                  initialText: manageArticalController
                      .singleManageArticalModel.value.content),
              callbacks: Callbacks(
                onChangeContent: (p0) {
                  manageArticalController.singleManageArticalModel
                      .update((val) {
                    val!.content = p0;
                  });
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}
