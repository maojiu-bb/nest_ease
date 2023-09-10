import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';

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
      // 底部
      bottom: TabBar(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpace.page,
        ), // 设置左右间距为16
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: AppColors.primary,
        splashBorderRadius: BorderRadius.circular(
          AppRadius.button,
        ),
        tabs: controller.hotCategory
            .map(
              (element) => TextWidget.title3(
                element.name!,
                color: AppColors.onBackground,
              ),
            )
            .toList(),
        controller: controller.tabController,
        onTap: (value) {},
      ),
      actions: [
        ButtonWidget.icon(
          Icon(
            Icons.more_horiz_rounded,
            size: 30,
            color: AppColors.onBackground,
          ),
          onTap: () {},
        ),
      ],
    );
  }

  // 主视图
  Widget _buildView() {
    return const CustomScrollView(
      slivers: [],
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
