import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_bloc/component/my_colors.dart';
import 'package:tech_bloc/component/my_component.dart';
import 'package:tech_bloc/component/my_strings.dart';
import 'package:tech_bloc/controller/artical_controller.dart';
import 'package:tech_bloc/controller/home_screen_controller.dart';
import 'package:tech_bloc/controller/podcast_controller.dart';
import 'package:tech_bloc/controller/single_artical_controller.dart';
import 'package:tech_bloc/view/artical/artical_list_screen.dart';
import '../../gen/assets.gen.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.marginTag,
    required this.listViewHeight,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double marginTag;
  final double listViewHeight;
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  SingleArticalController singleArticalController =
      Get.put(SingleArticalController());
  ArticalController articalController = Get.put(ArticalController());
  PodcastController podcastController = Get.put(PodcastController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          homePagePoster(),
          tags(),
          GestureDetector(
              onTap: () {
                articalController.getArticalList();
                Get.toNamed(FromStrings.routArticalListScreen);
              },
              child: SeeMoreDocs(
                marginTag: marginTag,
                textTheme: textTheme,
                title: FromStrings.hotDoc,
              )),
          topVisited(
              listViewHeight: listViewHeight,
              marginTag: marginTag,
              textTheme: textTheme),
          GestureDetector(
              onTap: () {
                podcastController.getPodcastList();
                Get.toNamed(FromStrings.routPodcastListScreen);
              },
              child: SeeMorePods(marginTag: marginTag, textTheme: textTheme)),
          topVisitedPods(),
          const SizedBox(
            height: 110,
          )
        ],
      ),
    );
  }

  Padding tags() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
      child: SizedBox(
        height: 42,
        child: Obx(
          () => ListView.builder(
            itemCount: homeScreenController.tagList.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  var id = homeScreenController.tagList[index].id!;
                  var tagTitle = homeScreenController.tagList[index].title!;
                  articalController.getArticalListWithId(id);
                  Get.to(() => ArticalListScreen(
                        title: tagTitle,
                      ));
                },
                child: Padding(
                  padding:
                      EdgeInsets.fromLTRB(20, 0, index == 0 ? marginTag : 0, 0),
                  child: TagsWidget(
                    size: size,
                    textTheme: textTheme,
                    title: homeScreenController.tagList[index].title!,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Padding topVisitedPods() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
      child: SizedBox(
        height: listViewHeight * 1.15,
        child: Obx(
          () => ListView.builder(
            itemCount: homeScreenController.topPodcasts.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return podDelegates(index);
            },
          ),
        ),
      ),
    );
  }

  GestureDetector podDelegates(int index) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(FromStrings.routSinglePodcastScreen,
            arguments: homeScreenController.topPodcasts[index]);
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, index == 0 ? marginTag : 0, 0),
        child: Column(
          children: [
            SizedBox(
              width: listViewHeight - listViewHeight / 7,
              height: listViewHeight - listViewHeight / 7,
              child: CachedNetworkImage(
                imageUrl: homeScreenController.topPodcasts[index].poster!,
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
                    const Icon(Icons.music_off_outlined),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: SizedBox(
                  width: listViewHeight / 1.15,
                  child: Text(
                    textAlign: TextAlign.center,
                    homeScreenController.topPodcasts[index].title!,
                    style: textTheme.displaySmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Obx homePagePoster() {
    return Obx(
      () => Stack(
        children: [
          //poster
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 20),
              child: CachedNetworkImage(
                imageUrl: homeScreenController.poster.value.image!,
                imageBuilder: (context, imageProvider) => Container(
                  width: double.infinity,
                  height: size.height * 0.23,
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                        colors: FromGradiant.cover,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                ),
                placeholder: (context, url) => const SpinKitCircle(
                  color: FromColors.primaryColor,
                  size: 50.0,
                ),
                errorWidget: (c, u, e) =>
                    const Icon(Icons.image_not_supported_outlined),
              ),
            ),
          ),
          // poster info text
          Padding(
            padding: const EdgeInsets.fromLTRB(45, 120, 45, 0),
            child: Column(
              children: [
                //view and writer and date
                Text(
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  homeScreenController.poster.value.title!,
                  style: textTheme.displayLarge,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding topVisited(
      {required double listViewHeight,
      required double marginTag,
      required TextTheme textTheme}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
      child: SizedBox(
        height: listViewHeight * 1.17,
        child: Obx(
          () => ListView.builder(
            itemCount: homeScreenController.topVisitedList.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return artDelegate(index,
                  listViewHeight: listViewHeight,
                  marginTag: marginTag,
                  textTheme: textTheme);
            },
          ),
        ),
      ),
    );
  }

  GestureDetector artDelegate(int index,
      {required double listViewHeight,
      required double marginTag,
      required TextTheme textTheme}) {
    return GestureDetector(
      onTap: () {
        singleArticalController
            .getSingleArtical(homeScreenController.topVisitedList[index].id!);
        Get.toNamed(FromStrings.routSingleScreen);
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, index == 0 ? marginTag : 0, 0),
        child: Column(
          children: [
            Stack(children: [
              SizedBox(
                width: listViewHeight - listViewHeight / 7,
                height: listViewHeight - listViewHeight / 7,
                child: CachedNetworkImage(
                  imageUrl: homeScreenController.topVisitedList[index].image!,
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
                          homeScreenController.topVisitedList[index].author
                              .toString(),
                          style: textTheme.titleMedium,
                        ),
                      ),
                      //view
                      Text(
                        homeScreenController.topVisitedList[index].view
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
                    Get.find<HomeScreenController>()
                        .topVisitedList[index]
                        .title
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
      ),
    );
  }
}

///////////////classes and widgets in this lib////////////////////

class SeeMorePods extends StatelessWidget {
  const SeeMorePods({
    Key? key,
    required this.marginTag,
    required this.textTheme,
  }) : super(key: key);

  final double marginTag;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: marginTag, top: 15),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.podIcon.provider(),
            color: FromColors.linkedTextColor,
          ),
          const SizedBox(width: 2),
          Text(
            FromStrings.hotPod,
            style: textTheme.displayMedium,
          )
        ],
      ),
    );
  }
}


//////////////delegates //////////////////

//                 imageUrl: homeScreenController.topVisitedList[index].image!,
//                 imageBuilder: (context, imageProvider) => Container(
//                   foregroundDecoration: BoxDecoration(
//                       gradient: const LinearGradient(
//                           colors: FromGradiant.listArt,
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter),
//                       borderRadius: BorderRadius.circular(15)),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       image: DecorationImage(
//                           fit: BoxFit.cover, image: imageProvider)),
//                 ),
//                 placeholder: (c, i) => const SpinKitCircle(
//                   color: FromColors.primaryColor,
//                   size: 50.0,
//                 ),
//                 errorWidget: (context, url, error) =>
//                     const Icon(Icons.image_not_supported_outlined),
//               ),