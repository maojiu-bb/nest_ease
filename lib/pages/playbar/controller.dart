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

  // music list
  List<SongListMusicModel> musicList = [];

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

  // 上一首
  Future<void> onPlayPrevious() async {
    int index = AudioPlayerService.to.currentIndex.value;
    if (index > 0) {
      AudioPlayerService.to.setCurrentIndex(index - 1);
      await initMusicPlayer(
        id: musicList[AudioPlayerService.to.currentIndex.value].id!,
      );
      update(['playbar']);
    } else {
      AudioPlayerService.to.setCurrentIndex(musicList.length - 1);
      await initMusicPlayer(
        id: musicList[AudioPlayerService.to.currentIndex.value].id!,
      );
      update(['playbar']);
    }
  }

  // 下一首
  Future<void> onPlayNext() async {
    int index = AudioPlayerService.to.currentIndex.value;
    if (index < musicList.length - 1) {
      AudioPlayerService.to.setCurrentIndex(index + 1);
      await initMusicPlayer(
        id: musicList[AudioPlayerService.to.currentIndex.value].id!,
      );
      update(['playbar']);
    } else {
      AudioPlayerService.to.setCurrentIndex(0);
      await initMusicPlayer(
        id: musicList[AudioPlayerService.to.currentIndex.value].id!,
      );
      update(['playbar']);
    }
  }

  // 播放歌曲
  Future<void> initMusicPlayer({required int id}) async {
    // 歌曲详情
    songDetail = await MusicApi.songDetail(id);
    AudioPlayerService.to.songDetail = songDetail;

    // 音乐 url
    var musicUrl = await MusicApi.musicUrl(id);
    musicUrls = musicUrl;
    AudioPlayerService.to.musicUrl = musicUrl;
    AudioPlayerService.to.init();

    AudioPlayerService.to.playMusic(musicUrls[0].url!);
    // 离线存储
    Storage().setJson(Constants.storageMusicDetail, songDetail);

    Storage().setJson(Constants.storageMusicUrl, musicUrls);
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

    songDetail = stringSongDetail.isNotEmpty
        ? jsonDecode(stringSongDetail).map<SongDetailModel>((item) {
            return SongDetailModel.fromJson(item);
          }).toList()
        : [];

    musicUrls = stringMusicUrl.isNotEmpty
        ? jsonDecode(stringMusicUrl).map<MusicUrlModel>((item) {
            return MusicUrlModel.fromJson(item);
          }).toList()
        : [];
  }

  initData() {
    musicList = AudioPlayerService.to.musicList;

    update(["playbar"]);
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    // 加载缓存
    await _loadCache();
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
