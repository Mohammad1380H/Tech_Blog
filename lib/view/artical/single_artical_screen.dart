import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tech_bloc/controller/artical_controller.dart';
import 'package:tech_bloc/controller/single_artical_controller.dart';
import 'package:tech_bloc/view/artical/artical_list_screen.dart';
import '../../component/my_colors.dart';
import '../../component/my_component.dart';
import '../../gen/assets.gen.dart';

// ignore: must_be_immutable
class SingleArticalScreen extends StatelessWidget {
  var articalController = Get.find<ArticalController>();
  var singleArticalController = Get.find<SingleArticalController>();

  SingleArticalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double listViewHeight = 170;
    double marginTag = size.width / 96;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => singleArticalController.singleArticalModel.value.id == null
              ? SizedBox(
                  width: Get.width,
                  child: SizedBox(height: Get.height - 100, child: loading(50)))
              : Column(
                  children: [
                    Stack(children: [
                      SizedBox(
                        height: Get.height / 2.9,
                        child: CachedNetworkImage(
                          imageUrl: singleArticalController
                              .singleArticalModel.value.image!,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30)),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover)),
                          ),
                          placeholder: (context, url) => const SpinKitDualRing(
                            color: FromColors.primaryColor,
                            size: 20,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.image_not_supported_outlined),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: FromGradiant.singleAppBar,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                        ),
                        height: 60,
                        child: Row(children: [
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          const Expanded(child: SizedBox()),
                          const Icon(
                            Icons.bookmark_outline,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            color: Colors.white,
                            icon: const Icon(Icons.share),
                            onPressed: () async {
                              List<XFile> files = [];
                              files.add(XFile(singleArticalController
                                  .singleArticalModel.value.image!));
                              files.add(XFile(singleArticalController
                                  .singleArticalModel.value.title!));
                              files.add(XFile(singleArticalController
                                  .singleArticalModel.value.author!));
                              files.add(XFile(singleArticalController
                                  .singleArticalModel.value.createdAt!));
                              files.add(XFile(singleArticalController
                                  .singleArticalModel.value.content!));

                              await Share.shareXFiles(files,
                                  text: "سلام بر شما", subject: "تقدیم شما");
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ]),
                      )
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            singleArticalController
                                .singleArticalModel.value.title!,
                            style: textTheme.displaySmall,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Image(
                                image: Assets.images.profile.provider(),
                                width: 55,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                  singleArticalController
                                      .singleArticalModel.value.author!,
                                  style: textTheme.displaySmall),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                  singleArticalController
                                      .singleArticalModel.value.createdAt!,
                                  style: textTheme.displaySmall)
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          HtmlWidget(
                            singleArticalController
                                .singleArticalModel.value.content!,
                            textStyle: textTheme.displaySmall,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 42,
                            child: ListView.builder(
                              itemCount:
                                  singleArticalController.tagsList.length,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    var id = singleArticalController
                                        .tagsList[index].id!;
                                    var tagTitle = singleArticalController
                                        .tagsList[index].title!;
                                    articalController.getArticalListWithId(id);
                                    Get.to(() => ArticalListScreen(
                                          title: tagTitle,
                                        ));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        20, 0, index == 0 ? marginTag : 0, 0),
                                    child: RelatedTags(
                                      size: size,
                                      textTheme: textTheme,
                                      title: singleArticalController
                                          .tagsList[index].title!,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          relatedArticalList(
                              listViewHeight: listViewHeight,
                              marginTag: marginTag,
                              textTheme: textTheme)
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    ));
  }

  Padding relatedArticalList(
      {required double listViewHeight,
      required double marginTag,
      required TextTheme textTheme}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
      child: SizedBox(
        height: listViewHeight * 1.17,
        child: ListView.builder(
          itemCount: singleArticalController.relatedArticalList.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                singleArticalController.getSingleArtical(
                    singleArticalController.relatedArticalList[index].id!);
                Get.to(() => SingleArticalScreen());
              },
              child: relatedArticalDelegate(index,
                  listViewHeight: listViewHeight,
                  marginTag: marginTag,
                  textTheme: textTheme),
            );
          },
        ),
      ),
    );
  }

  Padding relatedArticalDelegate(int index,
      {required double listViewHeight,
      required double marginTag,
      required TextTheme textTheme}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, index == 0 ? marginTag : 0, 0),
      child: Column(
        children: [
          Stack(children: [
            SizedBox(
              width: listViewHeight - listViewHeight / 7,
              height: listViewHeight - listViewHeight / 7,
              child: CachedNetworkImage(
                imageUrl:
                    singleArticalController.relatedArticalList[index].image!,
                imageBuilder: (context, imageProvider) => Container(
                  foregroundDecoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: FromGradiant.listArt,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderRadius: BorderRadius.circular(15)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: imageProvider)),
                ),
                placeholder: (c, i) => const SpinKitFadingCircle(
                  color: FromColors.primaryColor,
                  size: 50.0,
                ),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.image_not_supported_outlined),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120, right: 10),
              child: SizedBox(
                width: listViewHeight - listViewHeight / 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Text(
                        singleArticalController.relatedArticalList[index].author
                            .toString(),
                        style: textTheme.titleMedium,
                      ),
                    ),
                    //view
                    Text(
                      singleArticalController.relatedArticalList[index].view
                          .toString(),
                      style: textTheme.titleMedium,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    const Icon(
                      Icons.remove_red_eye,
                      color: Colors.white,
                      size: 19,
                    ),
                  ],
                ),
              ),
            ),
          ]),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SizedBox(
                width: listViewHeight / 1.15,
                child: Text(
                  textAlign: TextAlign.center,
                  singleArticalController.relatedArticalList[index].title
                      .toString(),
                  style: textTheme.displaySmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//flutter build apk --split-per-abi