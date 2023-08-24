import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class VedioDetailPage extends GetView<VedioDetailController> {
  const VedioDetailPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("VedioDetailPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VedioDetailController>(
      init: VedioDetailController(),
      id: "vedio_detail",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("vedio_detail")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
