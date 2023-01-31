import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tech_bloc/gen/assets.gen.dart';
import 'package:tech_bloc/models/data_model.dart';

import 'package:tech_bloc/component/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

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
      required this.index,
      required this.tagList})
      : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final int index;
  final List<HashTag> tagList;
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
              tagList[index].title,
              style: textTheme.headline1,
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
