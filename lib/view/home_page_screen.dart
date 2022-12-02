import 'package:flutter/material.dart';
import '../gen/assets.gen.dart';
import '../models/data_model.dart';
import '../models/fake_data.dart';
import '../my_strings.dart';
import '../my_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HomePagePoster(size: size, textTheme: textTheme),
          HomePageTags(marginTag: marginTag, size: size, textTheme: textTheme),
          SeeMoreDocs(marginTag: marginTag, textTheme: textTheme),
          DocsList(
              listViewHeight: listViewHeight,
              marginTag: marginTag,
              textTheme: textTheme),
          SeeMorePods(marginTag: marginTag, textTheme: textTheme),
          PodsList(
              listViewHeight: listViewHeight,
              marginTag: marginTag,
              textTheme: textTheme),
          const SizedBox(
            height: 110,
          )
        ],
      ),
    );
  }
}

///////////////classes and widgets in this lib////////////////////

class PodsList extends StatelessWidget {
  const PodsList({
    Key? key,
    required this.listViewHeight,
    required this.marginTag,
    required this.textTheme,
  }) : super(key: key);

  final double listViewHeight;
  final double marginTag;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
      child: SizedBox(
        height: listViewHeight * 1.15,
        child: ListView.builder(
          itemCount: blogList.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return DelegatesPod(
              marginTag: marginTag,
              index: index,
              podList: blogList,
              textTheme: textTheme,
              listViewHeight: listViewHeight,
            );
          },
        ),
      ),
    );
  }
}

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

class DocsList extends StatelessWidget {
  const DocsList({
    Key? key,
    required this.listViewHeight,
    required this.marginTag,
    required this.textTheme,
  }) : super(key: key);

  final double listViewHeight;
  final double marginTag;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
      child: SizedBox(
        height: listViewHeight * 1.15,
        child: ListView.builder(
          itemCount: blogList.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return DelegateArts(
              marginTag: marginTag,
              index: index,
              blogList: blogList,
              textTheme: textTheme,
              listViewHeight: listViewHeight,
            );
          },
        ),
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
              child: Container(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: FromGradiant.tags,
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft),
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
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
                        tagLists[index].title,
                        style: textTheme.headline1,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //poster
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
                    image: fakeData["imageAsset"].provider(),
                    fit: BoxFit.cover)),
          ),
        ),
        // poster info text
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 130, 0, 0),
          child: Column(
            children: [
              //view and writer and date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    fakeData["writer"] + " - " + fakeData["date"],
                    style: textTheme.subtitle1,
                  ),
                  //view
                  Row(
                    children: [
                      Text(
                        fakeData["view"],
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
              //
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  fakeData["title"],
                  style: textTheme.headline1,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

//////////////delegates //////////////////
class DelegateArts extends StatelessWidget {
  const DelegateArts({
    Key? key,
    required this.marginTag,
    required this.index,
    required this.blogList,
    required this.textTheme,
    required this.listViewHeight,
  }) : super(key: key);

  final double marginTag;
  final int index;
  final List<BlogsModel> blogList;
  final TextTheme textTheme;
  final double listViewHeight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, index == 0 ? marginTag : 0, 0),
      child: Column(
        children: [
          Stack(children: [
            Container(
              width: listViewHeight - listViewHeight / 7,
              height: listViewHeight - listViewHeight / 7,
              foregroundDecoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: FromGradiant.listArt,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(15)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: blogList[index].urlImage.provider())),
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
                        blogList[index].writer,
                        style: textTheme.subtitle1,
                      ),
                    ),
                    //view
                    Text(
                      blogList[index].view,
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
                  blogList[index].title,
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

class DelegatesPod extends StatelessWidget {
  const DelegatesPod({
    Key? key,
    required this.marginTag,
    required this.index,
    required this.podList,
    required this.textTheme,
    required this.listViewHeight,
  }) : super(key: key);

  final double marginTag;
  final int index;
  final List<BlogsModel> podList;
  final TextTheme textTheme;
  final double listViewHeight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, index == 0 ? marginTag : 0, 0),
      child: Column(
        children: [
          Container(
            width: listViewHeight - listViewHeight / 7,
            height: listViewHeight - listViewHeight / 7,
            foregroundDecoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: FromGradiant.listArt,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(15)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: blogList[index].urlImage.provider())),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SizedBox(
                width: listViewHeight / 1.15,
                child: Text(
                  textAlign: TextAlign.center,
                  blogList[index].title,
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
