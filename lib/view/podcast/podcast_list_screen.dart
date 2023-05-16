import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_bloc/controller/podcast_controller.dart';
import '../../component/my_component.dart';

// ignore: must_be_immutable
class PodcastListScreen extends StatelessWidget {
  String? title;
  var podcastController = Get.find<PodcastController>();
  // var singleArticalController = Get.find<SingleArticalController>();
  PodcastListScreen({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    var podList = podcastController.podcastList;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      appBar: specialAppBar(
        textTheme,
        action: Text(
          title == null ? "لیست پادکستهای جدید" : "دسته بندی بر اساس $title",
          style: textTheme.displayMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            child: Obx(
          () => podcastController.isLoading.value
              ? loading(50)
              : ListView.builder(
                  itemCount: podcastController.podcastList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // singleArticalController
                        //     .getSingleArtical(artList[index].id!);
                        // Get.to(() => SingleArticalScreen());
                      },
                      child: APListDelegate(index, textTheme,
                          image: podList[index].poster!,
                          writer: podList[index].publisher??" ",
                          view:"",
                          title: podList[index].title!),
                    );
                  }),
        )),
      ),
    ));
  }
}
