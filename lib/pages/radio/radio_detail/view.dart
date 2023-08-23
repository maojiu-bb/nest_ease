import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class RadioDetailPage extends GetView<RadioDetailController> {
  const RadioDetailPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("RadioDetailPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RadioDetailController>(
      init: RadioDetailController(),
      id: "radio_detail",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("radio_detail")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
