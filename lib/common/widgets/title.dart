import 'package:flutter/material.dart';
import 'package:nestease_cloud_music/common/index.dart';

enum TitleWidgetType {
  primary,
  refresh,
}

class TitleWidget extends StatelessWidget {
  // 类型
  final TitleWidgetType type;

  // 标题
  final String title;

  // 标题大小
  final double? titleSize;

  // 右侧图标
  final Widget icon;

  // 左侧图标
  final Widget? leftIcon;

  // 点击事件
  final VoidCallback? onTap;

  // 刷新
  final VoidCallback? onRefresh;

  const TitleWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.leftIcon,
    required this.type,
    this.onTap,
    this.onRefresh,
    this.titleSize,
  }) : super(key: key);

  // 基本 title
  const TitleWidget.primary({
    super.key,
    required this.title,
    Widget? icon,
    this.type = TitleWidgetType.primary,
    this.leftIcon,
    this.onTap,
    this.onRefresh,
    this.titleSize,
  }) : icon = const Icon(
          Icons.arrow_forward_ios,
          size: 14,
          color: Colors.grey,
        );

  // 带刷新 title
  const TitleWidget.refresh({
    super.key,
    required this.title,
    Widget? icon,
    this.type = TitleWidgetType.refresh,
    Widget? leftIcon,
    this.onTap,
    this.onRefresh,
    this.titleSize,
  })  : icon = const Icon(
          Icons.arrow_forward_ios,
          size: 14,
          color: Colors.grey,
        ),
        leftIcon = const Icon(
          Icons.refresh,
          size: 14,
          color: Colors.grey,
        );

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // 左侧图标
      if (leftIcon != null)
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: leftIcon!,
        ).onTap(onRefresh),
      // 标题
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          title,
          style: TextStyle(
            fontSize: titleSize ?? 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      // 右侧图标
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: icon,
      ).onTap(onTap),
    ].toRow().paddingHorizontal(AppSpace.listRow);
  }
}
