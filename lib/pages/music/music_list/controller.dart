import 'package:get/get.dart';

class MusicListController extends GetxController {
  MusicListController();

  _initData() {
    update(["music_list"]);
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
