import 'dart:convert';

import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';

class HomeController extends GetxController {
  HomeController();

  // 轮播图
  List<KeyValueModel> swiperItems = [];

  // 轮播图当前位置
  int swiperCurrentIndex = 0;

  // category item 数据
  List<CategoryModel> categoryItems = [
    CategoryModel(
      id: 1,
      name: '每日推荐',
      image: AssetsSvgs.gedanSvg,
    ),
    CategoryModel(
      id: 2,
      name: '热歌榜',
      image: AssetsSvgs.gequSvg,
    ),
    CategoryModel(
      id: 3,
      name: '歌手',
      image: AssetsSvgs.geshouSvg,
    ),
    CategoryModel(
      id: 4,
      name: '排行',
      image: AssetsSvgs.paihangbangSvg,
    ),
  ];

  // 推荐歌单
  List<SongListModel> recommendSongs = [];

  // 推荐歌曲
  List<SongsModel> recommendNewSongs = [];

  // 推荐电台
  List<DjProgramModel> recommendDjPrograms = [];

  // 推荐 mv
  List<RecommendMvModel> recommendMvs = [];

  // appbar 点击
  void onAppBarTap() {
    Get.toNamed(RouteNames.searchSearchIndex);
  }

  // 轮播图切换
  void onChangeBanner(int index, /*CarouselPageChangedReason*/ reason) {
    swiperCurrentIndex = index;
    update(["home_swiper"]);
  }

  // 分类点击事件
  void onCategoryTap(int categoryId) {}

  // 推荐歌单 all
  void onRecommendSongListTapAll() {}

  // 推荐歌单点击事件
  void onRecommendSongListTap(int index) {
    Get.toNamed(
      RouteNames.musicMusicList,
      arguments: {
        'songList': recommendSongs[index],
      },
    );
  }

  // 推荐歌单播放
  void onRecommendSongListPlay() {}

  // 推荐歌曲 all
  void onRecommendNewSongsTapAll() {}

  // 推荐歌曲刷新
  void onRecommendNewSongsRefresh() {}

  // 推荐歌曲点击事件
  void onRecommendNewSongsTap() {}

  // 推荐电台 all
  void onRecommendDjProgramTapAll() {}

  // 推荐电台点击事件
  void onRecommendDjProgramTap() {}

  // 推荐电台刷新
  void onRecommendDjProgramRefresh() {}

  // 推荐mv all
  void onRecommendMvTapAll() {}

  // 推荐mv点击事件
  void onRecommendMvTap() {}

  // 推荐 mv 刷新
  void onRecommendMvRefresh() {}

  // 推荐 mv 播放
  void onRecommendMvPlay() {}

  // 读取缓存
  Future<void> _loadCache() async {
    var stringSwiper = Storage().getString(Constants.storageBanner);

    var stringRecommendSongList =
        Storage().getString(Constants.storageRecommendSongList);

    var stringRecommendNewSongs =
        Storage().getString(Constants.storageRecommendSong);

    var stringRecommendDjPrograms =
        Storage().getString(Constants.storageRecommendDjProgram);

    var stringRecommendMvs = Storage().getString(Constants.storageRecommendMv);

    swiperItems = stringSwiper.isNotEmpty
        ? jsonDecode(stringSwiper).map<KeyValueModel>((item) {
            return KeyValueModel.fromJson(item);
          }).toList()
        : [];

    recommendSongs = stringRecommendSongList.isNotEmpty
        ? jsonDecode(stringRecommendSongList).map<SongListModel>((item) {
            return SongListModel.fromJson(item);
          }).toList()
        : [];

    recommendNewSongs = stringRecommendNewSongs.isNotEmpty
        ? jsonDecode(stringRecommendNewSongs).map<SongsModel>((item) {
            return SongsModel.fromJson(item);
          }).toList()
        : [];

    recommendDjPrograms = stringRecommendDjPrograms.isNotEmpty
        ? jsonDecode(stringRecommendDjPrograms).map<DjProgramModel>((item) {
            return DjProgramModel.fromJson(item);
          }).toList()
        : [];

    recommendMvs = stringRecommendMvs.isNotEmpty
        ? jsonDecode(stringRecommendMvs).map<RecommendMvModel>((item) {
            return RecommendMvModel.fromJson(item);
          }).toList()
        : [];
  }

  // 初始化
  _initData() async {
    // 获取轮播图
    var res = await MusicApi.swiper();
    swiperItems = res
        .map((item) => KeyValueModel(
              key: item.targetId.toString(),
              value: item.imageUrl,
            ))
        .toList();

    // 获取推荐歌单
    recommendSongs = await MusicApi.songList();

    // 获取推荐歌曲
    recommendNewSongs = await MusicApi.songs();

    // 获取推荐电台
    recommendDjPrograms = await RadioApi.recommendDjProgram();

    // 获取推荐 mv
    recommendMvs = await MvApi.recommendMv();

    // 离线存储
    Storage().setJson(Constants.storageBanner, swiperItems);

    Storage().setJson(Constants.storageRecommendSongList, recommendSongs);

    Storage().setJson(Constants.storageRecommendSong, recommendNewSongs);

    Storage().setJson(Constants.storageRecommendDjProgram, recommendDjPrograms);

    Storage().setJson(Constants.storageRecommendMv, recommendMvs);

    update(["home"]);
  }

  void onTap() {}

  @override
  Future<void> onInit() async {
    super.onInit();

    await _loadCache();
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
