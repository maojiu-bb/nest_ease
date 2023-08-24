import 'artist.dart';

class RecommendMvModel {
  int? id;
  int? type;
  String? name;
  String? copywriter;
  String? picUrl;
  bool? canDislike;
  dynamic trackNumberUpdateTime;
  int? duration;
  int? playCount;
  bool? subed;
  List<Artist>? artists;
  String? artistName;
  int? artistId;
  String? alg;

  RecommendMvModel({
    this.id,
    this.type,
    this.name,
    this.copywriter,
    this.picUrl,
    this.canDislike,
    this.trackNumberUpdateTime,
    this.duration,
    this.playCount,
    this.subed,
    this.artists,
    this.artistName,
    this.artistId,
    this.alg,
  });

  factory RecommendMvModel.fromJson(Map<String, dynamic> json) {
    return RecommendMvModel(
      id: json['id'] as int?,
      type: json['type'] as int?,
      name: json['name'] as String?,
      copywriter: json['copywriter'] as String?,
      picUrl: json['picUrl'] as String?,
      canDislike: json['canDislike'] as bool?,
      trackNumberUpdateTime: json['trackNumberUpdateTime'] as dynamic,
      duration: json['duration'] as int?,
      playCount: json['playCount'] as int?,
      subed: json['subed'] as bool?,
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => Artist.fromJson(e as Map<String, dynamic>))
          .toList(),
      artistName: json['artistName'] as String?,
      artistId: json['artistId'] as int?,
      alg: json['alg'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'name': name,
        'copywriter': copywriter,
        'picUrl': picUrl,
        'canDislike': canDislike,
        'trackNumberUpdateTime': trackNumberUpdateTime,
        'duration': duration,
        'playCount': playCount,
        'subed': subed,
        'artists': artists?.map((e) => e.toJson()).toList(),
        'artistName': artistName,
        'artistId': artistId,
        'alg': alg,
      };
}
