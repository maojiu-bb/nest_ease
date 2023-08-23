import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';

import 'index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  // appbar
  AppBar _buildAppBar() {
    return AppBar(
      // 背景透明
      backgroundColor: Colors.transparent,
      // 取消阴影
      elevation: 0,
      // 标题栏左侧间距
      titleSpacing: AppSpace.listItem,
      // 搜索栏
      title: InputWidget.search(
        // 提示文字，多语言
        hintText: '发现新音乐',
        // 点击事件
        onTap: controller.onAppBarTap,
        // 只读
        readOnly: true,
      ),
      // 右侧的按钮区
      actions: [
        // 图标
        IconWidget.svg(
          AssetsSvgs.yuyingSvg,
          size: 20,
          isDot: true, // 未读消息 小圆点
        )
            .unconstrained() // 去掉约束, appBar 会有个约束下来
            .padding(
              left: AppSpace.listItem,
              right: AppSpace.page,
            ),
      ],
    );
  }

  // 轮播图
  Widget _buildBanner<HomeController>() {
    return GetBuilder(
            init: controller,
            id: 'home_swiper',
            builder: (_) {
              return CarouselWidget(
                items: controller.swiperItems,
                currentIndex: controller.swiperCurrentIndex,
                onPageChanged: controller.onChangeBanner,
                height: 135.w,
                indicatorCircle: false,
                indicatorColor: Colors.black,
              );
            })
        .clipRRect(all: AppSpace.button)
        .sliverToBoxAdapter()
        .sliverPaddingHorizontal(AppSpace.page);
  }

  // 图标按钮
  Widget _buildIconButtons<HomeController>() {
    return GetBuilder(
      init: controller,
      id: 'home_icon_buttons',
      builder: (_) {
        return <Widget>[
          for (var i = 0; i < controller.categoryItems.length; i++)
            CategoryListItemWidget(
              category: controller.categoryItems[i],
              onTap: (categoryId) => controller.onCategoryTap(categoryId),
            ).paddingRight(AppSpace.listItem)
        ]
            .toRow(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            )
            .height(65.w)
            .sliverToBoxAdapter()
            .sliverPaddingHorizontal(AppSpace.page);
      },
    );
  }

  // 主视图
  Widget _buildView() {
    return CustomScrollView(
      slivers: [
        // 轮播图
        _buildBanner(),

        // 图标按钮
        _buildIconButtons(),

        // 推荐歌单
        // 标题
        TitleWidget.primary(
          title: '推荐歌单',
          onTap: () => print('tap'),
        ).sliverToBoxAdapter(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: Get.find<HomeController>(),
      id: "home",
      builder: (_) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
