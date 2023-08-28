import 'package:flutter/material.dart';
import 'package:nestease_cloud_music/common/index.dart';

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // 倍速
      <Widget>[
        const TextWidget.body2('1.0x'),
      ]
          .toRow(
            mainAxisAlignment: MainAxisAlignment.end,
          )
          .tight(width: 315),

      // slider
      Slider(
        min: 0,
        max: 1,
        value: 0.5,
        activeColor: AppColors.secondary,
        onChanged: (value) {},
      ),

      // 时长
      <Widget>[
        const TextWidget.body2('02.03'),
        const TextWidget.body2('04.06'),
      ]
          .toRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          )
          .tight(width: 315),

      // 操作区域
      <Widget>[
        ButtonWidget.icon(
          Icon(
            Icons.shuffle,
            color: AppColors.onBackground,
          ),
        ),
        <Widget>[
          ButtonWidget.icon(
            Icon(
              Icons.skip_previous,
              size: 40,
              color: AppColors.onBackground,
            ),
          ),
          ButtonWidget.icon(
            Icon(
              // Icons.pause_circle_filled
              Icons.play_circle_fill,
              size: 60,
              color: AppColors.onBackground,
            ),
          ),
          ButtonWidget.icon(
            Icon(
              Icons.skip_next,
              size: 40,
              color: AppColors.onBackground,
            ),
          ),
        ].toRow(),
        ButtonWidget.icon(
          Icon(
            Icons.menu,
            color: AppColors.onBackground,
          ),
        ),
      ]
          .toRow(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          )
          .paddingTop(AppSpace.listItem),

      // 喜欢下载
      <Widget>[
        ButtonWidget.icon(
          Icon(
            Icons.favorite_border_outlined,
            color: AppColors.onBackground,
          ),
        ),
        ButtonWidget.icon(
          Icon(
            Icons.file_download_outlined,
            color: AppColors.onBackground,
          ),
        ),
      ]
          .toRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          )
          .tight(width: 325),
    ]
        .toColumn()
        .paddingHorizontal(AppSpace.page)
        .paddingVertical(AppSpace.page);
  }
}
