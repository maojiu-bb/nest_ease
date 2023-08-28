import 'free_time_trial_privilege.dart';
import 'free_trial_privilege.dart';

class MusicUrlModel {
  int? id;
  String? url;
  int? br;
  int? size;
  String? md5;
  int? code;
  int? expi;
  String? type;
  double? gain;
  int? peak;
  int? fee;
  dynamic uf;
  int? payed;
  int? flag;
  bool? canExtend;
  dynamic freeTrialInfo;
  String? level;
  String? encodeType;
  FreeTrialPrivilege? freeTrialPrivilege;
  FreeTimeTrialPrivilege? freeTimeTrialPrivilege;
  int? urlSource;
  int? rightSource;
  dynamic podcastCtrp;
  dynamic effectTypes;
  int? time;

  MusicUrlModel({
    this.id,
    this.url,
    this.br,
    this.size,
    this.md5,
    this.code,
    this.expi,
    this.type,
    this.gain,
    this.peak,
    this.fee,
    this.uf,
    this.payed,
    this.flag,
    this.canExtend,
    this.freeTrialInfo,
    this.level,
    this.encodeType,
    this.freeTrialPrivilege,
    this.freeTimeTrialPrivilege,
    this.urlSource,
    this.rightSource,
    this.podcastCtrp,
    this.effectTypes,
    this.time,
  });

  factory MusicUrlModel.fromJson(Map<String, dynamic> json) => MusicUrlModel(
        id: json['id'] as int?,
        url: json['url'] as String?,
        br: json['br'] as int?,
        size: json['size'] as int?,
        md5: json['md5'] as String?,
        code: json['code'] as int?,
        expi: json['expi'] as int?,
        type: json['type'] as String?,
        gain: (json['gain'] as num?)?.toDouble(),
        peak: json['peak'] as int?,
        fee: json['fee'] as int?,
        uf: json['uf'] as dynamic,
        payed: json['payed'] as int?,
        flag: json['flag'] as int?,
        canExtend: json['canExtend'] as bool?,
        freeTrialInfo: json['freeTrialInfo'] as dynamic,
        level: json['level'] as String?,
        encodeType: json['encodeType'] as String?,
        freeTrialPrivilege: json['freeTrialPrivilege'] == null
            ? null
            : FreeTrialPrivilege.fromJson(
                json['freeTrialPrivilege'] as Map<String, dynamic>),
        freeTimeTrialPrivilege: json['freeTimeTrialPrivilege'] == null
            ? null
            : FreeTimeTrialPrivilege.fromJson(
                json['freeTimeTrialPrivilege'] as Map<String, dynamic>),
        urlSource: json['urlSource'] as int?,
        rightSource: json['rightSource'] as int?,
        podcastCtrp: json['podcastCtrp'] as dynamic,
        effectTypes: json['effectTypes'] as dynamic,
        time: json['time'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'url': url,
        'br': br,
        'size': size,
        'md5': md5,
        'code': code,
        'expi': expi,
        'type': type,
        'gain': gain,
        'peak': peak,
        'fee': fee,
        'uf': uf,
        'payed': payed,
        'flag': flag,
        'canExtend': canExtend,
        'freeTrialInfo': freeTrialInfo,
        'level': level,
        'encodeType': encodeType,
        'freeTrialPrivilege': freeTrialPrivilege?.toJson(),
        'freeTimeTrialPrivilege': freeTimeTrialPrivilege?.toJson(),
        'urlSource': urlSource,
        'rightSource': rightSource,
        'podcastCtrp': podcastCtrp,
        'effectTypes': effectTypes,
        'time': time,
      };
}
