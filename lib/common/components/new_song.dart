import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nestease_cloud_music/common/index.dart';

class NewSongWidget extends StatelessWidget {
  // 图片
  final String image;

  // fit
  final BoxFit? fit;

  // 歌名
  final String name;

  // 作者
  final String author;

  // 专辑
  final String album;

  // 歌名尺寸
  final double? nameSize;

  // 作者尺寸
  final double? authorSize;

  // 专辑尺寸
  final double? albumSize;

  // 点击事件
  final VoidCallback onTap;

  const NewSongWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.author,
    required this.album,
    this.fit,
    this.nameSize,
    this.authorSize,
    this.albumSize,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // 图片
      ImageWidget.url(
        image,
        width: 70.w,
        height: 70.h,
        fit: fit ?? BoxFit.fill,
      ),

      const SizedBox(width: 15),

      // 信息
      <Widget>[
        // 歌名
        TextWidget.title3(
          name,
          size: nameSize ?? 15,
          overflow: TextOverflow.ellipsis,
        ).tight(width: 180),

        const SizedBox(height: 10),

        // 歌手专辑
        <Widget>[
          // 歌手
          TextWidget.body2(
            author,
            size: authorSize ?? 12,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(width: 10),

          // 专辑
          TextWidget.body2(
            album,
            size: albumSize ?? 12,
            overflow: TextOverflow.ellipsis,
          ).tight(width: 100),
        ].toRow(),
      ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    ]
        .toRow(
          mainAxisAlignment: MainAxisAlignment.start,
        )
        .paddingHorizontal(
          AppSpace.listView,
        )
        .paddingVertical(
          AppSpace.listView,
        )
        .tight(width: 280)
        .onTap(onTap);
  }
}
