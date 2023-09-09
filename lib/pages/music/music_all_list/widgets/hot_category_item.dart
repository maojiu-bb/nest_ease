import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nestease_cloud_music/common/index.dart';

class HotCategoryItem extends StatelessWidget {
  // 图片
  final String image;

  // 分类名
  final String title;

  // 分类名尺寸
  final double? titleSize;

  const HotCategoryItem({
    Key? key,
    required this.image,
    required this.title,
    this.titleSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // 图片
      ImageWidget.url(
        image,
        width: 80.w,
        height: 80.h,
        radius: AppRadius.image,
      ),

      const SizedBox(height: 10),

      // title
      TextWidget.body2(
        title,
        size: titleSize ?? 14,
      ),
    ].toColumn().width(100).height(120);
  }
}
