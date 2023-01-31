import 'package:flutter/material.dart';
import 'package:tech_bloc/component/my_colors.dart';
import 'package:tech_bloc/component/my_component.dart';
import 'package:tech_bloc/component/my_strings.dart';
import '../gen/assets.gen.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({
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
  double marginDivider = 0;
  @override
  Widget build(BuildContext context) {
    marginDivider = size.width / 6;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top:3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, size.height / 12, 0, 0),
              child: Image(
                  fit: BoxFit.cover,
                  height: size.height / 7,
                  image: Assets.images.profile.provider()),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  Assets.icons.penLogo.provider(),
                  color: FromColors.linkedTextColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  FromStrings.editProfileName,
                  style: textTheme.headline2,
                ),
              ],
            ),
            SizedBox(
              height: size.height / 14,
            ),
            Text(
              "فاطمه امیری",
              style: textTheme.headline3,
            ),
            const SizedBox(
              height: 10,
            ),
            Text("fatemeamiri@gmail.com", style: textTheme.headline3),
            SizedBox(
              height: size.height / 19,
            ),
            TechDivider(
              width: marginDivider,
            ),
            SizedBox(
              height: size.height / 20,
              child: Padding(
                padding: EdgeInsets.fromLTRB(marginDivider, 0, marginDivider, 0),
                child: InkWell(
                  splashColor: FromColors.primaryColor,
                  onTap: () {},
                  child: Center(
                    child: Text(
                      FromStrings.favDocs,
                      style: textTheme.headline3,
                    ),
                  ),
                ),
              ),
            ),
            TechDivider(
              width: marginDivider,
            ),
            SizedBox(
              height: size.height / 20,
              child: Padding(
                padding: EdgeInsets.fromLTRB(marginDivider, 0, marginDivider, 0),
                child: InkWell(
                  splashColor: FromColors.primaryColor,
                  onTap: () {},
                  child: Center(
                    child: Text(
                      FromStrings.favPods,
                      style: textTheme.headline3,
                    ),
                  ),
                ),
              ),
            ),
            TechDivider(
              width: marginDivider,
            ),
            SizedBox(
              height: size.height / 20,
              child: Padding(
                padding: EdgeInsets.fromLTRB(marginDivider, 0, marginDivider, 0),
                child: InkWell(
                  splashColor: FromColors.primaryColor,
                  onTap: () {},
                  child: Center(
                    child: Text(
                      FromStrings.logout,
                      style: textTheme.headline3,
                    ),
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
