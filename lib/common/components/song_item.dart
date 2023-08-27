import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nestease_cloud_music/common/index.dart';

class SongItemWidget extends StatelessWidget {
  // iamge
  final String image;

  // 名字
  final String name;

  // artist
  final List<String> artist;

  // 点击事件
  final VoidCallback onTap;

  // download
  final VoidCallback onDownload;

  // more
  final VoidCallback onShowMore;

  // like
  final VoidCallback onLike;

  const SongItemWidget({
    Key? key,
    required this.name,
    required this.onTap,
    required this.image,
    required this.artist,
    required this.onDownload,
    required this.onShowMore,
    required this.onLike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      <Widget>[
        // 图片
        ImageWidget.url(
          image,
          width: 54.w,
          height: 54.w,
          fit: BoxFit.fill,
        ),

        const SizedBox(width: 10),

        // 信息
        <Widget>[
          // 名字
          TextWidget.title3(
            name,
            size: 17,
            overflow: TextOverflow.ellipsis,
          ).tight(width: 120),
          // artist
          TextWidget.body2(
            artist.join(' / '),
            overflow: TextOverflow.ellipsis,
          ).tight(width: 120),
        ].toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ].toRow(),

      // 操作区
      <Widget>[
        ButtonWidget.icon(
          Icon(
            Icons.download_rounded,
            color: AppColors.onBackground,
          ),
        ),
        ButtonWidget.icon(
          Icon(
            Icons.favorite_border_outlined,
            color: AppColors.onBackground,
          ),
        ),
        ButtonWidget.icon(
          Icon(
            Icons.more_vert_rounded,
            color: AppColors.onBackground,
          ),
        ),
      ].toRow(),
    ]
        .toRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        )
        .paddingHorizontal(AppSpace.page)
        .paddingVertical(AppSpace.listItem);
  }
}
