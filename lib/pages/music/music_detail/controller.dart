import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';
import 'package:nestease_cloud_music/pages/index.dart';
import 'package:nestease_cloud_music/pages/music/music_detail/widgets/index.dart';

class MusicDetailController extends GetxController {
  MusicDetailController();

  final PlaybarController _playbarController = Get.find();

  // 获取 id
  late final musicId = Get.arguments['id'];

  // 详情
  List<SongDetailModel> songDetail = [];

  // music url
  List<MusicUrlModel> musicUrls = [];

  // music list
  List<SongListMusicModel> musicList = [];

  // 歌词
  void onLyrics() {}

  // 分享
  void onShare() {}

  // 显示更多详情
  void onMoreDetail() {}

  // 进度条改变
  void onProgressChanged(double value) {
    int durationInSeconds =
        (AudioPlayerService.to.duration.value.inSeconds * value).round();
    AudioPlayerService.to.jumpToPosition(durationInSeconds);
  }

  // 改变播放模式
  void onChangePlayMode() {
    if (AudioPlayerService.to.isLoop.value == true) {
      AudioPlayerService.to.setReleasePlayMode();
    } else {
      AudioPlayerService.to.setLoopPlayMode();
    }
  }

  // 上一首
  void onPlayPrevious() {
    int index = AudioPlayerService.to.currentIndex.value;
    if (index > 0) {
      AudioPlayerService.to.setCurrentIndex(index - 1);
      initMusicPlayer(
        id: musicList[AudioPlayerService.to.currentIndex.value].id!,
        isPreviousOrNext: true,
      ).whenComplete(() => update(['music_detail']));
    }
  }

  // 播放改变
  void onPlayChange() {
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

  // 下一首
  void onPlayNext() {
    int index = AudioPlayerService.to.currentIndex.value;
    if (index < musicList.length - 1) {
      AudioPlayerService.to.setCurrentIndex(index + 1);
      initMusicPlayer(
        id: musicList[AudioPlayerService.to.currentIndex.value].id!,
        isPreviousOrNext: true,
      ).whenComplete(() => update(['music_detail']));
    }
  }

  // 播放列表
  void onMenuTap() {
    Get.bottomSheet(
      <Widget>[
        const TextWidget.title3('播放列表').paddingBottom(AppSpace.listRow),
        <Widget>[
          for (int i = 0; i < musicList.length; i++)
            MusicItemWidget(
              image: musicList[i].al!.picUrl!,
              name: musicList[i].name!,
              artists: musicList[i].ar!.map((e) => e.name!).toList(),
              onRemove: () {},
              onTap: () {},
            ),
        ].toListView().expanded(),
      ]
          .toColumn()
          .paddingVertical(
            AppSpace.page,
          )
          .paddingHorizontal(
            AppSpace.page,
          ),
      backgroundColor: AppColors.background,
    );
  }

  // 喜欢
  void onLike() {}

  // 下载
  void onDownload() {}

  // 初始 current index
  void onSetCurrentIndex() {
    for (int i = 0; i < musicList.length; i++) {
      if (musicList[i].id == musicId) {
        AudioPlayerService.to.setCurrentIndex(i);
      }
    }
  }

  // 读取缓存
  Future<void> _loadCache() async {
    var stringSongDetail = Storage().getString(Constants.storageMusicDetail);

    var stringMusicUrl = Storage().getString(Constants.storageMusicUrl);

    var stringMusicList = Storage().getString(Constants.storageMusicList);

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

    musicList = stringMusicList != " "
        ? jsonDecode(stringMusicList).map<SongListMusicModel>((item) {
            return SongListMusicModel.fromJson(item);
          }).toList()
        : [];
  }

  // 播放歌曲
  Future<void> initMusicPlayer(
      {required int id, required bool isPreviousOrNext}) async {
    // 获取上一个页面的路由名称
    final previousRoute = Get.routing.previous;

    // 歌曲详情
    songDetail = await MusicApi.songDetail(id);
    AudioPlayerService.to.songDetail = songDetail;

    // 音乐 url
    var musicUrl = await MusicApi.musicUrl(id);
    musicUrls = musicUrl;
    AudioPlayerService.to.musicUrl = musicUrl;
    AudioPlayerService.to.init();

    if (previousRoute == RouteNames.musicMusicList ||
        isPreviousOrNext == true) {
      AudioPlayerService.to.playMusic(musicUrls[0].url!);
    } else {
      if (AudioPlayerService.to.isPlaying.value == true) {
        AudioPlayerService.to.continueMusic();
      } else {
        AudioPlayerService.to.pauseMusic();
      }
    }

    // 离线存储
    Storage().setJson(Constants.storageMusicDetail, songDetail);

    Storage().setJson(Constants.storageMusicUrl, musicUrls);

    _playbarController.initData();
  }

  // 初始化
  _initData() async {
    await initMusicPlayer(id: musicId, isPreviousOrNext: false);

    // 初始 current index
    onSetCurrentIndex();

    update(["music_detail"]);
  }

  @override
  void onInit() {
    super.onInit();

    // 读取缓存
    _loadCache();
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
