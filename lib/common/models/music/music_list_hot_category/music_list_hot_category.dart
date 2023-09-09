import 'playlist_tag.dart';

class MusicListHotCategory {
  PlaylistTag? playlistTag;
  bool? activity;
  bool? hot;
  int? usedCount;
  int? createTime;
  int? position;
  int? category;
  String? name;
  int? id;
  int? type;

  MusicListHotCategory({
    this.playlistTag,
    this.activity,
    this.hot,
    this.usedCount,
    this.createTime,
    this.position,
    this.category,
    this.name,
    this.id,
    this.type,
  });

  factory MusicListHotCategory.fromJson(Map<String, dynamic> json) {
    return MusicListHotCategory(
      playlistTag: json['playlistTag'] == null
          ? null
          : PlaylistTag.fromJson(json['playlistTag'] as Map<String, dynamic>),
      activity: json['activity'] as bool?,
      hot: json['hot'] as bool?,
      usedCount: json['usedCount'] as int?,
      createTime: json['createTime'] as int?,
      position: json['position'] as int?,
      category: json['category'] as int?,
      name: json['name'] as String?,
      id: json['id'] as int?,
      type: json['type'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'playlistTag': playlistTag?.toJson(),
        'activity': activity,
        'hot': hot,
        'usedCount': usedCount,
        'createTime': createTime,
        'position': position,
        'category': category,
        'name': name,
        'id': id,
        'type': type,
      };
}
