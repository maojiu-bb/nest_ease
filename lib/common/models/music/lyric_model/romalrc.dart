class Romalrc {
  int? version;
  String? lyric;

  Romalrc({this.version, this.lyric});

  factory Romalrc.fromJson(Map<String, dynamic> json) => Romalrc(
        version: json['version'] as int?,
        lyric: json['lyric'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'version': version,
        'lyric': lyric,
      };
}
