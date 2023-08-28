import 'dart:convert';

import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';

class MusicDetailController extends GetxController {
  MusicDetailController();

  // 获取 id
  final musicId = Get.arguments['id'];

  // 详情
  List<SongDetailModel> songDetail = [];

  // 歌词
  void onLyrics() {}

  // 分享
  void onShare() {}

  // 显示更多详情
  void onMoreDetail() {}

  // 读取缓存
  Future<void> _loadCache() async {
    var stringSongDetail = Storage().getString(Constants.storageMusicDetail);

    songDetail = stringSongDetail != " "
        ? jsonDecode(stringSongDetail).map<SongDetailModel>((item) {
            return SongDetailModel.fromJson(item);
          }).toList()
        : [];
  }

  // 初始化
  _initData() async {
    // 歌曲详情
    songDetail = await MusicApi.songDetail(musicId);

    // 离线存储
    Storage().setJson(Constants.storageMusicDetail, songDetail);

    update(["music_detail"]);
  }

  // @override
  // void onInit() {
  //   super.onInit();

  //   // 读取缓存
  //   _loadCache();
  // }

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
