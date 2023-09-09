import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class MusicAllListPage extends GetView<MusicAllListController> {
  const MusicAllListPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("MusicAllListPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MusicAllListController>(
      init: MusicAllListController(),
      id: "music_all_list",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("music_all_list")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
