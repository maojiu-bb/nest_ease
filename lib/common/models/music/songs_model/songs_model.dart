import 'song.dart';

class SongsModel {
  int? id;
  int? type;
  String? name;
  dynamic copywriter;
  String? picUrl;
  bool? canDislike;
  dynamic trackNumberUpdateTime;
  Song? song;
  String? alg;

  SongsModel({
    this.id,
    this.type,
    this.name,
    this.copywriter,
    this.picUrl,
    this.canDislike,
    this.trackNumberUpdateTime,
    this.song,
    this.alg,
  });

  factory SongsModel.fromJson(Map<String, dynamic> json) => SongsModel(
        id: json['id'] as int?,
        type: json['type'] as int?,
        name: json['name'] as String?,
        copywriter: json['copywriter'] as dynamic,
        picUrl: json['picUrl'] as String?,
        canDislike: json['canDislike'] as bool?,
        trackNumberUpdateTime: json['trackNumberUpdateTime'] as dynamic,
        song: json['song'] == null
            ? null
            : Song.fromJson(json['song'] as Map<String, dynamic>),
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
        'song': song?.toJson(),
        'alg': alg,
      };
}
