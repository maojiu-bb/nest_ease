class Lrc {
  int? version;
  String? lyric;

  Lrc({this.version, this.lyric});

  factory Lrc.fromJson(Map<String, dynamic> json) => Lrc(
        version: json['version'] as int?,
        lyric: json['lyric'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'version': version,
        'lyric': lyric,
      };
}
