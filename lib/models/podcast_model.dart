
import 'package:tech_bloc/constants/api_constant.dart';

class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? publisher;
  String? view;
  String? status;
  String? createdAt;

  PodcastModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.publisher,
    required this.view,
    required this.status,
    required this.createdAt,
  });

  PodcastModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    poster = ApiConstant.baseUrlDl + (element["poster"] ?? " ");
    publisher = element["author"] ?? element["publisher"] ?? ''; // a bug in backend !!
    view = element["view"];
    status = element["status"];
    createdAt = element["created_at"];
  }
}
