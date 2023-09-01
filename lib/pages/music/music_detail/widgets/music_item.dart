import 'package:flutter/material.dart';
import 'package:nestease_cloud_music/common/index.dart';

class MusicItemWidget extends StatelessWidget {
  // url
  final String image;

  // name
  final String name;

  // artist
  final List<String> artists;

  // active
  final bool isActive;

  // onRemove
  final VoidCallback onRemove;

  // onTap
  final VoidCallback onTap;

  const MusicItemWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.artists,
    required this.onRemove,
    required this.onTap,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      <Widget>[
        ImageWidget.url(
          image,
          width: 40,
          height: 40,
        ),
        const SizedBox(width: 10),
        TextWidget.body1(
          '$name - ${artists.join('/')}',
          overflow: TextOverflow.fade,
        ).tight(width: 260),
      ].toRow().onTap(onTap),
      ButtonWidget.icon(
        Icon(
          Icons.close,
          size: 16,
          color: AppColors.onBackground,
        ),
        onTap: onRemove,
      )
    ]
        .toRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        )
        .backgroundColor(
          isActive ? AppColors.highlight : AppColors.background,
        );
  }
}
