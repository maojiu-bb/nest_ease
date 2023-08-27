import 'package:get/get.dart';

class MusicDetailController extends GetxController {
  MusicDetailController();

  // 歌词
  void onLyrics() {}

  // 分享
  void onShare() {}

  // 显示更多详情
  void onMoreDetail() {}

  _initData() {
    update(["music_detail"]);
  }

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
