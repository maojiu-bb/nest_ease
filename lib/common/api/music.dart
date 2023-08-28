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

  // 获取推荐歌单
  static Future<List<SongListModel>> songList() async {
    var res = await DioService.to.get(
      '/personalized',
      params: {
        "limit": 6,
      },
    );
    List<SongListModel> songLists = [];
    for (var item in res.data['result']) {
      songLists.add(SongListModel.fromJson(item));
    }
    return songLists;
  }

  // 获取推荐音乐
  static Future<List<SongsModel>> songs() async {
    var res = await DioService.to.get(
      '/personalized/newsong',
    );
    List<SongsModel> songs = [];
    for (var item in res.data['result']) {
      songs.add(SongsModel.fromJson(item));
    }
    return songs;
  }

  // 获取歌单所有歌曲
  static Future<List<SongListMusicModel>> songListMusic(
      SongListRequest req) async {
    var res = await DioService.to.get(
      '/playlist/track/all',
      params: req.toJson(),
    );
    List<SongListMusicModel> musicList = [];
    for (var item in res.data['songs']) {
      musicList.add(SongListMusicModel.fromJson(item));
    }

    return musicList;
  }

  // 获取歌曲详情
  static Future<List<SongDetailModel>> songDetail(int id) async {
    var res = await DioService.to.get(
      '/song/detail',
      params: {'ids': id},
    );
    List<SongDetailModel> detailList = [];
    for (var item in res.data['songs']) {
      detailList.add(SongDetailModel.fromJson(item));
    }
    return detailList;
  }
}
