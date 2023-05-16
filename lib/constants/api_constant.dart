class ApiConstant {
  static const String baseUrl =
      "https://techblog.sasansafari.com/Techblog/api/";
  static const String baseUrlDl = "https://techblog.sasansafari.com/";
  static const String gethomeItems = "${baseUrl}home/?command=index";
  static const String postRegister = "${baseUrl}register/action.php";
  static const String postArticals = "${baseUrl}article/post.php";
  static const String getPublishedByMe =
      "${baseUrl}article/get.php?command=published_by_me&user_id=";
  static const String getArticalList =
      "${baseUrl}article/get.php?command=new&user_id=";
  static const String getPodcastList =
      "${baseUrl}podcast/get.php?command=new&user_id=1";
}

class ApiKeyConstant {
  static const String articalId = 'article_id';
  static const String title = 'title';
  static const String content = 'content';
  static const String catId = 'cat_id';
  static const String tagList = 'tag_list';
  static const String userId = 'user_id';
  static const String image = 'image';
  static const String command = 'command';

}
