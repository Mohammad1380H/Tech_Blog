import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_bloc/models/podcast_model.dart';
import '../constants/api_constant.dart';
import '../models/article_model.dart';
import '../services/dio_services.dart';

class PodcastController extends GetxController {
  RxList<PodcastModel> podcastList = RxList();
  RxBool isLoading = false.obs;
  @override
  onInit() {
    super.onInit();
    getPodcastList();
    debugPrint("اتصال پادکست");
  }

  getPodcastList() async {
    isLoading.value = true;
    podcastList.clear(); // pull req and go to contribute
    var response = await DioServices().getMethod(ApiConstant.getPodcastList);
    if (response.statusCode == 200) {
      response.data.forEach((el) {
        podcastList.add(PodcastModel.fromJson(el));
      });
      isLoading.value = false;
    }
  }

}
