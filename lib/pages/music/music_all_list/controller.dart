import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';

class MusicAllListController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController =
      TabController(length: hotCategory.length, vsync: this);

  List<MusicListHotCategory> hotCategory = [];

  Future<void> _loadCache() async {
    var cachedHotCategory = Storage().getJson(Constants.storageHotCategory);
    hotCategory = cachedHotCategory != null
        ? List<MusicListHotCategory>.from(cachedHotCategory
            .map((item) => MusicListHotCategory.fromJson(item)))
        : [];
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await _loadCache();
  }

  _initData() async {
    hotCategory = await MusicApi.hotCategory();

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
