import 'package:tech_bloc/constants/api_constant.dart';

class PodcastFileModel {
  String? id;
  String? podcastId;
  String? file;
  String? title;
  String? length;

  PodcastFileModel();
  PodcastFileModel.fromJson(Map<String,dynamic>element)
  {
   id = element["id"];
   podcastId = element["podcast_id"];
   file = ApiConstant.baseUrlDl+element["file"];
   title = element["title"];
   length = element["length"];    

  }
} 
 
 
 
 
 
 
 
 
    // "files": [
    //     {
    //         "id": "13",
    //         "podcast_id": "10",
    //         "file": "/Techblog/assets/upload/images/podcast/files/20221205182512.mp3",
    //         "title": "تکچی - قسمت 70 گوگل مورد تایید ما نیست!!!!",
    //         "length": "28"
    //     },