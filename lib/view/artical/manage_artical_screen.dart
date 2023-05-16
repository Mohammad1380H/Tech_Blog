import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tech_bloc/component/my_component.dart';
import 'package:tech_bloc/component/my_strings.dart';
import 'package:tech_bloc/controller/manage_artical_controller.dart';
import 'package:tech_bloc/controller/register_controller.dart';
import 'package:tech_bloc/gen/assets.gen.dart';

// ignore: must_be_immutable
class ManageArticalScreen extends StatelessWidget {
  ManageArticalScreen({super.key});
  var registerController = Get.find<RegisterController>();
  var manageArticalController = Get.find<ManageArticalController>();
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
        child: Scaffold(
      appBar: specialAppBar(
        textTheme,
        action: Text(
          FromStrings.manageArticals,
          style: textTheme.displayMedium,
        ),
      ),
      body: Obx(
        () => manageArticalController.isLoading.value
            ? loading(50)
            : manageArticalController.articalList.isEmpty
                ? emptyState(textTheme, context)
                : ListView.builder(
                    itemCount: manageArticalController.articalList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          manageArticalController.updateModeEnabled.value =
                              true;

                          manageArticalController
                              .singleManageArticalModel.value.title = null;

                          manageArticalController.getPublishedByMeArticalWithId(
                              manageArticalController.articalList[index].id!);

                          Get.toNamed(
                              FromStrings.routSingleManageArticalScreen);
                        },
                        child: APListDelegate(index, textTheme,
                            image: manageArticalController
                                .articalList[index].image!,
                            writer: " ",
                            view: manageArticalController
                                .articalList[index].view!,
                            title: manageArticalController
                                .articalList[index].title!),
                      );
                    }),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
        child: ElevatedButton(
          style: Theme.of(context).elevatedButtonTheme.style,
          onPressed: () {
            manageArticalController.setDefaultText();
            
            Get.toNamed(FromStrings.routSingleManageArticalScreen);
          },
          child: const Text("بریم برای نوشتن یه مقاله‌ی باحال"),
        ),
      ),
    ));
  }

  Center emptyState(TextTheme textTheme, BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SvgPicture.asset(
          Assets.icons.techBotSad.path,
          height: 120,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: FromStrings.emptyManageArticalScreen,
                  style: textTheme.displaySmall)),
        ),
      ]),
    );
  }
}
