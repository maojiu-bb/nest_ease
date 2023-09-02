// 格式化歌词

class LyricFormate {
  final String lyric;

  LyricFormate({required this.lyric});

  String removeTime() {
    var reg = RegExp(r'\[\d+:\d+\.\d+\]');

    return lyric.replaceAll(reg, '');
  }

  List toList() {
    List lines = lyric.split('\n');
    List lyricList = [];

    for (String line in lines) {
      if (line.isNotEmpty) {
        RegExp timeRegExp = RegExp(r'\[(\d+:\d+\.\d+)\]');
        Match? match = timeRegExp.firstMatch(line);

        if (match != null) {
          String? timeString = match.group(1);
          String minutes = timeString!.split(':')[0].padLeft(2, '0');
          String seconds =
              timeString.split(':')[1].split('.')[0].padLeft(2, '0');
          String milliseconds =
              timeString.split(':')[1].split('.')[1].padLeft(3, '0');

          String time = '$minutes:$seconds:$milliseconds';

          String lyricString = line.replaceFirst(timeRegExp, '').trim();
          lyricList.add({
            'time': time,
            'lyric': lyricString,
          });
        }
      }
    }

    return lyricList;
  }
}
