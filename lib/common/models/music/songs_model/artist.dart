class Artist {
  String? name;
  int? id;
  int? picId;
  int? img1v1Id;
  String? briefDesc;
  String? picUrl;
  String? img1v1Url;
  int? albumSize;
  List<dynamic>? alias;
  String? trans;
  int? musicSize;
  int? topicPerson;

  Artist({
    this.name,
    this.id,
    this.picId,
    this.img1v1Id,
    this.briefDesc,
    this.picUrl,
    this.img1v1Url,
    this.albumSize,
    this.alias,
    this.trans,
    this.musicSize,
    this.topicPerson,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        name: json['name'] as String?,
        id: json['id'] as int?,
        picId: json['picId'] as int?,
        img1v1Id: json['img1v1Id'] as int?,
        briefDesc: json['briefDesc'] as String?,
        picUrl: json['picUrl'] as String?,
        img1v1Url: json['img1v1Url'] as String?,
        albumSize: json['albumSize'] as int?,
        alias: json['alias'] as List<dynamic>?,
        trans: json['trans'] as String?,
        musicSize: json['musicSize'] as int?,
        topicPerson: json['topicPerson'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'picId': picId,
        'img1v1Id': img1v1Id,
        'briefDesc': briefDesc,
        'picUrl': picUrl,
        'img1v1Url': img1v1Url,
        'albumSize': albumSize,
        'alias': alias,
        'trans': trans,
        'musicSize': musicSize,
        'topicPerson': topicPerson,
      };
}
