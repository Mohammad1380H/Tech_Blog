import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tech_bloc/models/podcast_file_model.dart';
import '../constants/api_constant.dart';
import '../services/dio_services.dart';

class SinglePodcastController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<PodcastFileModel> podcastFilelist = RxList();
  final player = AudioPlayer();
  late ConcatenatingAudioSource playList;
  String id;
  RxInt currentFileIndex = 0.obs;
  RxBool isPlayed = false.obs;
  RxBool isLoopAll = false.obs;

  Rx<Duration> progressValue = const Duration(seconds: 0).obs;
  Rx<Duration> bufferedValue = const Duration(seconds: 0).obs;
  Timer? timer;
  startProgress() {
    const tick = Duration(seconds: 1);
    int duration = player.duration!.inSeconds - player.position.inSeconds;

    if (timer != null) {
      if (timer!.isActive) {
        timer!.cancel();
        timer = null;
      }
    }
    timer = Timer.periodic(tick, (timer) {
      duration--;
      progressValue.value = player.position;
      bufferedValue.value = player.bufferedPosition;
      if (duration < 0) {
        log('message');
        timer.cancel();
        progressValue.value = const Duration(seconds: 0);
        bufferedValue.value = const Duration(seconds: 0);
      }
    });
  }

  @override
  onInit() async {
    debugPrint("اتصال سینگل پادکست");
    super.onInit();
    getPodcastFiles();
    playList = ConcatenatingAudioSource(useLazyPreparation: true, children: []);
    await player.setAudioSource(playList,
        initialIndex: 0, initialPosition: Duration.zero);
  }

  SinglePodcastController({required this.id});

  getPodcastFiles() async {
    debugPrint(ApiConstant.getPodcastFiles + id);
    isLoading.value = true;
    podcastFilelist.clear();
    var response =
        await DioServices().getMethod(ApiConstant.getPodcastFiles + id);

    if (response.statusCode == 200) {
      for (var element in response.data['files']) {
        podcastFilelist.add(PodcastFileModel.fromJson(element));
        playList.add(AudioSource.uri(
            Uri.parse(PodcastFileModel.fromJson(element).file!)));
      }
    }
    isLoading.value = false;
  }

  setLoopAll() {
    if (isLoopAll.value) {
      isLoopAll.value = false;
      player.setLoopMode(LoopMode.off);
    } else {
      isLoopAll.value = true;
      player.setLoopMode(LoopMode.all);
    }
  }

  timerCheck() {
    if (player.playing) {
      startProgress();
    }
  }
}
