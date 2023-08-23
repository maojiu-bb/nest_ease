import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class MusicDetailPage extends GetView<MusicDetailController> {
  const MusicDetailPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("MusicDetailPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MusicDetailController>(
      init: MusicDetailController(),
      id: "music_detail",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("music_detail")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
