class HMusic {
  dynamic name;
  int? id;
  int? size;
  String? extension;
  int? sr;
  int? dfsId;
  int? bitrate;
  int? playTime;
  int? volumeDelta;

  HMusic({
    this.name,
    this.id,
    this.size,
    this.extension,
    this.sr,
    this.dfsId,
    this.bitrate,
    this.playTime,
    this.volumeDelta,
  });

  factory HMusic.fromJson(Map<String, dynamic> json) => HMusic(
        name: json['name'] as dynamic,
        id: json['id'] as int?,
        size: json['size'] as int?,
        extension: json['extension'] as String?,
        sr: json['sr'] as int?,
        dfsId: json['dfsId'] as int?,
        bitrate: json['bitrate'] as int?,
        playTime: json['playTime'] as int?,
        volumeDelta: json['volumeDelta'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'size': size,
        'extension': extension,
        'sr': sr,
        'dfsId': dfsId,
        'bitrate': bitrate,
        'playTime': playTime,
        'volumeDelta': volumeDelta,
      };
}