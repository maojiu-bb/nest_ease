import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';
import 'package:nestease_cloud_music/pages/index.dart';

class PlaybarController extends GetxController {
  PlaybarController();

  // 更改播放
  void onPlayChanged() {
    if (AudioPlayerService.to.isPlaying.value == true) {
      AudioPlayerService.to.pauseMusic();
    } else {
      AudioPlayerService.to.continueMusic();
    }
  }

  // 前往详情
  void onDetailTap() {
    Get.to(
      () => const MusicDetailPage(),
      transition: Transition.downToUp,
      arguments: {
        'id': AudioPlayerService.to.songDetail[0].id,
      },
    );
  }

  initData() {
    update(["playbar"]);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
