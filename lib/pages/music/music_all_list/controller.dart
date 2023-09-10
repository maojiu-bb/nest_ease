import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';
import 'package:nestease_cloud_music/common/models/music/musci_list_hot_category_detail/musci_list_hot_category_detail.dart';

class MusicAllListController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController =
      TabController(length: hotCategory.length, vsync: this);

  List<MusicListHotCategory> hotCategory = [];

  // 分页页码
  final int page = 1;

  // 歌单列表
  List<MusciListHotCategoryDetail> hotCategoryDetail = [];

  // tab点击事件
  Future<void> onTabTap(int value) async {
    await _loadHotCategoryDetail(cat: hotCategory[value].name!, page: page);

    update(["music_all_list"]);
  }

  Future<void> _loadCache() async {
    var cachedHotCategory = Storage().getJson(Constants.storageHotCategory);
    var cachedHotCategoryDetail =
        Storage().getString(Constants.storageHotCategoryDetail);

    hotCategory = cachedHotCategory != null
        ? List<MusicListHotCategory>.from(cachedHotCategory
            .map((item) => MusicListHotCategory.fromJson(item)))
        : [];
    hotCategoryDetail = cachedHotCategoryDetail.isNotEmpty
        ? jsonDecode(cachedHotCategoryDetail)
            .map<MusciListHotCategoryDetail>((item) {
            return MusciListHotCategoryDetail.fromJson(item);
          }).toList()
        : [];
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await _loadCache();
  }

  // 加载分类详情歌单
  Future<void> _loadHotCategoryDetail(
      {required String cat, required int page}) async {
    hotCategoryDetail = await MusicApi.hotCategoryDetail(
        MusciListHotCategoryDetailRequest(cat: cat, page: page));

    Storage().setJson(Constants.storageHotCategoryDetail, hotCategoryDetail);
  }

  _initData() async {
    hotCategory = await MusicApi.hotCategory();

    await _loadHotCategoryDetail(cat: hotCategory[0].name!, page: page);

    Storage().setJson(Constants.storageHotCategory, hotCategory);

    update(["music_all_list"]);
  }

  void onTap() {}

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }
}
