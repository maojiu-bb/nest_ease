import 'package:get/get.dart';
import 'package:nestease_cloud_music/pages/index.dart';

/// 主界面依赖
class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<RadioIndexController>(() => RadioIndexController());
    Get.lazyPut<UserIndexController>(() => UserIndexController());
    Get.lazyPut<MainController>(() => MainController());
  }
}
