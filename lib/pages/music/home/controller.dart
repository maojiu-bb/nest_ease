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

  // 推荐歌单点击事件
  void onRecommendTap() {}

  // 推荐歌单播放
  void onRecommendPlay() {}

  // 读取缓存
  Future<void> _loadCache() async {
    var stringSwiper = Storage().getString(Constants.storageBanner);
    var stringRecommendSongList =
        Storage().getString(Constants.storageRecommendSongList);

    swiperItems = stringSwiper != " "
        ? jsonDecode(stringSwiper).map<KeyValueModel>((item) {
            return KeyValueModel.fromJson(item);
          }).toList()
        : [];
    recommendSongs = stringRecommendSongList != " "
        ? jsonDecode(stringRecommendSongList).map<SongListModel>((item) {
            return SongListModel.fromJson(item);
          }).toList()
        : [];
  }

  // 初始化
  _initData() async {
    // 获取轮播图
    var res = await MusicApi.swiper();
    swiperItems = res.map((item) {
      return KeyValueModel(
        key: item.targetId.toString(),
        value: item.imageUrl,
      );
    }).toList();

    // 获取推荐歌单
    recommendSongs = await MusicApi.songList();

    // 离线存储
    Storage().setJson(Constants.storageBanner, swiperItems);

    Storage().setJson(Constants.storageRecommendSongList, recommendSongs);

    update(["home"]);
  }

  void onTap() {}

  @override
  void onInit() {
    super.onInit();
    // 加载缓存
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
