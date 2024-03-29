// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tech_bloc/component/my_colors.dart';
import 'package:tech_bloc/component/my_component.dart';
import 'package:tech_bloc/component/my_strings.dart';
import 'package:tech_bloc/constants/dimens.dart';
import 'package:tech_bloc/controller/home_screen_controller.dart';
import 'package:tech_bloc/controller/register_controller.dart';
import 'package:tech_bloc/gen/assets.gen.dart';
import 'package:tech_bloc/view/mainScreen/home_page_screen.dart';
import 'package:tech_bloc/view/mainScreen/profile_page.dart';
import 'package:tech_bloc/view/register/register_intro.dart';

GlobalKey<ScaffoldState> _key = GlobalKey(debugLabel: '_homeScreenkey');

class MainPage extends StatelessWidget {
  TextEditingController id = TextEditingController();
  var homeScreenController = Get.find<HomeScreenController>();
  MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double listViewHeight = 170;

    Rx<int> selectedPageIndex = 0.obs;
    return Scaffold(
      key: _key,
      drawer: Drawer(
        backgroundColor: FromColors.scaffColor,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
                left: Dimens.marginTag, right: Dimens.marginTag),
            child: ListView(
              children: [
                DrawerHeader(
                    child: Image.asset(
                  Assets.images.appBarLogo.path,
                  scale: 1.5,
                )),
                ListTile(
                  title: Text(
                    "پروفایل کاربری",
                    style: textTheme.displaySmall,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  thickness: 1,
                  color: FromColors.dividerColor,
                ),
                ListTile(
                  title: Text(
                    "درباره تک‌بلاگ",
                    style: textTheme.displaySmall,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  thickness: 1,
                  color: FromColors.dividerColor,
                ),
                ListTile(
                  title: Text(
                    "اشتراک گذاری تک بلاگ",
                    style: textTheme.displaySmall,
                  ),
                  onTap: () async {
                    await Share.share(FromStrings.shareText);
                  },
                ),
                const Divider(
                  thickness: 1,
                  color: FromColors.dividerColor,
                ),
                ListTile(
                  title: Text(
                    "تک بلاگ در گیتهاب",
                    style: textTheme.displaySmall,
                  ),
                  onTap: () {
                    openUrl(FromStrings.techBlogGitHub);
                  },
                ),
                const Divider(
                  thickness: 1,
                  color: FromColors.dividerColor,
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: FromColors.scaffColor,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              Image(
                image: Assets.images.appBarLogo.provider(),
                height: size.height / 12,
              ),
              const Icon(
                Icons.search,
                size: 30,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: Stack(children: [
        Positioned.fill(
            child: Obx(() => homeScreenController.isLoading.value
                ? loading(50)
                : IndexedStack(
                    index: selectedPageIndex.value,
                    children: [
                      HomePage(
                          size: size,
                          textTheme: textTheme,
                          marginTag: Dimens.marginTag,
                          listViewHeight: listViewHeight),
                      ProfilePage(
                        listViewHeight: listViewHeight,
                        marginTag: Dimens.marginTag,
                        size: size,
                        textTheme: textTheme,
                      ),
                      RegisterIntro(),
                    ],
                  ))),
        Positioned(
          bottom: 0,
          right: 1,
          left: 1,
          child: BottonNav(
            size: size,
            onHomePageClicked: (int value) {
              selectedPageIndex.value = value;
            },
          ),
        ),
      ])),
    );
  }
}

class BottonNav extends StatelessWidget {
  const BottonNav({
    Key? key,
    required this.size,
    required this.onHomePageClicked,
  }) : super(key: key);

  final Size size;
  final Function(int) onHomePageClicked;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 9.5,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: FromGradiant.bottomNavBack,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 50, left: 50, bottom: 15),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(colors: FromGradiant.bottomNav),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () => onHomePageClicked(0),
                    icon: ImageIcon(
                      Assets.icons.home.provider(),
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.find<RegisterController>().toggleLogin();
                    },
                    icon: ImageIcon(
                      Assets.icons.writer.provider(),
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () => onHomePageClicked(1),
                    icon: ImageIcon(
                      Assets.icons.user.provider(),
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ])),
      ),
    );
  }
}
