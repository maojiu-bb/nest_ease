import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';
import 'package:nestease_cloud_music/common/models/music/musci_list_hot_category_detail/musci_list_hot_category_detail.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MusicAllListController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController =
      TabController(length: hotCategory.length, vsync: this);

  // 刷新控制器
  RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  List<MusicListHotCategory> hotCategory = [];

  // 分类名
  late String cat = hotCategory[0].name!;

  // 分页页码
  int page = 1;

  // 歌单列表
  List<MusciListHotCategoryDetail> hotCategoryDetail = [];

  // tab点击事件
  Future<void> onTabTap(int value) async {
    cat = hotCategory[value].name!;
    onRefresh();

    update(["music_all_list"]);
  }

  // 前往歌单详情
  void onMusciListDetail(int index) {
    Get.toNamed(
      RouteNames.musicMusicList,
      arguments: {
        'songList': hotCategoryDetail[index],
      },
    );
  }

  // 上拉载入新商品
  void onLoading() async {
    if (hotCategoryDetail.isNotEmpty) {
      try {
        // 拉取数据是否为空
        var isEmpty = await _loadHotCategoryDetail(cat: cat, page: page);

        if (isEmpty) {
          // 设置无数据
          refreshController.loadNoData();
        } else {
          // 加载完成
          refreshController.loadComplete();
        }
      } catch (e) {
        // 加载失败
        refreshController.loadFailed();
      }
    } else {
      // 设置无数据
      refreshController.loadNoData();
    }
    update(["music_list_view"]);
  }

  // 下拉刷新
  void onRefresh() async {
    try {
      await _loadHotCategoryDetail(cat: cat, page: page += 1, isRefresh: true);
      refreshController.refreshCompleted();
    } catch (error) {
      // 刷新失败
      refreshController.refreshFailed();
    }
    update(["music_list_view"]);
  }

  // 加载分类详情歌单
  Future<bool> _loadHotCategoryDetail(
      {required String cat, required int page, bool? isRefresh = false}) async {
    var result = await MusicApi.hotCategoryDetail(
        MusciListHotCategoryDetailRequest(cat: cat, page: page));

    if (isRefresh == true) {
      hotCategoryDetail.insertAll(0, result);
    } else {
      page++;
      hotCategoryDetail.addAll(result);
    }

    return result.isEmpty;
  }

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
    refreshController.dispose();
  }
}
