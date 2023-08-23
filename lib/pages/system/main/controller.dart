import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  MainController();

  // 页面管理
  final PageController pageController = PageController();

  // 当前 tab index
  int currentIndex = 0;

  // 导航栏切换
  void onChangeIndex(int index) {
    currentIndex = index;

    update(['navigation']);
  }

  // 切换页面
  void onJumpToPage(int page) {
    pageController.jumpToPage(page);
  }

  _initData() {
    update(["main"]);
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

  @override
  void onClose() {
    super.onClose();

    // 控制器释放
    pageController.dispose();
  }
}
