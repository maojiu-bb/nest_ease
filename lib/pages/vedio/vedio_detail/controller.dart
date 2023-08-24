import 'package:get/get.dart';

class VedioDetailController extends GetxController {
  VedioDetailController();

  _initData() {
    update(["vedio_detail"]);
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
