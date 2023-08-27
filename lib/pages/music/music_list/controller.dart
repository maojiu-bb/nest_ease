import 'package:get/get.dart';

class MusicListController extends GetxController {
  MusicListController();

  // 获取歌单信息
  final songList = Get.arguments['songList'];
  // appbar title
  final title = Get.arguments['appbar_title'];

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
