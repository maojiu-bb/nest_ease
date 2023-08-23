import 'package:get/get.dart';

class MusicDetailController extends GetxController {
  MusicDetailController();

  _initData() {
    update(["music_detail"]);
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
