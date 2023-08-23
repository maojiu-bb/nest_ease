class SongListModel {
  int? id;
  int? type;
  String? name;
  String? copywriter;
  String? picUrl;
  bool? canDislike;
  int? trackNumberUpdateTime;
  int? playCount;
  int? trackCount;
  bool? highQuality;
  String? alg;

  SongListModel({
    this.id,
    this.type,
    this.name,
    this.copywriter,
    this.picUrl,
    this.canDislike,
    this.trackNumberUpdateTime,
    this.playCount,
    this.trackCount,
    this.highQuality,
    this.alg,
  });

  factory SongListModel.fromJson(Map<String, dynamic> json) => SongListModel(
        id: json['id'] as int?,
        type: json['type'] as int?,
        name: json['name'] as String?,
        copywriter: json['copywriter'] as String?,
        picUrl: json['picUrl'] as String?,
        canDislike: json['canDislike'] as bool?,
        trackNumberUpdateTime: json['trackNumberUpdateTime'] as int?,
        playCount: json['playCount'] as int?,
        trackCount: json['trackCount'] as int?,
        highQuality: json['highQuality'] as bool?,
        alg: json['alg'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'name': name,
        'copywriter': copywriter,
        'picUrl': picUrl,
        'canDislike': canDislike,
        'trackNumberUpdateTime': trackNumberUpdateTime,
        'playCount': playCount,
        'trackCount': trackCount,
        'highQuality': highQuality,
        'alg': alg,
      };
}
