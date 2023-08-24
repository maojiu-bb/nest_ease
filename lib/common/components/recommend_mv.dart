import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nestease_cloud_music/common/index.dart';
import 'package:badges/badges.dart' as badges;

class RecommendMvWidget extends StatelessWidget {
  // 图片
  final String imgUrl;

  // fit
  final BoxFit? fit;

  // name
  final String name;

  // 尺寸
  final double? nameSize;

  // 字重
  final FontWeight? nameWeight;

  // 作者
  final List<String> artistList;

  // 尺寸
  final double? artistSize;

  // copywrite
  final String copywrite;

  // 尺寸
  final double? copywriteSize;

  // 播放数量
  final String? playCount;

  //  点击事件
  final VoidCallback onTap;

  // 播放
  final VoidCallback onPlay;

  const RecommendMvWidget({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.copywrite,
    required this.onTap,
    this.fit,
    required this.artistList,
    this.nameSize,
    this.artistSize,
    this.copywriteSize,
    this.nameWeight,
    this.playCount,
    required this.onPlay,
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
            child: // 图片
                ImageWidget.url(
              imgUrl,
              width: double.infinity,
              height: 180.h,
              fit: fit ?? BoxFit.fill,
            ),
          ),

        if (playCount == null)
          ImageWidget.url(
            imgUrl,
            width: double.infinity,
            height: 180.h,
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

      const SizedBox(height: 10),

      // 作者
      <Widget>[
        // artists
        TextWidget.body2(
          artistList.join('/'),
          size: artistSize ?? 16,
        ),

        const SizedBox(width: 20),

        // name
        TextWidget.body1(
          name,
          size: nameSize ?? 16,
          weight: nameWeight ?? FontWeight.w600,
        ),
      ].toRow(
        mainAxisAlignment: MainAxisAlignment.center,
      ),

      // copy write
      TextWidget.body2(
        copywrite,
        size: copywriteSize ?? 14,
      ),
    ]
        .toColumn()
        .width(double.infinity)
        .height(260)
        .paddingHorizontal(
          AppSpace.listView,
        )
        .paddingVertical(AppSpace.listItem);
  }
}
