import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';
import 'package:nestease_cloud_music/pages/index.dart';

// import 'observer.dart';

class RoutePages {
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  // 列表
  static List<GetPage> list = [
    GetPage(
      name: RouteNames.main,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: RouteNames.musicHome,
      page: () => const HomePage(),
    ),
    GetPage(
      name: RouteNames.musicMusicDetail,
      page: () => const MusicDetailPage(),
    ),
    GetPage(
      name: RouteNames.musicMusicList,
      page: () => const MusicListPage(),
    ),
    GetPage(
      name: RouteNames.radioRadioDetail,
      page: () => const RadioDetailPage(),
    ),
    GetPage(
      name: RouteNames.radioRadioIndex,
      page: () => const RadioIndexPage(),
    ),
    GetPage(
      name: RouteNames.searchSearchFilter,
      page: () => const SearchFilterPage(),
    ),
    GetPage(
      name: RouteNames.searchSearchIndex,
      page: () => const SearchIndexPage(),
    ),
    GetPage(
      name: RouteNames.systemLogin,
      page: () => const LoginPage(),
    ),
    // GetPage(
    //   name: RouteNames.systemMain,
    //   page: () => const MainPage(),
    //   binding: MainBinding(),
    // ),
    GetPage(
      name: RouteNames.systemSplash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: RouteNames.systemWelcome,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: RouteNames.userUserDetail,
      page: () => const UserDetailPage(),
    ),
    GetPage(
      name: RouteNames.userUserIndex,
      page: () => const UserIndexPage(),
    ),
  ];
}
