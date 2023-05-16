import 'dart:developer';

import 'package:get/get.dart';
import 'package:tech_bloc/constants/api_constant.dart';
import 'package:tech_bloc/gen/assets.gen.dart';
import 'package:tech_bloc/models/article_model.dart';
import 'package:tech_bloc/models/podcast_model.dart';
import 'package:tech_bloc/models/poster_model.dart';
import 'package:tech_bloc/models/tags_model.dart';
import 'package:tech_bloc/services/dio_services.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel> poster =
      PosterModel(id: "1", title: "", image: Assets.images.artPic.path).obs;
  RxList<TagsModel> tagList = RxList();
  RxList<ArticalModel> topVisitedList = RxList();
  late RxList<PodcastModel> topPodcasts = RxList();
  RxBool isLoading = false.obs;
  @override
  onInit() {
    super.onInit();
    getHomeItem();
  }

  getHomeItem() async {
    isLoading.value = true;
    topVisitedList.clear();
    topPodcasts.clear();
    tagList.clear();

    var response = await DioServices().getMethod(ApiConstant.gethomeItems);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((el) {
        topVisitedList.add(ArticalModel.fromJson(el));
      });
      response.data['top_podcasts'].forEach((el) {
        topPodcasts.add(PodcastModel.fromJson(el));
      });


      response.data['tags'].forEach((el) {
        tagList.add(TagsModel.fromJson(el));
      });     
      poster.value = PosterModel.fromJson(response.data['poster']);
      isLoading.value = false;
    } else {
      log("ddddddddd");
    }
  }
}
