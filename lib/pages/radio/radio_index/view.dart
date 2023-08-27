import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';

import 'index.dart';

class RadioIndexPage extends GetView<RadioIndexController> {
  const RadioIndexPage({Key? key}) : super(key: key);

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
        hintText: '聆听新声音',
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
            id: 'radio_swiper',
            builder: (_) {
              return CarouselWidget(
                // onTap: controller.onBannerTap,
                onTap: controller.onBannerTap,
                items: controller.swiper.map((e) {
                  return KeyValueModel(
                    key: e.typeTitle!,
                    value: e.pic,
                  );
                }).toList(),
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

  // 分类列表
  Widget _buildCategories() {
    return <Widget>[
      for (var i = 0; i < controller.categoryList.length; i++)
        RadioCategoryListItemWidget(
          category: controller.categoryList[i],
          onTap: (categoryId) => controller.onCategoryTap(categoryId),
        ).paddingRight(AppSpace.listItem)
    ]
        .toListView(
          scrollDirection: Axis.horizontal,
        )
        .height(90.w)
        .paddingVertical(AppSpace.listRow)
        .sliverToBoxAdapter()
        .sliverPaddingHorizontal(AppSpace.page);
  }

  // 主视图
  Widget _buildView() {
    return CustomScrollView(
      slivers: [
        // 轮播图
        _buildBanner(),

        // 分类
        _buildCategories(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RadioIndexController>(
      init: RadioIndexController(),
      id: "radio_index",
      builder: (_) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: Stack(
            children: [
              SafeArea(
                child: _buildView(),
              ),

              // 固定在底部的 PlayWidget
              Positioned(
                left: 0,
                right: 0,
                bottom: 90,
                child: PlayWidget(
                  image: 'image',
                  name: 'name',
                  onPlay: () => {},
                  onNext: () => {},
                  onPrevious: () => {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
