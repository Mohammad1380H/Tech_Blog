import '../constants/api_constant.dart';

class SingleArticalModel {
  String? id;
  String? title;
  String? content;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  bool? isFavorite;

  SingleArticalModel();
  SingleArticalModel.simpleData(this.title, this.content, this.image);
  SingleArticalModel.fromJson(Map<String, dynamic> element) {
    var info = element['info'];
    id = info["id"];
    title = info["title"];
    content = info["content"];
    image = ApiConstant.baseUrlDl + info["image"];
    catId = info["cat_id"];
    catName = info["cat_name"];
    author = info["author"];
    view = info["view"];
    status = info["status"];
    createdAt = info["created_at"];
    isFavorite = element['isFavorite'];
  }
}
