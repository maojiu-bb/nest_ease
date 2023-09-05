import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';
import 'package:nestease_cloud_music/pages/index.dart';

class MusicDetailController extends GetxController {
  MusicDetailController();

  final PlaybarController _playbarController = Get.find();

  // 滚动控制器
  final ScrollController scrollController = ScrollController();

  // 获取 id
  late final musicId = Get.arguments['id'];

  // 详情
  List<SongDetailModel> songDetail = [];

  // music url
  List<MusicUrlModel> musicUrls = [];

  // music list
  List<SongListMusicModel> musicList = [];

  // 歌词
  LyricModel musicLyric = LyricModel();

  // 是否显示歌词
  bool isShowLyrics = false;

  // 歌词
  void onLyrics() {
    isShowLyrics = !isShowLyrics;
    update(['music_detail']);
  }

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
  Future<void> onPlayPrevious() async {
    int index = AudioPlayerService.to.currentIndex.value;
    if (index > 0) {
      AudioPlayerService.to.setCurrentIndex(index - 1);
      await initMusicPlayer(
        id: musicList[AudioPlayerService.to.currentIndex.value].id!,
        isPreviousOrNext: true,
      );
      update(['music_detail']);
    } else {
      AudioPlayerService.to.setCurrentIndex(musicList.length - 1);
      await initMusicPlayer(
        id: musicList[AudioPlayerService.to.currentIndex.value].id!,
        isPreviousOrNext: true,
      );
      update(['music_detail']);
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
  Future<void> onPlayNext() async {
    int index = AudioPlayerService.to.currentIndex.value;
    if (index < musicList.length - 1) {
      AudioPlayerService.to.setCurrentIndex(index + 1);
      await initMusicPlayer(
        id: musicList[AudioPlayerService.to.currentIndex.value].id!,
        isPreviousOrNext: true,
      );
      update(['music_detail']);
    } else {
      AudioPlayerService.to.setCurrentIndex(0);
      await initMusicPlayer(
        id: musicList[AudioPlayerService.to.currentIndex.value].id!,
        isPreviousOrNext: true,
      );
      update(['music_detail']);
    }
  }

  // 播放列表点击
  Future<void> onMenuMusicTap(int index) async {
    AudioPlayerService.to.setCurrentIndex(index);
    await initMusicPlayer(
      id: musicList[AudioPlayerService.to.currentIndex.value].id!,
      isPreviousOrNext: true,
    );
    update(['music_detail', 'menu_list']);
  }

  // 喜欢
  void onLike() {}

  // 下载
  void onDownload() {}

  // 调用该方法来滚动到当前播放的歌词
  void scrollToCurrentLyric(int currentIndex, double itemHeight) {
    scrollController.animateTo(
      currentIndex * itemHeight,
      duration: const Duration(milliseconds: 300), // 平滑滚动的持续时间
      curve: Curves.easeInOut, // 可根据需求选择滚动曲线
    );
  }

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

    var stringMusicLyric = Storage().getString(Constants.storageMusicLyric);

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

    musicLyric = stringMusicLyric != " "
        ? LyricModel.fromJson(jsonDecode(stringMusicLyric))
        : LyricModel();
  }

  // 播放歌曲
  Future<void> initMusicPlayer(
      {required int id, required bool isPreviousOrNext}) async {
    // 获取上一个页面的路由名称
    final previousRoute = Get.routing.previous;

    // 歌曲详情
    songDetail = await MusicApi.songDetail(id);
    AudioPlayerService.to.songDetail = songDetail;

    // 获取歌词
    musicLyric = await MusicApi.lyric(id);

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

    Storage().setJson(Constants.storageMusicLyric, musicLyric);

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

    AudioPlayerService.to.audioPlayer.onPlayerComplete.listen((event) {
      if (AudioPlayerService.to.isLoop.value == false) {
        onPlayNext();
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    super.onClose();

    // 控制器释放
    scrollController.dispose();
  }
}
