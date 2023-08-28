import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';

class MusicPlayer extends StatelessWidget {
  // 是否播放
  final RxBool isPlaying;

  // 倍速
  final String speed;

  // 当前进度
  final double progress;

  // 总进度
  final double maxProgress;

  // 当前时长
  final String currentTime;

  //总时长
  final String totalTime;

  // 进度改变
  final ValueChanged<double>? onProgressChanged;

  // 改变播放类型
  final VoidCallback onChangePlayMode;

  // 上一首
  final VoidCallback onPlayPrevious;

  // 更换播放状态
  final VoidCallback onPlayChange;

  // 下一首
  final VoidCallback onPlayNext;

  // 菜单
  final VoidCallback onMenuTap;

  // 喜欢
  final VoidCallback onLike;

  // 下载
  final VoidCallback onDownload;

  // 更换倍速
  final VoidCallback onSpeedChange;

  const MusicPlayer({
    Key? key,
    required this.isPlaying,
    required this.progress,
    required this.maxProgress,
    required this.onProgressChanged,
    required this.onChangePlayMode,
    required this.onPlayPrevious,
    required this.onPlayNext,
    required this.onMenuTap,
    required this.onLike,
    required this.onDownload,
    required this.onPlayChange,
    required this.onSpeedChange,
    required this.speed,
    required this.currentTime,
    required this.totalTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // 倍速
      <Widget>[
        TextWidget.body2(speed).onTap(onSpeedChange),
      ]
          .toRow(
            mainAxisAlignment: MainAxisAlignment.end,
          )
          .tight(width: 315),

      // slider
      Slider(
        min: 0,
        max: maxProgress,
        value: progress,
        activeColor: AppColors.secondary,
        onChanged: onProgressChanged,
      ),

      // 时长
      <Widget>[
        TextWidget.body2(currentTime),
        TextWidget.body2(totalTime),
      ]
          .toRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          )
          .tight(width: 315),

      // 操作区域
      <Widget>[
        ButtonWidget.icon(
          Icon(
            Icons.shuffle,
            color: AppColors.onBackground,
          ),
          onTap: onChangePlayMode,
        ),
        <Widget>[
          ButtonWidget.icon(
            Icon(
              Icons.skip_previous,
              size: 40,
              color: AppColors.onBackground,
            ),
            onTap: onPlayPrevious,
          ),
          ButtonWidget.icon(
            Obx(
              () => Icon(
                isPlaying.value == true
                    ? Icons.pause_circle_filled
                    : Icons.play_circle_fill,
                size: 60,
                color: AppColors.onBackground,
              ),
            ),
            onTap: onPlayChange,
          ),
          ButtonWidget.icon(
            Icon(
              Icons.skip_next,
              size: 40,
              color: AppColors.onBackground,
            ),
            onTap: onPlayNext,
          ),
        ].toRow(),
        ButtonWidget.icon(
          Icon(
            Icons.menu,
            color: AppColors.onBackground,
          ),
          onTap: onMenuTap,
        ),
      ]
          .toRow(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          )
          .paddingTop(AppSpace.listItem),

      // 喜欢下载
      <Widget>[
        ButtonWidget.icon(
          Icon(
            Icons.favorite_border_outlined,
            color: AppColors.onBackground,
          ),
          onTap: onLike,
        ),
        ButtonWidget.icon(
          Icon(
            Icons.file_download_outlined,
            color: AppColors.onBackground,
          ),
          onTap: onDownload,
        ),
      ]
          .toRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          )
          .tight(width: 325),
    ]
        .toColumn()
        .paddingHorizontal(AppSpace.page)
        .paddingVertical(AppSpace.page);
  }
}
