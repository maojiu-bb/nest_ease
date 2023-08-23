class SwiperModel {
  String? imageUrl;
  int? targetId;
  dynamic adid;
  int? targetType;
  String? titleColor;
  String? typeTitle;
  dynamic url;
  bool? exclusive;
  dynamic monitorImpress;
  dynamic monitorClick;
  dynamic monitorType;
  dynamic monitorImpressList;
  dynamic monitorClickList;
  dynamic monitorBlackList;
  dynamic extMonitor;
  dynamic extMonitorInfo;
  dynamic adSource;
  dynamic adLocation;
  dynamic adDispatchJson;
  String? encodeId;
  dynamic program;
  dynamic event;
  dynamic video;
  dynamic song;
  String? scm;
  String? bannerBizType;

  SwiperModel({
    this.imageUrl,
    this.targetId,
    this.adid,
    this.targetType,
    this.titleColor,
    this.typeTitle,
    this.url,
    this.exclusive,
    this.monitorImpress,
    this.monitorClick,
    this.monitorType,
    this.monitorImpressList,
    this.monitorClickList,
    this.monitorBlackList,
    this.extMonitor,
    this.extMonitorInfo,
    this.adSource,
    this.adLocation,
    this.adDispatchJson,
    this.encodeId,
    this.program,
    this.event,
    this.video,
    this.song,
    this.scm,
    this.bannerBizType,
  });

  factory SwiperModel.fromJson(Map<String, dynamic> json) => SwiperModel(
        imageUrl: json['imageUrl'] as String?,
        targetId: json['targetId'] as int?,
        adid: json['adid'] as dynamic,
        targetType: json['targetType'] as int?,
        titleColor: json['titleColor'] as String?,
        typeTitle: json['typeTitle'] as String?,
        url: json['url'] as dynamic,
        exclusive: json['exclusive'] as bool?,
        monitorImpress: json['monitorImpress'] as dynamic,
        monitorClick: json['monitorClick'] as dynamic,
        monitorType: json['monitorType'] as dynamic,
        monitorImpressList: json['monitorImpressList'] as dynamic,
        monitorClickList: json['monitorClickList'] as dynamic,
        monitorBlackList: json['monitorBlackList'] as dynamic,
        extMonitor: json['extMonitor'] as dynamic,
        extMonitorInfo: json['extMonitorInfo'] as dynamic,
        adSource: json['adSource'] as dynamic,
        adLocation: json['adLocation'] as dynamic,
        adDispatchJson: json['adDispatchJson'] as dynamic,
        encodeId: json['encodeId'] as String?,
        program: json['program'] as dynamic,
        event: json['event'] as dynamic,
        video: json['video'] as dynamic,
        song: json['song'] as dynamic,
        scm: json['scm'] as String?,
        bannerBizType: json['bannerBizType'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'imageUrl': imageUrl,
        'targetId': targetId,
        'adid': adid,
        'targetType': targetType,
        'titleColor': titleColor,
        'typeTitle': typeTitle,
        'url': url,
        'exclusive': exclusive,
        'monitorImpress': monitorImpress,
        'monitorClick': monitorClick,
        'monitorType': monitorType,
        'monitorImpressList': monitorImpressList,
        'monitorClickList': monitorClickList,
        'monitorBlackList': monitorBlackList,
        'extMonitor': extMonitor,
        'extMonitorInfo': extMonitorInfo,
        'adSource': adSource,
        'adLocation': adLocation,
        'adDispatchJson': adDispatchJson,
        'encodeId': encodeId,
        'program': program,
        'event': event,
        'video': video,
        'song': song,
        'scm': scm,
        'bannerBizType': bannerBizType,
      };
}
