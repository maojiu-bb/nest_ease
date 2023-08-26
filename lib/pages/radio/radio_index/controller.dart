import 'dart:convert';

import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';

class RadioIndexController extends GetxController {
  RadioIndexController();

  // 轮播图
  List<SwiperRadioModel> swiper = [];

  // 轮播图当前位置
  int swiperCurrentIndex = 0;

  // 分类列表
  List<RadioCategoryItemModel> categoryList = [];

  // appbar
  void onAppBarTap() {}

  // 轮播图切换
  void onChangeBanner(int index, /*CarouselPageChangedReason*/ reason) {
    swiperCurrentIndex = index;
    update(["radio_swiper"]);
  }

  // 轮播图点击事件
  void onBannerTap(int index, dynamic imgUrl) {
    Get.toNamed(
      RouteNames.systemWebview,
      arguments: {
        "url": swiper[index].url,
      },
    );
  }

  // category 点击
  void onCategoryTap(int categoryId) {}

  // 读取缓存
  Future<void> _loadCache() async {
    var stringSwiper = Storage().getString(Constants.storageDjBanner);

    var stringCategory = Storage().getString(Constants.storageDjCategory);

    swiper = stringSwiper != ''
        ? jsonDecode(stringSwiper).map<SwiperRadioModel>((item) {
            return SwiperRadioModel.fromJson(item);
          }).toList()
        : [];

    categoryList = stringCategory != ''
        ? jsonDecode(stringCategory).map<RadioCategoryItemModel>((item) {
            return RadioCategoryItemModel.fromJson(item);
          }).toList()
        : [];
  }

  // 初始化数据
  _initData() async {
    // 获取电台 banner
    swiper = await RadioApi.swiperRadio();

    // 获取分类列表
    categoryList = await RadioApi.radioCategory();

    // 持久化存储
    Storage().setJson(Constants.storageDjBanner, swiper);

    Storage().setJson(Constants.storageDjCategory, categoryList);

    update(["radio_index"]);
  }

  void onTap() {}

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
