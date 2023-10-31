import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_bloc/component/my_component.dart';
import 'package:tech_bloc/constants/dimens.dart';
import 'package:tech_bloc/controller/podcast_controller.dart';
import 'package:tech_bloc/controller/single_podcast_controller.dart';
import 'package:tech_bloc/models/podcast_model.dart';

import '../../component/decorations.dart';
import '../../component/my_colors.dart';
import '../../gen/assets.gen.dart';

// ignore: must_be_immutable
class SinglePodcastScreen extends StatelessWidget {
  late SinglePodcastController singlePodcastController;
  var podcastController = Get.find<PodcastController>();
  PodcastModel podcastModel = Get.arguments;

  SinglePodcastScreen({super.key}) {
    singlePodcastController =
        Get.put(SinglePodcastController(id: podcastModel.id!));
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
          body: Obx(
        () => Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(children: [
                      SizedBox(
                        height: Get.height / 2.9,
                        child: CachedNetworkImage(
                          imageUrl: podcastModel.poster!,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30)),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover)),
                          ),
                          placeholder: (context, url) => const SpinKitDualRing(
                            color: FromColors.primaryColor,
                            size: 20,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.image_not_supported_outlined),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: FromGradiant.singleAppBar,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                        ),
                        height: 60,
                        child: Row(children: [
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          const Expanded(child: SizedBox()),
                          IconButton(
                            color: Colors.white,
                            icon: const Icon(Icons.share),
                            onPressed: () async {},
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ]),
                      )
                    ]),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 20, right: Dimens.marginTag),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              podcastModel.title!,
                              style: textTheme.displaySmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Image(
                                image: Assets.images.profile.provider(),
                                width: 55,
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(podcastModel.publisher!,
                                  style: textTheme.displaySmall),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          singlePodcastController.isLoading.value == true
                              ? loading(50)
                              : ListView.builder(
                                  itemCount: singlePodcastController
                                      .podcastFilelist.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        singlePodcastController
                                            .currentFileIndex.value = index;

                                        singlePodcastController.player
                                            .seek(Duration.zero, index: index);

                                        singlePodcastController.timerCheck();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 0, 0, 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Row(
                                                children: [
                                                  ImageIcon(
                                                    Assets.icons.podIcon
                                                        .provider(),
                                                    color: FromColors
                                                        .linkedTextColor,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Flexible(
                                                    child: Obx(
                                                      () => Text(
                                                        singlePodcastController
                                                            .podcastFilelist[
                                                                index]
                                                            .title!,
                                                        style: singlePodcastController
                                                                    .currentFileIndex
                                                                    .value ==
                                                                index
                                                            ? textTheme
                                                                .displayMedium
                                                            : textTheme
                                                                .titleSmall,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        textAlign:
                                                            TextAlign.start,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              singlePodcastController
                                                  .podcastFilelist[index]
                                                  .length!,
                                              style: textTheme.titleSmall,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              textAlign: TextAlign.start,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: Dimens.marginTag,
              right: Dimens.marginTag,
              child: Container(
                decoration: MyDecorations.mainDecoration,
                height: Dimens.height / 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProgressBar(
                        progressBarColor: Colors.orange,
                        baseBarColor: Colors.white,
                        thumbColor: Colors.orange,
                        timeLabelTextStyle: Get.textTheme.titleMedium,
                        progress: singlePodcastController.progressValue.value,
                        buffered: singlePodcastController.bufferedValue.value,
                        total: singlePodcastController.player.duration ??
                            const Duration(seconds: 0),
                        onSeek: (position) {
                          singlePodcastController.player.seek(position);

                          singlePodcastController.isPlayed.value
                              ? singlePodcastController.startProgress()
                              : singlePodcastController.timer!.cancel();
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await singlePodcastController.player.seekToNext();
                            singlePodcastController.currentFileIndex.value =
                                singlePodcastController.player.currentIndex!;
                            singlePodcastController.timerCheck();
                          },
                          child: const Icon(
                            Icons.skip_next,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            singlePodcastController.player.playing
                                ? singlePodcastController.timer!.cancel()
                                : singlePodcastController.startProgress();

                            singlePodcastController.isPlayed.value
                                ? singlePodcastController.player.pause()
                                : singlePodcastController.player.play();

                            singlePodcastController.isPlayed.value =
                                singlePodcastController.player.playing;
                          },
                          child: Icon(
                            singlePodcastController.isPlayed.value
                                ? Icons.pause_circle
                                : Icons.play_circle,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await singlePodcastController.player
                                .seekToPrevious();
                            singlePodcastController.currentFileIndex.value =
                                singlePodcastController.player.currentIndex!;
                            singlePodcastController.timerCheck();
                          },
                          child: const Icon(
                            Icons.skip_previous,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            singlePodcastController.setLoopAll();
                          },
                          child: Icon(
                            Icons.replay,
                            color: singlePodcastController.isLoopAll.value
                                ? Colors.blue
                                : Colors.white,
                            size: 40,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
