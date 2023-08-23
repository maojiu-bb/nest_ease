import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class MusicListPage extends GetView<MusicListController> {
  const MusicListPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("MusicListPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MusicListController>(
      init: MusicListController(),
      id: "music_list",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("music_list")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
