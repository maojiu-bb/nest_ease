import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';

class ConfigService extends GetxService {
  static ConfigService get to => Get.find();

  // 主题
  final RxBool _isDarkModel = Get.isDarkMode.obs;
  bool get isDarkModel => _isDarkModel.value;
  set isDarkModel(bool value) => _isDarkModel.value = value;

  // 是否首次打开
  bool get isAreadyOpen => Storage().getBool(Constants.isAlreadyOpen);

  // 标记已打开
  void setAlreadyOpen() => Storage().setBool(Constants.isAlreadyOpen, true);

  // 初始化 theme
  void initTheme() {
    var stroageTheme = Storage().getString(Constants.storageTheme);
    isDarkModel = stroageTheme == "dark" ? true : false;
    Get.changeTheme(
      stroageTheme == 'dark' ? AppTheme.dark : AppTheme.light,
    );
  }

  // 切换主题
  Future<void> switchTheme() async {
    isDarkModel = !isDarkModel;
    Get.changeTheme(
      isDarkModel == true ? AppTheme.dark : AppTheme.light,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.forceAppUpdate();
    });

    await Storage().setString(
        Constants.storageTheme, isDarkModel == true ? "dark" : "light");
  }

  // 初始化
  Future<ConfigService> init() async {
    initTheme();
    return this;
  }
}
