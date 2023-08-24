import 'package:nestease_cloud_music/common/index.dart';

class MvApi {
  // 推荐 mv
  static Future<List<RecommendMvModel>> recommendMv() async {
    var res = await DioService.to.get(
      '/personalized/mv',
    );
    List<RecommendMvModel> recommendMvList = [];
    for (var item in res.data['result']) {
      recommendMvList.add(RecommendMvModel.fromJson(item));
    }

    return recommendMvList;
  }
}
