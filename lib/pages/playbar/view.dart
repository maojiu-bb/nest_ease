import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';

import 'index.dart';

class PlaybarPage extends GetView<PlaybarController> {
  final bool isMusicList;
  const PlaybarPage({
    Key? key,
    this.isMusicList = false,
  }) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: isMusicList ? 20 : 90,
      child: PlayWidget(
        isPlaying: AudioPlayerService.to.isPlaying,
        image: AudioPlayerService.to.songDetail.isNotEmpty
            ? AudioPlayerService.to.songDetail[0].al!.picUrl!
            : controller.songDetail[0].al!.picUrl!,
        name: AudioPlayerService.to.songDetail.isNotEmpty
            ? AudioPlayerService.to.songDetail[0].name!
            : controller.songDetail[0].name!,
        onPlay: controller.onPlayChanged,
        onNext: controller.onPlayNext,
        onPrevious: controller.onPlayPrevious,
        onDetailTap: controller.onDetailTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlaybarController>(
      init: PlaybarController(),
      id: "playbar",
      builder: (_) {
        return _buildView();
      },
    );
  }
}
