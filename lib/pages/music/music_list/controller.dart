import 'dart:convert';

import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';
import 'package:nestease_cloud_music/pages/index.dart';

class MusicListController extends GetxController {
  MusicListController();

  // 获取歌单信息
  final songList = Get.arguments['songList'];
  // appbar title
  final title = Get.arguments['appbar_title'];

  // music list
  List<SongListMusicModel> musicList = [];

  // 下载全部
  void onSearch() {}

  // 分享
  void onShare() {}

  // 显示更多详情
  void onMoreDetail() {}

  // 播放全部
  void onPlayAll() {}

  // 收藏
  void onStar() {}

  // 歌曲点击
  void onMusicItemTap(int index) {
    Get.to(
      () => const MusicDetailPage(),
      transition: Transition.downToUp,
      arguments: {
        'id': musicList[index].id,
      },
    );
  }

  // download
  void onDownload() {}

  // show more
  void onShowMore() {}

  // like
  void onLike() {}

  // 读取缓存
  Future<void> _loadCache() async {
    var stringMusicList = Storage().getString(Constants.storageMusicList);

    musicList = stringMusicList != " "
        ? jsonDecode(stringMusicList).map<SongListMusicModel>((item) {
            return SongListMusicModel.fromJson(item);
          }).toList()
        : [];
  }

  // 初始化
  _initData() async {
    // 获取音乐列表
    musicList = await MusicApi.songListMusic(
      SongListRequest(id: songList.id),
    );

    // 离线存储
    Storage().setJson(Constants.storageMusicList, musicList);

    update(["music_list"]);
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
