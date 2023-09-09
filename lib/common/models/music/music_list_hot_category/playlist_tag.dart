class PlaylistTag {
  int? id;
  String? name;
  int? category;
  int? usedCount;
  int? type;
  int? position;
  int? createTime;
  int? highQuality;
  int? highQualityPos;
  int? officialPos;

  PlaylistTag({
    this.id,
    this.name,
    this.category,
    this.usedCount,
    this.type,
    this.position,
    this.createTime,
    this.highQuality,
    this.highQualityPos,
    this.officialPos,
  });

  factory PlaylistTag.fromJson(Map<String, dynamic> json) => PlaylistTag(
        id: json['id'] as int?,
        name: json['name'] as String?,
        category: json['category'] as int?,
        usedCount: json['usedCount'] as int?,
        type: json['type'] as int?,
        position: json['position'] as int?,
        createTime: json['createTime'] as int?,
        highQuality: json['highQuality'] as int?,
        highQualityPos: json['highQualityPos'] as int?,
        officialPos: json['officialPos'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'usedCount': usedCount,
        'type': type,
        'position': position,
        'createTime': createTime,
        'highQuality': highQuality,
        'highQualityPos': highQualityPos,
        'officialPos': officialPos,
      };
}
