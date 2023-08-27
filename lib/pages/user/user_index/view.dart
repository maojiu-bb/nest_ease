import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';

import 'index.dart';

class UserIndexPage extends GetView<UserIndexController> {
  const UserIndexPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("UserIndexPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserIndexController>(
      init: UserIndexController(),
      id: "user_index",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("user_index")),
          body: Stack(
            children: [
              SafeArea(
                child: _buildView(),
              ),

              // 固定在底部的 PlayWidget
              Positioned(
                left: 0,
                right: 0,
                bottom: 90,
                child: PlayWidget(
                  image:
                      'https://p2.music.126.net/kT4AECoc13oVKLEg_-eFMA==/109951166578436098.jpg',
                  name: '指纹',
                  onPlay: () => {},
                  onNext: () => {},
                  onPrevious: () => {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
