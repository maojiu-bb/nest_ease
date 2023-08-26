import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'index.dart';

class WebviewPage extends GetView<WebviewController> {
  const WebviewPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return WebViewWidget(controller: controller.webViewController);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WebviewController>(
      init: WebviewController(),
      id: "webview",
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: _buildView(),
          ),
        );
      },
    );
  }
}
