import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';
import 'package:nestease_cloud_music/global.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 屏幕适配
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      splitScreenMode: false,
      minTextAdapt: false,
      builder: (context, child) {
        // 刷新
        return RefreshConfiguration(
          // 刷新头部
          headerBuilder: () => const ClassicHeader(),
          // 刷新尾部
          footerBuilder: () => const ClassicFooter(),
          // 当不满一页隐藏刷新尾部
          hideFooterWhenNotFull: true,
          // 触发刷新距离
          headerTriggerDistance: 80,
          // 最大拖动距离
          maxOverScrollExtent: 100,
          // 触发加载距离
          footerTriggerDistance: 150,
          child: GetMaterialApp(
            title: 'Flutter Demo',

            // hide debuge
            debugShowCheckedModeBanner: false,

            // 过渡动画
            defaultTransition: Transition.rightToLeft,

            // theme
            theme:
                ConfigService.to.isDarkModel ? AppTheme.dark : AppTheme.light,

            // 路由
            initialRoute: RouteNames.systemSplash,
            getPages: RoutePages.list,
            navigatorObservers: [RoutePages.observer],

            builder: (context, widget) {
              // easy loading 初始化
              widget = EasyLoading.init()(context, widget);

              // 不随系统字体缩放比例
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget,
              );
            },
          ),
        );
      },
    );
  }
}
