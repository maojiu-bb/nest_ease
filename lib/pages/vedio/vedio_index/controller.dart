import 'package:get/get.dart';

class VedioIndexController extends GetxController {
  VedioIndexController();

  _initData() {
    update(["vedio_index"]);
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
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
