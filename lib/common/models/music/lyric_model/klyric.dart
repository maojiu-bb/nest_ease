class Klyric {
  int? version;
  String? lyric;

  Klyric({this.version, this.lyric});

  factory Klyric.fromJson(Map<String, dynamic> json) => Klyric(
        version: json['version'] as int?,
        lyric: json['lyric'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'version': version,
        'lyric': lyric,
      };
}
