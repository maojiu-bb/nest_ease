import 'dart:convert';

import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';

class RadioIndexController extends GetxController {
  RadioIndexController();

  // 轮播图
  List<SwiperRadioModel> swiper = [];

  // 轮播图当前位置
  int swiperCurrentIndex = 0;

  // 轮播图切换
  void onChangeBanner(int index, /*CarouselPageChangedReason*/ reason) {
    swiperCurrentIndex = index;
    update(["radio_swiper"]);
  }

  // 读取缓存
  Future<void> _loadCache() async {
    var stringSwiper = Storage().getString(Constants.storageDjBanner);

    swiper = stringSwiper != ''
        ? jsonDecode(stringSwiper).map<SwiperRadioModel>((item) {
            return SwiperRadioModel.fromJson(item);
          }).toList()
        : [];
  }

  // 初始化数据
  _initData() async {
    // 获取电台 banner
    swiper = await RadioApi.swiperRadio();

    // 持久化存储
    Storage().setJson(Constants.storageDjBanner, swiper);

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
