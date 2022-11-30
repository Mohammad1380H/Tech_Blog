import 'package:tech_bloc/gen/assets.gen.dart';

class HashTag {
  String title;
  HashTag({required this.title});
}

class BlogsModel {
  int id;
  AssetGenImage urlImage;
  String title;
  String writer;
  String writerUrlImage;
  String date;
  String content;
  String view;

  BlogsModel({
    required this.id,
    required this.urlImage,
    required this.title,
    required this.writer,
    required this.writerUrlImage,
    required this.date,
    required this.content,
    required this.view,
  });
}
