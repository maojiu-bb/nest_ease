import 'package:nestease_cloud_music/common/index.dart';

class MusicApi {
  // 获取轮播图
  static Future<List<SwiperModel>> swiper() async {
    var res = await DioService.to.get(
      '/banner',
    );
    List<SwiperModel> swipers = [];
    for (var item in res.data['banners']) {
      swipers.add(SwiperModel.fromJson(item));
    }
    return swipers;
  }
}
