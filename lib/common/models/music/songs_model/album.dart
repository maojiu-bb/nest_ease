import 'artist.dart';

class Album {
  String? name;
  int? id;
  String? type;
  int? size;
  int? picId;
  String? blurPicUrl;
  int? companyId;
  int? pic;
  String? picUrl;
  int? publishTime;
  String? description;
  String? tags;
  String? company;
  String? briefDesc;
  Artist? artist;
  List<dynamic>? songs;
  List<dynamic>? alias;
  int? status;
  int? copyrightId;
  String? commentThreadId;
  List<Artist>? artists;
  String? subType;
  dynamic transName;
  bool? onSale;
  int? mark;
  int? gapless;
  String? picIdStr;

  Album({
    this.name,
    this.id,
    this.type,
    this.size,
    this.picId,
    this.blurPicUrl,
    this.companyId,
    this.pic,
    this.picUrl,
    this.publishTime,
    this.description,
    this.tags,
    this.company,
    this.briefDesc,
    this.artist,
    this.songs,
    this.alias,
    this.status,
    this.copyrightId,
    this.commentThreadId,
    this.artists,
    this.subType,
    this.transName,
    this.onSale,
    this.mark,
    this.gapless,
    this.picIdStr,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        name: json['name'] as String?,
        id: json['id'] as int?,
        type: json['type'] as String?,
        size: json['size'] as int?,
        picId: json['picId'] as int?,
        blurPicUrl: json['blurPicUrl'] as String?,
        companyId: json['companyId'] as int?,
        pic: json['pic'] as int?,
        picUrl: json['picUrl'] as String?,
        publishTime: json['publishTime'] as int?,
        description: json['description'] as String?,
        tags: json['tags'] as String?,
        company: json['company'] as String?,
        briefDesc: json['briefDesc'] as String?,
        artist: json['artist'] == null
            ? null
            : Artist.fromJson(json['artist'] as Map<String, dynamic>),
        songs: json['songs'] as List<dynamic>?,
        alias: json['alias'] as List<dynamic>?,
        status: json['status'] as int?,
        copyrightId: json['copyrightId'] as int?,
        commentThreadId: json['commentThreadId'] as String?,
        artists: (json['artists'] as List<dynamic>?)
            ?.map((e) => Artist.fromJson(e as Map<String, dynamic>))
            .toList(),
        subType: json['subType'] as String?,
        transName: json['transName'] as dynamic,
        onSale: json['onSale'] as bool?,
        mark: json['mark'] as int?,
        gapless: json['gapless'] as int?,
        picIdStr: json['picId_str'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'type': type,
        'size': size,
        'picId': picId,
        'blurPicUrl': blurPicUrl,
        'companyId': companyId,
        'pic': pic,
        'picUrl': picUrl,
        'publishTime': publishTime,
        'description': description,
        'tags': tags,
        'company': company,
        'briefDesc': briefDesc,
        'artist': artist?.toJson(),
        'songs': songs,
        'alias': alias,
        'status': status,
        'copyrightId': copyrightId,
        'commentThreadId': commentThreadId,
        'artists': artists?.map((e) => e.toJson()).toList(),
        'subType': subType,
        'transName': transName,
        'onSale': onSale,
        'mark': mark,
        'gapless': gapless,
        'picId_str': picIdStr,
      };
}
