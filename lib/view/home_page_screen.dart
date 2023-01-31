import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tech_bloc/component/my_colors.dart';
import 'package:tech_bloc/component/my_component.dart';
import 'package:tech_bloc/component/my_strings.dart';
import 'package:tech_bloc/controller/home_screen_controller.dart';
import '../gen/assets.gen.dart';
import '../models/data_model.dart';
import '../models/fake_data.dart';

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
  @override
  Widget build(BuildContext context) {
    // homeScreenController.getHomeItem();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          homePagePoster(),
          HomePageTags(marginTag: marginTag, size: size, textTheme: textTheme),
          SeeMoreDocs(marginTag: marginTag, textTheme: textTheme),
          topVisited(),
          SeeMorePods(marginTag: marginTag, textTheme: textTheme),
          topVisitedPods(),
          const SizedBox(
            height: 110,
          )
        ],
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

  Padding podDelegates(int index) {
    return Padding(
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
                  style: textTheme.headline3,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ),
          ),
        ],
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
              child: SizedBox(
                width: double.infinity,
                height: size.height * 0.23,
                child: CachedNetworkImage(
                  imageUrl: homeScreenController.poster.value.image!,
                  imageBuilder: (context, imageProvider) => Container(
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
          ),
          // poster info text
          Padding(
            padding: const EdgeInsets.fromLTRB(45, 105, 45, 0),
            child: Column(
              children: [
                //view and writer and date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      fakeData["writer"] + " - " + fakeData["date"],
                      style: textTheme.titleMedium,
                    ),
                    //view
                    Row(
                      children: [
                        Text(
                          fakeData["view"],
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
                  ],
                ),
                //
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

  Padding topVisited() {
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
              return artDelegate(index);
            },
          ),
        ),
      ),
    );
  }

  Padding artDelegate(int index) {
    return Padding(
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
                        style: textTheme.subtitle1,
                      ),
                    ),
                    //view
                    Text(
                      homeScreenController.topVisitedList[index].view
                          .toString(),
                      style: textTheme.subtitle1,
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
                  style: textTheme.headline3,
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
            style: textTheme.headline2,
          )
        ],
      ),
    );
  }
}

class SeeMoreDocs extends StatelessWidget {
  const SeeMoreDocs({
    Key? key,
    required this.marginTag,
    required this.textTheme,
  }) : super(key: key);

  final double marginTag;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: marginTag, top: 32),
      child: Row(
        children: [
          ImageIcon(
            Assets.icons.penLogo.provider(),
            color: FromColors.linkedTextColor,
          ),
          const SizedBox(width: 2),
          Text(
            FromStrings.hotDoc,
            style: textTheme.headline2,
          )
        ],
      ),
    );
  }
}

class HomePageTags extends StatelessWidget {
  const HomePageTags({
    Key? key,
    required this.marginTag,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final double marginTag;
  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
      child: SizedBox(
        height: 42,
        child: ListView.builder(
          itemCount: tagLists.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.fromLTRB(20, 0, index == 0 ? marginTag : 0, 0),
              child: TagsWidget(
                size: size,
                textTheme: textTheme,
                index: index,
                tagList: tagLists,
              ),
            );
          },
        ),
      ),
    );
  }
}

//////////////delegates //////////////////


//  CachedNetworkImage(
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