// 格式化歌词

class LyricFormate {
  final String lyric;

  LyricFormate({required this.lyric});

  String removeTime() {
    var reg = RegExp(r'\[\d+:\d+\.\d+\]');

    return lyric.replaceAll(reg, '');
  }
}
