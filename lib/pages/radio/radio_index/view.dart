import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class RadioIndexPage extends GetView<RadioIndexController> {
  const RadioIndexPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("RadioIndexPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RadioIndexController>(
      init: RadioIndexController(),
      id: "radio_index",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("radio_index")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
