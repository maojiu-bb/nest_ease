import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class UserDetailPage extends GetView<UserDetailController> {
  const UserDetailPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("UserDetailPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserDetailController>(
      init: UserDetailController(),
      id: "user_detail",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("user_detail")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
