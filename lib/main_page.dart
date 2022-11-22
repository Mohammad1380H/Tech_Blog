import 'package:flutter/material.dart';
import 'package:tech_bloc/gen/assets.gen.dart';
import 'package:tech_bloc/models/fake_data.dart';
import 'package:tech_bloc/my_colors.dart';

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  TextEditingController Id = TextEditingController();

  MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.menu, size: 30),
                Image(
                  image: Assets.images.appBarLogo.provider(),
                  height: size.height / 12,
                ),
                const Icon(Icons.search, size: 30),
              ],
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: size.width * 0.83,
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
                          image: fake_data["imageAsset"].provider(),
                          fit: BoxFit.cover)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 130, 0, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          fake_data["writer"] + " - " + fake_data["date"],
                          style: textTheme.subtitle1,
                        ),
                        Row(
                          children: [
                            Text(
                              fake_data["view"],
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
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "دوازده قدم برنامه نویسی یک دوره ی سـ ...",
                        style: textTheme.headline1,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: SizedBox(
              height: size.height * 0.05,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics() ,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: FromGradiant.tags,
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft
                              ),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Text(
                            "  # برنامه نویسی  ",
                            style: textTheme.headline1,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}
