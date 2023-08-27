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

  // 推荐歌单
  Widget _buildRecommendList() {
    return <Widget>[
      for (var i = 0; i < controller.recommendSongs.length; i++)
        SongListWidget(
          imgUrl: controller.recommendSongs[i].picUrl!,
          text: controller.recommendSongs[i].name!,
          playCount: NumberTranslate(controller.recommendSongs[i].playCount!)
              .translate(),
          onTap: controller.onRecommendSongListTap,
          onPlay: controller.onRecommendSongListPlay,
        )
    ]
        .toListView(
          scrollDirection: Axis.horizontal,
        )
        .height(160)
        .paddingHorizontal(AppSpace.listItem)
        .paddingVertical(AppSpace.page)
        .sliverToBoxAdapter();
  }

  // 推荐歌曲
  Widget _buildRecommendSongs() {
    return <Widget>[
      for (var i = 0; i < (controller.recommendNewSongs.length / 3).ceil(); i++)
        <Widget>[
          for (var j = i * 3; j < i * 3 + 3; j++)
            if (j < controller.recommendNewSongs.length)
              NewSongWidget(
                image: controller.recommendNewSongs[j].picUrl!,
                name: controller.recommendNewSongs[j].name!,
                author: controller.recommendNewSongs[j].song!.artists![0].name!,
                album: controller.recommendNewSongs[j].song!.album!.name!,
                onTap: controller.onRecommendNewSongsTap,
              )
            else
              Container(), // 如果超出了列表长度，在这里使用一个空的容器
        ].toColumn(
          mainAxisAlignment: MainAxisAlignment.start,
        ),
    ]
        .toListView(
          scrollDirection: Axis.horizontal,
        )
        .height(260)
        .paddingVertical(AppSpace.page)
        .paddingHorizontal(AppSpace.listItem)
        .sliverToBoxAdapter();
  }

  // 推荐电台
  Widget _buildRecommendDjPrograms() {
    return <Widget>[
      for (var i = 0;
          i < (controller.recommendDjPrograms.length / 3).ceil();
          i++)
        <Widget>[
          for (var j = i * 3; j < i * 3 + 3; j++)
            if (j < controller.recommendDjPrograms.length)
              DjProgramWidget(
                image: controller.recommendDjPrograms[j].picUrl!,
                name: controller.recommendDjPrograms[j].name!,
                copyRight: controller.recommendDjPrograms[j].copywriter!,
                onTap: controller.onRecommendDjProgramTap,
              )
            else
              Container(), // 如果超出了列表长度，在这里使用一个空的容器
        ].toColumn(
          mainAxisAlignment: MainAxisAlignment.start,
        ),
    ]
        .toListView(
          scrollDirection: Axis.horizontal,
        )
        .height(260)
        .paddingHorizontal(AppSpace.listItem)
        .paddingVertical(AppSpace.page)
        .sliverToBoxAdapter();
  }

  // 推荐mv
  Widget _buildRecommendMv() {
    return <Widget>[
      for (var i = 0; i < controller.recommendMvs.length; i++)
        RecommendMvWidget(
          imgUrl: controller.recommendMvs[i].picUrl!,
          name: controller.recommendMvs[i].name!,
          copywrite: controller.recommendMvs[i].copywriter!,
          artistList:
              controller.recommendMvs[i].artists!.map((e) => e.name!).toList(),
          playCount: NumberTranslate(controller.recommendMvs[i].playCount!)
              .translate(),
          onTap: controller.onRecommendMvTap,
          onPlay: controller.onRecommendMvPlay,
        ),
    ]
        .toColumn()
        .paddingHorizontal(AppSpace.listItem)
        .paddingVertical(AppSpace.page)
        .sliverToBoxAdapter();
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
          onTap: controller.onRecommendSongListTapAll,
        ).sliverToBoxAdapter(),
        // 歌单列表
        _buildRecommendList(),

        // 推荐歌曲
        // 标题
        TitleWidget.refresh(
          title: '推荐歌曲',
          onTap: controller.onRecommendNewSongsTapAll,
          onRefresh: controller.onRecommendNewSongsRefresh,
        ).sliverToBoxAdapter(),
        // 歌曲列表
        _buildRecommendSongs(),

        // 推荐电台
        // 标题
        TitleWidget.refresh(
          title: '推荐电台',
          onTap: controller.onRecommendDjProgramTapAll,
          onRefresh: controller.onRecommendDjProgramRefresh,
        ).sliverToBoxAdapter(),
        // 电台列表
        _buildRecommendDjPrograms(),

        // 推荐mv
        // 标题
        TitleWidget.refresh(
          title: '推荐 mv',
          onTap: controller.onRecommendMvTapAll,
          onRefresh: controller.onRecommendMvRefresh,
        ).sliverToBoxAdapter(),
        // 电台列表
        _buildRecommendMv(),
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
                  image:
                      'https://p2.music.126.net/kT4AECoc13oVKLEg_-eFMA==/109951166578436098.jpg',
                  name: '指纹',
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
