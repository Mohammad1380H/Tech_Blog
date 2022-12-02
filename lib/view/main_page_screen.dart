import 'package:flutter/material.dart';
import 'package:tech_bloc/gen/assets.gen.dart';

import 'package:tech_bloc/my_colors.dart';
import 'package:tech_bloc/view/home_page_screen.dart';
import 'package:tech_bloc/view/profile_page.dart';
import 'package:tech_bloc/view/register_intro.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController id = TextEditingController();
  int selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double listViewHeight = 170;
    double marginTag = size.width / 12;


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: FromColors.scaffColor,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.menu,
                size: 30,
                color: Colors.black,
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
            child: IndexedStack(
          index: selectedPageIndex,
          children: [
            HomePage(
                size: size,
                textTheme: textTheme,
                marginTag: marginTag,
                listViewHeight: listViewHeight),
            ProfilePage(
                size: size,
                textTheme: textTheme,
                marginTag: marginTag,
                listViewHeight: listViewHeight),
                const RegisterIntro()
          ],
        )),
        Positioned(
          bottom: 0,
          right: 1,
          left: 1,
          child: BottonNav(
            size: size,
            onHomePageClicked: (int value) {
              setState(() {
                selectedPageIndex = value;
              });
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
                    onPressed: () =>onHomePageClicked(2),
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
