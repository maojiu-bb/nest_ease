import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nestease_cloud_music/common/index.dart';
import 'package:badges/badges.dart' as badges;

// 歌单
class SongListWidget extends StatelessWidget {
  // 图片
  final String imgUrl;

  // 文字
  final String text;

  // 文字大小
  final double? fontSize;

  // fit
  final BoxFit? fit;

  // 播放数量
  final String? playCount;

  // 播放函数
  final VoidCallback onPlay;

  // 点击
  final VoidCallback onTap;

  const SongListWidget({
    Key? key,
    required this.imgUrl,
    required this.text,
    this.playCount,
    this.fontSize,
    this.fit,
    required this.onPlay,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      <Widget>[
        // 播放数量
        if (playCount != null)
          badges.Badge(
            badgeContent: Text(
              playCount!,
              style: TextStyle(
                color: AppColors.onPrimary,
                fontSize: 9,
              ),
            ),
            position: badges.BadgePosition.topEnd(top: 5, end: 5),
            badgeStyle: const badges.BadgeStyle(
              elevation: 0,
              shape: badges.BadgeShape.square,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              badgeColor: Color.fromRGBO(0, 0, 0, 0.5),
              padding: EdgeInsets.all(4.0),
            ),
            // 图片
            child: ImageWidget.url(
              imgUrl,
              width: 115.w,
              height: 115.h,
              fit: fit ?? BoxFit.fill,
            ),
          ),

        if (playCount == null)
          ImageWidget.url(
            imgUrl,
            width: 115.w,
            height: 115.h,
            fit: fit ?? BoxFit.fill,
          ),

        // 播放按钮
        IconButton(
          splashColor: Colors.transparent,
          onPressed: onPlay,
          icon: Icon(
            Icons.play_arrow_rounded,
            color: AppColors.onPrimary,
            size: 30.w,
          ),
        ).positioned(
          right: 0,
          bottom: 0,
        ),
      ].toStack(),

      const SizedBox(height: 5),

      // 文字
      TextWidget.body2(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        size: fontSize ?? 14,
      ),
    ].toColumn().width(115).height(160).paddingHorizontal(
          AppSpace.listView,
        );
  }
}
