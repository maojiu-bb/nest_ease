import 'album_meta.dart';
import 'artist.dart';

class OriginSongSimpleData {
  int? songId;
  String? name;
  List<Artist>? artists;
  AlbumMeta? albumMeta;

  OriginSongSimpleData({
    this.songId,
    this.name,
    this.artists,
    this.albumMeta,
  });

  factory OriginSongSimpleData.fromJson(Map<String, dynamic> json) {
    return OriginSongSimpleData(
      songId: json['songId'] as int?,
      name: json['name'] as String?,
      artists: (json['artists'] as List<dynamic>?)
          ?.map((e) => Artist.fromJson(e as Map<String, dynamic>))
          .toList(),
      albumMeta: json['albumMeta'] == null
          ? null
          : AlbumMeta.fromJson(json['albumMeta'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'songId': songId,
        'name': name,
        'artists': artists?.map((e) => e.toJson()).toList(),
        'albumMeta': albumMeta?.toJson(),
      };
}
