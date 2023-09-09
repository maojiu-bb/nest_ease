import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';
import 'package:nestease_cloud_music/pages/music/music_all_list/widgets/index.dart';

import 'index.dart';

class MusicAllListPage extends GetView<MusicAllListController> {
  const MusicAllListPage({Key? key}) : super(key: key);

  // appbar
  AppBar _buildAppBar() {
    return AppBar(
      // 背景透明
      backgroundColor: Colors.transparent,
      // 取消阴影
      elevation: 0,
      // 标题栏左侧间距
      titleSpacing: AppSpace.listItem,
      leading: ButtonWidget.icon(
        Icon(
          Icons.arrow_back_ios,
          color: AppColors.onBackground,
        ),
        onTap: () => Get.back(),
      ),
      title: TextWidget.title2(
        '歌单分类',
        color: AppColors.onBackground,
      ),
      centerTitle: true,
    );
  }

  // 热门歌单分类
  Widget _buildHotMusicListCategory() {
    return <Widget>[]
        .toListView(
          scrollDirection: Axis.horizontal,
        )
        .height(120)
        .paddingHorizontal(AppSpace.listItem)
        .paddingVertical(AppSpace.page)
        .sliverToBoxAdapter();
  }

  // 主视图
  Widget _buildView() {
    return CustomScrollView(
      slivers: [
        // 热门歌单分类
        _buildHotMusicListCategory(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MusicAllListController>(
      init: MusicAllListController(),
      id: "music_all_list",
      builder: (_) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
