class Tlyric {
  int? version;
  String? lyric;

  Tlyric({this.version, this.lyric});

  factory Tlyric.fromJson(Map<String, dynamic> json) => Tlyric(
        version: json['version'] as int?,
        lyric: json['lyric'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'version': version,
        'lyric': lyric,
      };
}
