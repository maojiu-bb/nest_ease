import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';

import 'index.dart';

class MusicListPage extends GetView<MusicListController> {
  const MusicListPage({Key? key}) : super(key: key);

  // appbar
  AppBar _buildBar() {
    return AppBar(
      iconTheme: IconThemeData(
        color: AppColors.onBackground,
      ),
      // 背景透明
      backgroundColor: Colors.transparent,
      // 取消阴影
      elevation: 0,
      // 标题栏左侧间距
      titleSpacing: AppSpace.listItem,
      // action
      actions: [
        <Widget>[
          IconWidget.icon(
            Icons.download_rounded,
            color: AppColors.onBackground,
          ),
          IconWidget.icon(
            Icons.share,
            color: AppColors.onBackground,
          ),
          IconWidget.icon(
            Icons.more_vert,
            color: AppColors.onBackground,
          ),
        ]
            .toRow(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            )
            .paddingRight(AppSpace.listRow)
            .tight(width: 120),
      ],
    );
  }

  // 顶部信息
  Widget _buildTopInfo() {
    return <Widget>[
      // 图片
      ImageWidget.url(
        controller.songList.picUrl,
        width: 160,
        height: 160,
        fit: BoxFit.fill,
      ),

      const SizedBox(width: 15),

      // 右侧信息
      <Widget>[
        // name
        TextWidget.title2(
          controller.songList.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          size: 20,
        ),

        const SizedBox(height: 6),

        // 播放数量
        TextWidget.body1(
          '播放 - ${controller.songList.playCount}',
          size: 12,
          overflow: TextOverflow.ellipsis,
        ),

        const SizedBox(height: 10),

        // 按钮
        <Widget>[
          ButtonWidget.iconText(
            width: 90,
            height: 36,
            borderRadius: 15,
            '播放',
            Icon(
              Icons.play_arrow,
              color: AppColors.onPrimary,
            ),
            textColor: AppColors.onPrimary,
            backgroundColor: AppColors.primary,
          ),
          const ButtonWidget.icon(
            Icon(Icons.star_rate_rounded),
          ),
        ].toRow(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ]
          .toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .tight(width: 185),
    ]
        .toRow()
        .paddingHorizontal(AppSpace.page)
        .paddingVertical(AppSpace.listView);
  }

  // 主视图
  Widget _buildView() {
    return CustomScrollView(
      slivers: [
        // 顶部
        _buildTopInfo().sliverToBoxAdapter(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MusicListController>(
      init: MusicListController(),
      id: "music_list",
      builder: (_) {
        return Scaffold(
          // appBar: AppBar(title: const Text("music_list")),
          appBar: _buildBar(),
          body: Stack(
            children: [
              SafeArea(
                child: _buildView(),
              ),

              // 固定在底部的 PlayWidget
              Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                child: PlayWidget(
                  image:
                      'https://p2.music.126.net/kT4AECoc13oVKLEg_-eFMA==/109951166578436098.jpg',
                  name: '指纹',
                  onPlay: () => {},
                  onNext: () => {},
                  onPrevious: () => {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
