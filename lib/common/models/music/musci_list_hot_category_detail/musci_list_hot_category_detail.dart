import 'creator.dart';
import 'subscriber.dart';

class MusciListHotCategoryDetail {
  String? name;
  int? id;
  int? trackNumberUpdateTime;
  int? status;
  int? userId;
  int? createTime;
  int? updateTime;
  int? subscribedCount;
  int? trackCount;
  int? cloudTrackCount;
  String? coverImgUrl;
  dynamic iconImgUrl;
  int? coverImgId;
  String? description;
  List<dynamic>? tags;
  int? playCount;
  int? trackUpdateTime;
  int? specialType;
  int? totalDuration;
  Creator? creator;
  dynamic tracks;
  List<Subscriber>? subscribers;
  bool? subscribed;
  String? commentThreadId;
  bool? newImported;
  int? adType;
  bool? highQuality;
  int? privacy;
  bool? ordered;
  bool? anonimous;
  int? coverStatus;
  dynamic recommendInfo;
  dynamic socialPlaylistCover;
  dynamic recommendText;
  List<String>? coverText;
  String? relateResType;
  dynamic relateResId;
  int? shareCount;
  String? coverImgIdStr;
  String? alg;
  int? commentCount;

  MusciListHotCategoryDetail({
    this.name,
    this.id,
    this.trackNumberUpdateTime,
    this.status,
    this.userId,
    this.createTime,
    this.updateTime,
    this.subscribedCount,
    this.trackCount,
    this.cloudTrackCount,
    this.coverImgUrl,
    this.iconImgUrl,
    this.coverImgId,
    this.description,
    this.tags,
    this.playCount,
    this.trackUpdateTime,
    this.specialType,
    this.totalDuration,
    this.creator,
    this.tracks,
    this.subscribers,
    this.subscribed,
    this.commentThreadId,
    this.newImported,
    this.adType,
    this.highQuality,
    this.privacy,
    this.ordered,
    this.anonimous,
    this.coverStatus,
    this.recommendInfo,
    this.socialPlaylistCover,
    this.recommendText,
    this.coverText,
    this.relateResType,
    this.relateResId,
    this.shareCount,
    this.coverImgIdStr,
    this.alg,
    this.commentCount,
  });

  factory MusciListHotCategoryDetail.fromJson(Map<String, dynamic> json) {
    return MusciListHotCategoryDetail(
      name: json['name'] as String?,
      id: json['id'] as int?,
      trackNumberUpdateTime: json['trackNumberUpdateTime'] as int?,
      status: json['status'] as int?,
      userId: json['userId'] as int?,
      createTime: json['createTime'] as int?,
      updateTime: json['updateTime'] as int?,
      subscribedCount: json['subscribedCount'] as int?,
      trackCount: json['trackCount'] as int?,
      cloudTrackCount: json['cloudTrackCount'] as int?,
      coverImgUrl: json['coverImgUrl'] as String?,
      iconImgUrl: json['iconImgUrl'] as dynamic,
      coverImgId: json['coverImgId'] as int?,
      description: json['description'] as String?,
      tags: json['tags'] as List<dynamic>?,
      playCount: json['playCount'] as int?,
      trackUpdateTime: json['trackUpdateTime'] as int?,
      specialType: json['specialType'] as int?,
      totalDuration: json['totalDuration'] as int?,
      creator: json['creator'] == null
          ? null
          : Creator.fromJson(json['creator'] as Map<String, dynamic>),
      tracks: json['tracks'] as dynamic,
      subscribers: (json['subscribers'] as List<dynamic>?)
          ?.map((e) => Subscriber.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscribed: json['subscribed'] as bool?,
      commentThreadId: json['commentThreadId'] as String?,
      newImported: json['newImported'] as bool?,
      adType: json['adType'] as int?,
      highQuality: json['highQuality'] as bool?,
      privacy: json['privacy'] as int?,
      ordered: json['ordered'] as bool?,
      anonimous: json['anonimous'] as bool?,
      coverStatus: json['coverStatus'] as int?,
      recommendInfo: json['recommendInfo'] as dynamic,
      socialPlaylistCover: json['socialPlaylistCover'] as dynamic,
      recommendText: json['recommendText'] as dynamic,
      coverText: (json['coverText'] as List<dynamic>?)
          ?.map<String>((e) => e.toString())
          .toList(),
      relateResType: json['relateResType'] as String?,
      relateResId: json['relateResId'] as dynamic,
      shareCount: json['shareCount'] as int?,
      coverImgIdStr: json['coverImgId_str'] as String?,
      alg: json['alg'] as String?,
      commentCount: json['commentCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'trackNumberUpdateTime': trackNumberUpdateTime,
        'status': status,
        'userId': userId,
        'createTime': createTime,
        'updateTime': updateTime,
        'subscribedCount': subscribedCount,
        'trackCount': trackCount,
        'cloudTrackCount': cloudTrackCount,
        'coverImgUrl': coverImgUrl,
        'iconImgUrl': iconImgUrl,
        'coverImgId': coverImgId,
        'description': description,
        'tags': tags,
        'playCount': playCount,
        'trackUpdateTime': trackUpdateTime,
        'specialType': specialType,
        'totalDuration': totalDuration,
        'creator': creator?.toJson(),
        'tracks': tracks,
        'subscribers': subscribers?.map((e) => e.toJson()).toList(),
        'subscribed': subscribed,
        'commentThreadId': commentThreadId,
        'newImported': newImported,
        'adType': adType,
        'highQuality': highQuality,
        'privacy': privacy,
        'ordered': ordered,
        'anonimous': anonimous,
        'coverStatus': coverStatus,
        'recommendInfo': recommendInfo,
        'socialPlaylistCover': socialPlaylistCover,
        'recommendText': recommendText,
        'coverText': coverText,
        'relateResType': relateResType,
        'relateResId': relateResId,
        'shareCount': shareCount,
        'coverImgId_str': coverImgIdStr,
        'alg': alg,
        'commentCount': commentCount,
      };
}
