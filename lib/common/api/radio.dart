import 'package:nestease_cloud_music/common/index.dart';

class RadioApi {
  // 推荐电台
  static Future<List<DjProgramModel>> recommendDjProgram() async {
    var res = await DioService.to.get(
      '/personalized/djprogram',
    );
    List<DjProgramModel> recommendDjProgramList = [];
    for (var item in res.data['result']) {
      recommendDjProgramList.add(DjProgramModel.fromJson(item));
    }

    return recommendDjProgramList;
  }

  // 电台banner
  static Future<List<SwiperRadioModel>> swiperRadio() async {
    var res = await DioService.to.get(
      '/dj/banner',
    );
    List<SwiperRadioModel> swiperRadioList = [];
    for (var item in res.data['data']) {
      swiperRadioList.add(SwiperRadioModel.fromJson(item));
    }

    return swiperRadioList;
  }
}
