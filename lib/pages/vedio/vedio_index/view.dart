import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class VedioIndexPage extends GetView<VedioIndexController> {
  const VedioIndexPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("VedioIndexPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VedioIndexController>(
      init: VedioIndexController(),
      id: "vedio_index",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("vedio_index")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
