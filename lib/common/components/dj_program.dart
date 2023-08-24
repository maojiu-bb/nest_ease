import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nestease_cloud_music/common/index.dart';

class DjProgramWidget extends StatelessWidget {
  // 图片
  final String image;

  // fit
  final BoxFit? fit;

  // 名字
  final String name;

  // 介绍
  final String copyRight;

  // 名字尺寸
  final double? nameSize;

  // 介绍尺寸
  final double? copyRightSize;

  // 点击事件
  final VoidCallback onTap;

  const DjProgramWidget({
    Key? key,
    required this.image,
    this.fit,
    required this.name,
    required this.copyRight,
    this.nameSize,
    this.copyRightSize,
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
        // 名字
        TextWidget.title3(
          name,
          size: nameSize ?? 15,
          overflow: TextOverflow.ellipsis,
        ).tight(width: 180),

        const SizedBox(height: 10),

        // 介绍
        TextWidget.title3(
          copyRight,
          size: copyRightSize ?? 12,
          overflow: TextOverflow.ellipsis,
        ).tight(width: 180),
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
