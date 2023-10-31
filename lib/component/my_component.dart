import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'package:tech_bloc/gen/assets.gen.dart';
import 'package:tech_bloc/component/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';


// ignore: must_be_immutable

// ignore: must_be_immutable
class TechDivider extends StatelessWidget {
  TechDivider({
    Key? key,
    required this.width,
  }) : super(key: key);

  double width;

  @override
  Widget build(BuildContext context) {
    return Divider(
        color: FromColors.dividerColor, indent: width, endIndent: width);
  }
}

class TagsWidget extends StatelessWidget {
  const TagsWidget(
      {Key? key,
      required this.size,
      required this.textTheme,
      required this.title})
      : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: FromGradiant.tags,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft),
          borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Row(
          children: [
            ImageIcon(
              Assets.icons.hashTag.provider(),
              size: 19,
              color: Colors.white,
            ),
            SizedBox(
              width: size.width / 40,
            ),
            Text(
              title,
              style: textTheme.displayLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class RelatedTags extends StatelessWidget {
  const RelatedTags(
      {Key? key,
      required this.size,
      required this.textTheme,
      required this.title})
      : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: FromColors.relatedTagsColor,
          borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 8, 0),
        child: Row(
          children: [
            SizedBox(
              width: size.width / 40,
            ),
            Text(
              title,
              style: textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}

void openUrl(String url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    launchUrl(uri);
  } else {
    log("can't opne $url");
  }
}

PreferredSize specialAppBar(TextTheme textTheme, {required Widget action}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(65),
    child: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [Center(child: action)],
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            decoration: BoxDecoration(
                color: FromColors.primaryColor.withAlpha(170),
                shape: BoxShape.circle),
            child: const Icon(Icons.arrow_back),
          ),
        ),
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
Padding APListDelegate(int index, TextTheme textTheme,
    {required String title,
    required String image,
    required String writer,
    required String view}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: Get.width / 4,
          height: Get.height / 8,
          child: CachedNetworkImage(
            imageUrl: image,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (c, u) => const SpinKitChasingDots(
              color: FromColors.primaryColor,
              size: 15,
            ),
            errorWidget: (context, url, error) =>
                const Icon(Icons.image_not_supported_outlined),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: Get.width / 1.75,
              child: Text(
                style: textTheme.displaySmall,
                textAlign: TextAlign.center,
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  style: textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                  writer,
                ),
                Text(
                  style: textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                  view == "" ? "" : "$view بازدید ",
                ),
              ],
            )
          ],
        )
      ],
    ),
  );
}

Center loading(double size) {
  return Center(
    child: SpinKitCircle(
      color: FromColors.primaryColor,
      size: size,
    ),
  );
}

class SeeMoreDocs extends StatelessWidget {
  const SeeMoreDocs(
      {Key? key,
      required this.marginTag,
      required this.textTheme,
      required this.title})
      : super(key: key);

  final double marginTag;
  final TextTheme textTheme;
  final String title;

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
            title,
            style: textTheme.displayMedium,
          )
        ],
      ),
    );
  }
}
