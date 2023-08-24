import 'package:nestease_cloud_music/common/index.dart';
import 'package:nestease_cloud_music/common/models/music/djprogram_model/djprogram_model.dart';

class RadioApi {
  // 推荐电台
  Future<List<DjprogramModel>> recommendDjProgram() async {
    var res = await DioService.to.get(
      '/personalized/djprogram',
    );
    List<DjprogramModel> recommendDjProgramList = [];
    for (var item in res.data['result']) {
      recommendDjProgramList.add(DjprogramModel.fromJson(item));
    }

    return recommendDjProgramList;
  }
}
