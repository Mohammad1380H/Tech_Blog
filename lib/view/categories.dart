import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tech_bloc/component/my_colors.dart';
import 'package:tech_bloc/component/my_component.dart';
import 'package:tech_bloc/component/my_strings.dart';
import 'package:tech_bloc/controller/home_screen_controller.dart';
import 'package:tech_bloc/gen/assets.gen.dart';
import 'package:tech_bloc/models/fake_data.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

HomeScreenController homeScreenController = Get.put(HomeScreenController());

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double marginTag = size.width / 12;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SvgPicture.asset(
                Assets.icons.techBot.path,
                height: 130,
              ),
              //text
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 40),
                child: Text(
                  FromStrings.registerDone,
                  style: textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
              ),
              //name
              Padding(
                padding: EdgeInsets.only(right: marginTag, left: marginTag),
                child: TextField(
                  style: const TextStyle(color: FromColors.articalPreviewTitle),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      hintText: "نام و نام خانوادگی",
                      hintStyle: textTheme.headlineMedium),
                ),
              ),
              //chooseCates
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: Text(
                  FromStrings.chooseCates,
                  style: textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
              ),
              //grid view
              SizedBox(
                height: 100,
                width: double.maxFinite,
                child: GridView.builder(
                  padding: EdgeInsets.only(right: marginTag / 2),
                  scrollDirection: Axis.horizontal,
                  itemCount: homeScreenController.tagList.length,
                  shrinkWrap: true,
                  //physics: ClampingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: 0.3,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (!choosenTagLists
                              .contains(homeScreenController.tagList[index])) {
                            choosenTagLists
                                .add(homeScreenController.tagList[index]);
                          }
                          //print(choosenTagLists.length);
                        });
                      },
                      child: TagsWidget(
                        size: size,
                        textTheme: textTheme,
                        title: homeScreenController.tagList[index].title!,
                      ),
                    );
                  },
                ),
              ),
              //arrow
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: SvgPicture.asset(
                  Assets.icons.arrowDown.path,
                  width: 60,
                ),
              ),
              ChoosenTags(
                size: size,
                textTheme: textTheme,
                marginTag: marginTag / 2,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("ادامه")),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ChoosenTags extends StatefulWidget {
  ChoosenTags({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.marginTag,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  double marginTag;

  @override
  State<ChoosenTags> createState() => _ChoosenTagsState();
}

class _ChoosenTagsState extends State<ChoosenTags> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.maxFinite,
      child: GridView.builder(
        padding: EdgeInsets.only(right: widget.marginTag),
        scrollDirection: Axis.horizontal,
        itemCount: choosenTagLists.length,
        shrinkWrap: true,
        //physics: ClampingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 0.3,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                choosenTagLists.removeAt(index);
              });
            },
            child: TagsWidget(
              size: widget.size,
              textTheme: widget.textTheme,
              title: homeScreenController.tagList[index].title!,
            ),
          );
        },
      ),
    );
  }
}
