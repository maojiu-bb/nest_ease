import 'dart:convert';

import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';
import 'package:nestease_cloud_music/pages/index.dart';

class PlaybarController extends GetxController {
  PlaybarController();

  // 详情
  List<SongDetailModel> songDetail = [];

  // music url
  List<MusicUrlModel> musicUrls = [];

  // 更改播放
  void onPlayChanged() {
    if (AudioPlayerService.to.isPlaying.value == true) {
      AudioPlayerService.to.pauseMusic();
    } else {
      if (AudioPlayerService.to.duration.value == Duration.zero) {
        AudioPlayerService.to.playMusic(musicUrls[0].url!);
      } else {
        AudioPlayerService.to.continueMusic();
      }
    }
  }

  // 前往详情
  void onDetailTap() {
    Get.to(
      () => const MusicDetailPage(),
      transition: Transition.downToUp,
      arguments: {
        'id': AudioPlayerService.to.songDetail.isNotEmpty
            ? AudioPlayerService.to.songDetail[0].id
            : songDetail[0].id,
      },
    );
  }

  // 获取缓存
  Future<void> _loadCache() async {
    var stringSongDetail = Storage().getString(Constants.storageMusicDetail);

    var stringMusicUrl = Storage().getString(Constants.storageMusicUrl);

    songDetail = stringSongDetail != " "
        ? jsonDecode(stringSongDetail).map<SongDetailModel>((item) {
            return SongDetailModel.fromJson(item);
          }).toList()
        : [];

    musicUrls = stringMusicUrl != " "
        ? jsonDecode(stringMusicUrl).map<MusicUrlModel>((item) {
            return MusicUrlModel.fromJson(item);
          }).toList()
        : [];
  }

  initData() {
    update(["playbar"]);
  }

  @override
  void onInit() {
    super.onInit();
    _loadCache();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
