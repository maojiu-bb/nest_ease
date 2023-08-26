import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nestease_cloud_music/common/index.dart';

/// 分类导航项
class RadioCategoryListItemWidget extends StatelessWidget {
  /// 分类数据
  final RadioCategoryItemModel category;

  /// 选中代码
  final int? selectId;

  /// tap 事件
  final Function(int categoryId)? onTap;

  const RadioCategoryListItemWidget({
    Key? key,
    required this.category,
    this.onTap,
    this.selectId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // 图
      ImageWidget.url(
        category.pic56x56Url ?? "", // 图片地址
        width: 48.w,
        height: 48.w,
      ),
      // 文字
      TextWidget.body1(
        category.name ?? "-", // 文字内容
        size: 12.sp,
        color: selectId == category.id ? AppColors.onSecondary : null, // 选中颜色
      ),
    ]
        .toColumn(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        )

        // padding 垂直间距
        .paddingVertical(AppSpace.button)

        // 背景色
        .backgroundColor(
          selectId == category.id
              ? AppColors.onSurfaceVariant
              : Colors.transparent,
        )
        .onTap(() => onTap?.call(category.id!));
  }
}
