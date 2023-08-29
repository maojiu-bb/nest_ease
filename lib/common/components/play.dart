import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';

class PlayWidget extends StatefulWidget {
  // 是否播放
  final RxBool isPlaying;

  // 图片
  final String image;

  // 名字
  final String name;

  // 播放或暂停事件
  final VoidCallback onPlay;

  // 下一首
  final VoidCallback onNext;

  // 上一首
  final VoidCallback onPrevious;

  // 去详情页面
  final VoidCallback onDetailTap;

  const PlayWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.onPlay,
    required this.onNext,
    required this.onPrevious,
    required this.isPlaying,
    required this.onDetailTap,
  }) : super(key: key);

  @override
  _PlayWidgetState createState() => _PlayWidgetState();
}

class _PlayWidgetState extends State<PlayWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return <Widget>[
      <Widget>[
        // 图片
        ImageWidget.url(
          widget.image,
          width: 38.w,
          height: 38.w,
          fit: BoxFit.fill,
        ),

        const SizedBox(width: 10),

        // 名字
        TextWidget.body2(
          widget.name,
          size: 14,
          overflow: TextOverflow.fade,
        ).tight(width: 160),
      ].toRow().onTap(widget.onDetailTap),

      // 操作区域
      <Widget>[
        // 上一首
        IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: const Icon(
            Icons.skip_previous,
          ),
          onPressed: widget.onPrevious,
        ),

        // 播放
        Obx(
          () => IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(
              widget.isPlaying.value == true ? Icons.pause : Icons.play_arrow,
            ),
            onPressed: widget.onPlay,
          ),
        ),

        // 下一首
        IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: const Icon(
            Icons.skip_next,
          ),
          onPressed: widget.onNext,
        ),
      ].toRow(),
    ]
        .toRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        )
        .width(double.infinity)
        .paddingHorizontal(20)
        .backgroundColor(
          AppColors.surfaceVariant,
        );
  }
}
