import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';

class SplashController extends GetxController {
  SplashController();

  // 跳转
  void _jumpToPage() {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      Get.offAllNamed(RouteNames.systemWelcome);
    });
  }

  _initData() {
    // 删除设备启动图
    FlutterNativeSplash.remove();

    update(["splash"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();

    // 跳转界面
    _jumpToPage();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
