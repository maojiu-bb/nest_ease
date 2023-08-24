import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nestease_cloud_music/common/index.dart';

import 'index.dart';

class RadioIndexPage extends GetView<RadioIndexController> {
  const RadioIndexPage({Key? key}) : super(key: key);

  // 轮播图
  Widget _buildBanner<HomeController>() {
    return GetBuilder(
            init: controller,
            id: 'radio_swiper',
            builder: (_) {
              return CarouselWidget(
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

  // 主视图
  Widget _buildView() {
    return CustomScrollView(
      slivers: [
        // 轮播图
        _buildBanner(),
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
          // appBar: AppBar(title: const Text("radio_index")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
