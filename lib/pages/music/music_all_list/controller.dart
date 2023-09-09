import 'package:get/get.dart';

class MusicAllListController extends GetxController {
  MusicAllListController();

  _initData() {
    update(["music_all_list"]);
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
