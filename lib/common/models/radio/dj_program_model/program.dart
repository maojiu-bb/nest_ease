import 'dj.dart';
import 'main_song.dart';
import 'radio.dart';

class Program {
  MainSong? mainSong;
  dynamic songs;
  Dj? dj;
  String? blurCoverUrl;
  Radio? radio;
  int? subscribedCount;
  bool? reward;
  int? mainTrackId;
  int? serialNum;
  int? listenerCount;
  String? name;
  int? id;
  int? createTime;
  String? description;
  int? userId;
  String? coverUrl;
  String? commentThreadId;
  List<String>? channels;
  dynamic titbits;
  dynamic titbitImages;
  int? pubStatus;
  int? trackCount;
  int? bdAuditStatus;
  int? programFeeType;
  bool? buyed;
  dynamic programDesc;
  List<dynamic>? h5Links;
  int? coverId;
  int? adjustedPlayCount;
  bool? canReward;
  int? auditStatus;
  bool? publish;
  int? duration;
  int? shareCount;
  bool? subscribed;
  int? likedCount;
  int? commentCount;
  bool? isPublish;

  Program({
    this.mainSong,
    this.songs,
    this.dj,
    this.blurCoverUrl,
    this.radio,
    this.subscribedCount,
    this.reward,
    this.mainTrackId,
    this.serialNum,
    this.listenerCount,
    this.name,
    this.id,
    this.createTime,
    this.description,
    this.userId,
    this.coverUrl,
    this.commentThreadId,
    this.channels,
    this.titbits,
    this.titbitImages,
    this.pubStatus,
    this.trackCount,
    this.bdAuditStatus,
    this.programFeeType,
    this.buyed,
    this.programDesc,
    this.h5Links,
    this.coverId,
    this.adjustedPlayCount,
    this.canReward,
    this.auditStatus,
    this.publish,
    this.duration,
    this.shareCount,
    this.subscribed,
    this.likedCount,
    this.commentCount,
    this.isPublish,
  });

  factory Program.fromJson(Map<String, dynamic> json) => Program(
        mainSong: json['mainSong'] == null
            ? null
            : MainSong.fromJson(json['mainSong'] as Map<String, dynamic>),
        songs: json['songs'] as dynamic,
        dj: json['dj'] == null
            ? null
            : Dj.fromJson(json['dj'] as Map<String, dynamic>),
        blurCoverUrl: json['blurCoverUrl'] as String?,
        radio: json['radio'] == null
            ? null
            : Radio.fromJson(json['radio'] as Map<String, dynamic>),
        subscribedCount: json['subscribedCount'] as int?,
        reward: json['reward'] as bool?,
        mainTrackId: json['mainTrackId'] as int?,
        serialNum: json['serialNum'] as int?,
        listenerCount: json['listenerCount'] as int?,
        name: json['name'] as String?,
        id: json['id'] as int?,
        createTime: json['createTime'] as int?,
        description: json['description'] as String?,
        userId: json['userId'] as int?,
        coverUrl: json['coverUrl'] as String?,
        commentThreadId: json['commentThreadId'] as String?,
        channels: json['channels']?.cast<String>(),
        titbits: json['titbits'] as dynamic,
        titbitImages: json['titbitImages'] as dynamic,
        pubStatus: json['pubStatus'] as int?,
        trackCount: json['trackCount'] as int?,
        bdAuditStatus: json['bdAuditStatus'] as int?,
        programFeeType: json['programFeeType'] as int?,
        buyed: json['buyed'] as bool?,
        programDesc: json['programDesc'] as dynamic,
        h5Links: json['h5Links'] as List<dynamic>?,
        coverId: json['coverId'] as int?,
        adjustedPlayCount: json['adjustedPlayCount'] as int?,
        canReward: json['canReward'] as bool?,
        auditStatus: json['auditStatus'] as int?,
        publish: json['publish'] as bool?,
        duration: json['duration'] as int?,
        shareCount: json['shareCount'] as int?,
        subscribed: json['subscribed'] as bool?,
        likedCount: json['likedCount'] as int?,
        commentCount: json['commentCount'] as int?,
        isPublish: json['isPublish'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'mainSong': mainSong?.toJson(),
        'songs': songs,
        'dj': dj?.toJson(),
        'blurCoverUrl': blurCoverUrl,
        'radio': radio?.toJson(),
        'subscribedCount': subscribedCount,
        'reward': reward,
        'mainTrackId': mainTrackId,
        'serialNum': serialNum,
        'listenerCount': listenerCount,
        'name': name,
        'id': id,
        'createTime': createTime,
        'description': description,
        'userId': userId,
        'coverUrl': coverUrl,
        'commentThreadId': commentThreadId,
        'channels': channels,
        'titbits': titbits,
        'titbitImages': titbitImages,
        'pubStatus': pubStatus,
        'trackCount': trackCount,
        'bdAuditStatus': bdAuditStatus,
        'programFeeType': programFeeType,
        'buyed': buyed,
        'programDesc': programDesc,
        'h5Links': h5Links,
        'coverId': coverId,
        'adjustedPlayCount': adjustedPlayCount,
        'canReward': canReward,
        'auditStatus': auditStatus,
        'publish': publish,
        'duration': duration,
        'shareCount': shareCount,
        'subscribed': subscribed,
        'likedCount': likedCount,
        'commentCount': commentCount,
        'isPublish': isPublish,
      };
}
