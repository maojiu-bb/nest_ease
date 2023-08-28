import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';

import 'index.dart';

class MusicDetailPage extends GetView<MusicDetailController> {
  const MusicDetailPage({Key? key}) : super(key: key);

  // appbar
  AppBar _buildAppbar() {
    return AppBar(
      // 背景透明
      backgroundColor: Colors.transparent,
      // 取消阴影
      elevation: 0,
      // 标题栏左侧间距
      titleSpacing: AppSpace.listItem,
      leading: ButtonWidget.icon(
        Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.onBackground,
          size: 25,
        ),
        onTap: () => Get.back(),
      ),
      // action
      actions: [
        <Widget>[
          IconWidget.icon(
            Icons.lyrics_outlined,
            color: AppColors.onBackground,
          ).onTap(controller.onLyrics),
          IconWidget.icon(
            Icons.share,
            color: AppColors.onBackground,
          ).onTap(controller.onShare),
          IconWidget.icon(
            Icons.more_vert,
            color: AppColors.onBackground,
          ).onTap(controller.onMoreDetail),
        ]
            .toRow(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            )
            .paddingRight(AppSpace.listRow)
            .tight(width: 120),
      ],
    );
  }

  // 图片信息
  Widget _buildInfo() {
    return <Widget>[
      // 图片
      ImageWidget.url(
        controller.songDetail[0].al!.picUrl!,
        width: 280,
        height: 280,
        radius: 15,
      ),
      const SizedBox(height: 15),
      // 文字
      TextWidget.title1(
        controller.songDetail[0].name!,
        size: 26,
        maxLines: 1,
        overflow: TextOverflow.fade,
      ),
      TextWidget.body1(
        controller.songDetail[0].ar!.map((e) => e.name).toList().join(' / '),
        maxLines: 1,
        overflow: TextOverflow.fade,
      ),
    ]
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.center,
        )
        .paddingHorizontal(AppSpace.page);
  }

  // 主视图
  Widget _buildView() {
    return CustomScrollView(
      slivers: [
        // 图片信息
        _buildInfo().sliverToBoxAdapter(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MusicDetailController>(
      init: MusicDetailController(),
      id: "music_detail",
      builder: (_) {
        return Scaffold(
          appBar: _buildAppbar(),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
