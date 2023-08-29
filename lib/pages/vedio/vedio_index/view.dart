import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';
import 'package:nestease_cloud_music/pages/index.dart';

class VedioIndexPage extends GetView<VedioIndexController> {
  const VedioIndexPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return CustomScrollView(
      slivers: [
        const Text('data').sliverToBoxAdapter(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VedioIndexController>(
      init: VedioIndexController(),
      id: "vedio_index",
      builder: (_) {
        return Scaffold(
          // appBar: AppBar(title: const Text("vedio_index")),
          body: Stack(
            children: [
              SafeArea(
                child: _buildView(),
              ),

              // 固定在底部的 PlayWidget
              const PlaybarPage(),
            ],
          ),
        );
      },
    );
  }
}
