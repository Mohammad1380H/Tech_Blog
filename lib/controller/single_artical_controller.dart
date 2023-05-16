import 'package:get/get.dart';
import 'package:tech_bloc/models/single_artica_model.dart';
import 'package:tech_bloc/models/tags_model.dart';
import '../constants/api_constant.dart';
import '../models/article_model.dart';
import '../services/dio_services.dart';

class SingleArticalController extends GetxController {
  Rx<SingleArticalModel> singleArticalModel = SingleArticalModel().obs;
  RxList<ArticalModel> relatedArticalList = RxList();
  RxList<TagsModel> tagsList = RxList();

  getSingleArtical(String id) async {
    singleArticalModel = SingleArticalModel()
        .obs; // we don't use isLoading ! Because SingleArtical has null field with default constructor
    relatedArticalList.clear();
    tagsList.clear();
    var response = await DioServices().getMethod(
        "${ApiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=");
    if (response.statusCode == 200) {
      singleArticalModel.value = SingleArticalModel.fromJson(response.data);
      response.data['related'].forEach((el) {
        relatedArticalList.add(ArticalModel.fromJson(el));
      });
      response.data['tags'].forEach((el) {
        tagsList.add(TagsModel.fromJson(el));
      });
    }
  }
}
