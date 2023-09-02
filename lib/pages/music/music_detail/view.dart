import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';

import 'index.dart';
import 'widgets/index.dart';

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
        width: 320,
        height: 320,
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
        .tight(height: 400)
        .paddingHorizontal(AppSpace.page)
        .paddingVertical(AppSpace.page);
  }

  // 歌词信息
  Widget _buildLyric() {
    return <Widget>[
      // 信息
      <Widget>[
        ImageWidget.url(
          controller.songDetail[0].al!.picUrl!,
          width: 50,
          height: 50,
          radius: 10,
        ),
        const SizedBox(width: 10),
        TextWidget.body1(
          '${controller.songDetail[0].name} - ${controller.songDetail[0].ar!.map((e) => e.name).join('/')}',
          overflow: TextOverflow.fade,
        ).tight(width: 300),
      ].toRow(),

      const SizedBox(height: 15),

      // 歌词
      <Widget>[
        for (int i = 0;
            i <
                LyricFormate(lyric: controller.musicLyric.lrc!.lyric!)
                    .toList()
                    .length;
            i++)
          Obx(
            () {
              String startTimeString =
                  LyricFormate(lyric: controller.musicLyric.lrc!.lyric!)
                      .toList()[i]['time'];
              String endTimeString = (i + 1) <
                      LyricFormate(lyric: controller.musicLyric.lrc!.lyric!)
                          .toList()
                          .length
                  ? LyricFormate(lyric: controller.musicLyric.lrc!.lyric!)
                      .toList()[i + 1]['time']
                  : LyricFormate(lyric: controller.musicLyric.lrc!.lyric!)
                      .toList()[i]['time'];

              // 将时间字符串转换为 Duration 类型
              Duration startTime = Duration(
                minutes: int.parse(startTimeString.split(':')[0]),
                seconds: int.parse(startTimeString.split(':')[1]),
                milliseconds: int.parse(startTimeString.split(':')[2]),
              );
              Duration endTime = Duration(
                minutes: int.parse(endTimeString.split(':')[0]),
                seconds: int.parse(endTimeString.split(':')[1]),
                milliseconds: int.parse(endTimeString.split(':')[2]),
              );

              Duration currentTime = Duration(
                minutes: int.parse(
                    AudioPlayerService.to.exactCurrentTime.value.split(':')[0]),
                seconds: int.parse(
                    AudioPlayerService.to.exactCurrentTime.value.split(':')[1]),
                milliseconds: int.parse(
                    AudioPlayerService.to.exactCurrentTime.value.split(':')[2]),
              );

              // 检查播放时间是否在歌词区间内
              bool isPlaying =
                  currentTime >= startTime && currentTime < endTime;

              return TextWidget.body1(
                LyricFormate(lyric: controller.musicLyric.lrc!.lyric!)
                    .toList()[i]['lyric'],
                textAlign: TextAlign.center,
                size: 20,
                softWrap: true,
                color: isPlaying ? AppColors.primary : AppColors.onBackground,
              ).paddingVertical(AppSpace.listItem);
            },
          ),
      ]
          .toListView(
            scrollDirection: Axis.vertical,
          )
          .expanded(),
    ]
        .toColumn()
        .tight(height: 400)
        .paddingHorizontal(AppSpace.page)
        .paddingVertical(AppSpace.page);
  }

  // 播放列表
  Widget _buildMenuMusicList() {
    return GetBuilder(
        init: controller,
        id: 'menu_list',
        builder: (_) {
          return <Widget>[
            const TextWidget.title3('播放列表').paddingBottom(AppSpace.listRow),
            <Widget>[
              for (int i = 0; i < controller.musicList.length; i++)
                MusicItemWidget(
                  image: controller.musicList[i].al!.picUrl!,
                  name: controller.musicList[i].name!,
                  artists:
                      controller.musicList[i].ar!.map((e) => e.name!).toList(),
                  isActive: i == AudioPlayerService.to.currentIndex.value,
                  onRemove: () {},
                  onTap: () => controller.onMenuMusicTap(i),
                ),
            ].toListView().expanded(),
          ]
              .toColumn()
              .paddingVertical(
                AppSpace.page,
              )
              .paddingHorizontal(
                AppSpace.page,
              );
        });
  }

  // 播放区域
  Widget _buildAudioPlayer() {
    return MusicPlayer(
      isPlaying: AudioPlayerService.to.isPlaying,
      isLoop: AudioPlayerService.to.isLoop,
      progress: AudioPlayerService.to.progress,
      maxProgress: 1,
      currentTime: AudioPlayerService.to.currentTime,
      totalTime: AudioPlayerService.to.totalTime,
      onProgressChanged: controller.onProgressChanged,
      onChangePlayMode: controller.onChangePlayMode,
      onPlayPrevious: controller.onPlayPrevious,
      onPlayChange: controller.onPlayChange,
      onPlayNext: controller.onPlayNext,
      onMenuTap: () => Get.bottomSheet(
        _buildMenuMusicList(),
        backgroundColor: AppColors.background,
      ),
      onLike: controller.onLike,
      onDownload: controller.onDownload,
    );
  }

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // 图片信息
      // _buildInfo(),

      // 歌词
      _buildLyric(),

      // 播放区域
      _buildAudioPlayer(),
    ].toColumn();
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
