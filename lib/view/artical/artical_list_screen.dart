import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_bloc/controller/artical_controller.dart';
import 'package:tech_bloc/view/artical/single_artical_screen.dart';
import '../../component/my_component.dart';
import '../../controller/single_artical_controller.dart';

// ignore: must_be_immutable
class ArticalListScreen extends StatelessWidget {
  String? title;
  var articalController = Get.find<ArticalController>();
  var singleArticalController = Get.find<SingleArticalController>();
  ArticalListScreen({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    var artList = articalController.articalList;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      appBar: specialAppBar(
        textTheme,
        action: Text(
          title == null ? "لیست مقالات جدید" : "دسته بندی بر اساس $title",
          style: textTheme.displayMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            child: Obx(
          () => articalController.isLoading.value
              ? loading(50)
              : ListView.builder(
                  itemCount: articalController.articalList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        singleArticalController
                            .getSingleArtical(artList[index].id!);
                        Get.to(() => SingleArticalScreen());
                      },
                      child: APListDelegate(index, textTheme,
                          image: artList[index].image!,
                          writer: artList[index].author!,
                          view: artList[index].view!,
                          title: artList[index].title!),
                    );
                  }),
        )),
      ),
    ));
  }
}
