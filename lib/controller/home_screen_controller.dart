import 'dart:developer';

import 'package:get/get.dart';
import 'package:tech_bloc/component/api_constant.dart';
import 'package:tech_bloc/gen/assets.gen.dart';
import 'package:tech_bloc/models/article_model.dart';
import 'package:tech_bloc/models/podcast_model.dart';
import 'package:tech_bloc/models/poster_model.dart';
import 'package:tech_bloc/models/tags_model.dart';
import 'package:tech_bloc/services/dio_services.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel> poster = PosterModel(
          id: "1",
          title: "عدم بار گزاری تصویر",
          image: Assets.images.artPic.path)
      .obs;
  late Rx<List<TagsModel>> tagList;
  RxList<ArticalModel> topVisitedList = RxList();
  late RxList<PodcastModel> topPodcasts = RxList();

  @override
  onInit() {
    super.onInit();
    getHomeItem();
  }

  getHomeItem() async {
    var response = await DioServices().getMethod(ApiConstant.gethomeItems);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((el) {
        topVisitedList.add(ArticalModel.fromJson(el));
      });
      response.data['top_podcasts'].forEach((el) {
        topPodcasts.add(PodcastModel.fromJson(el));
      });
      poster.value = PosterModel.fromJson(response.data['poster']);
    }
  }
}
