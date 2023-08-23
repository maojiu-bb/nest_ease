import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';

class WelcomeController extends GetxController {
  WelcomeController();

  List<WelcomeModel>? items;

  // 当前位置
  int currentIndex = 0;

  bool isShowStart = false; // 是否显示 Start
  CarouselController carouselController = CarouselController(); // slider 控制器

  // 当前位置发生改变
  void onPageChanged(int index) {
    currentIndex = index;
    isShowStart = currentIndex == 2;
    update(['slider', 'bar']);
  }

  // 去首页
  void onToMain() {
    Get.offAllNamed(RouteNames.main);
  }

  // 下一个
  void onNext() {
    carouselController.nextPage();
  }

  _initData() {
    // 模拟数据
    items = [
      WelcomeModel(
        title: '欢迎使用 NestEase',
        desc: 'NestEase 是一个专业的音乐分享平台，让你随时随地随心的分享你的音乐。',
        image: AssetsImages.welcomeJpg,
      ),
      WelcomeModel(
        title: '感谢选择 NestEase',
        desc: 'NestEase 提供了丰富的音乐资源和优质的用户体验，希望您享受到最好的音乐体验。',
        image: AssetsImages.welcomeJpg,
      ),
      WelcomeModel(
        title: '开始发现音乐的乐趣',
        desc: '在 NestEase 上，您可以发现新的音乐、创建歌单、与他人分享您喜欢的音乐。',
        image: AssetsImages.welcomeJpg,
      )
    ];

    update(["welcome"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    // 设置已打开

    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
