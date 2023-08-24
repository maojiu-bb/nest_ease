import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nestease_cloud_music/common/index.dart';

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

  //  点击事件
  final VoidCallback onTap;

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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // 图片
      ImageWidget.url(
        imgUrl,
        width: double.infinity,
        height: 180.h,
        fit: fit ?? BoxFit.fill,
      ),

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
    ].toColumn().width(double.infinity).height(360).paddingHorizontal(
          AppSpace.listView,
        );
  }
}
