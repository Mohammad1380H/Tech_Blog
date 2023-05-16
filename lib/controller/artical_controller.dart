import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../constants/api_constant.dart';
import '../models/article_model.dart';
import '../services/dio_services.dart';

class ArticalController extends GetxController {
  RxList<ArticalModel> articalList = RxList();
  RxBool isLoading = false.obs;
  @override
  onInit() {
    super.onInit();
    getArticalList();
    debugPrint("اتصال مقاله");
  }

  getArticalList() async {
    isLoading.value = true;
    articalList.clear(); // pull req and go to contribute
    var response = await DioServices().getMethod(ApiConstant.getArticalList);
    if (response.statusCode == 200) {
      response.data.forEach((el) {
        articalList.add(ArticalModel.fromJson(el));
      });
      isLoading.value = false;
    }
  }

  getArticalListWithId(String id) async {
    articalList.clear();
    var response = await DioServices().getMethod(
        "${ApiConstant.baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=${GetStorage().read('userId')?? " "}");
    if (response.statusCode == 200) {
      
      response.data.forEach((el) {
        articalList.add(ArticalModel.fromJson(el));
      });
    }
  }
}
