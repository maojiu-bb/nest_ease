import 'charge_info_list.dart';
import 'free_trial_privilege.dart';

class Privilege {
  int? id;
  int? fee;
  int? payed;
  int? st;
  int? pl;
  int? dl;
  int? sp;
  int? cp;
  int? subp;
  bool? cs;
  int? maxbr;
  int? fl;
  bool? toast;
  int? flag;
  bool? preSell;
  int? playMaxbr;
  int? downloadMaxbr;
  String? maxBrLevel;
  String? playMaxBrLevel;
  String? downloadMaxBrLevel;
  String? plLevel;
  String? dlLevel;
  String? flLevel;
  dynamic rscl;
  FreeTrialPrivilege? freeTrialPrivilege;
  List<ChargeInfoList>? chargeInfoList;

  Privilege({
    this.id,
    this.fee,
    this.payed,
    this.st,
    this.pl,
    this.dl,
    this.sp,
    this.cp,
    this.subp,
    this.cs,
    this.maxbr,
    this.fl,
    this.toast,
    this.flag,
    this.preSell,
    this.playMaxbr,
    this.downloadMaxbr,
    this.maxBrLevel,
    this.playMaxBrLevel,
    this.downloadMaxBrLevel,
    this.plLevel,
    this.dlLevel,
    this.flLevel,
    this.rscl,
    this.freeTrialPrivilege,
    this.chargeInfoList,
  });

  factory Privilege.fromJson(Map<String, dynamic> json) => Privilege(
        id: json['id'] as int?,
        fee: json['fee'] as int?,
        payed: json['payed'] as int?,
        st: json['st'] as int?,
        pl: json['pl'] as int?,
        dl: json['dl'] as int?,
        sp: json['sp'] as int?,
        cp: json['cp'] as int?,
        subp: json['subp'] as int?,
        cs: json['cs'] as bool?,
        maxbr: json['maxbr'] as int?,
        fl: json['fl'] as int?,
        toast: json['toast'] as bool?,
        flag: json['flag'] as int?,
        preSell: json['preSell'] as bool?,
        playMaxbr: json['playMaxbr'] as int?,
        downloadMaxbr: json['downloadMaxbr'] as int?,
        maxBrLevel: json['maxBrLevel'] as String?,
        playMaxBrLevel: json['playMaxBrLevel'] as String?,
        downloadMaxBrLevel: json['downloadMaxBrLevel'] as String?,
        plLevel: json['plLevel'] as String?,
        dlLevel: json['dlLevel'] as String?,
        flLevel: json['flLevel'] as String?,
        rscl: json['rscl'] as dynamic,
        freeTrialPrivilege: json['freeTrialPrivilege'] == null
            ? null
            : FreeTrialPrivilege.fromJson(
                json['freeTrialPrivilege'] as Map<String, dynamic>),
        chargeInfoList: (json['chargeInfoList'] as List<dynamic>?)
            ?.map((e) => ChargeInfoList.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'fee': fee,
        'payed': payed,
        'st': st,
        'pl': pl,
        'dl': dl,
        'sp': sp,
        'cp': cp,
        'subp': subp,
        'cs': cs,
        'maxbr': maxbr,
        'fl': fl,
        'toast': toast,
        'flag': flag,
        'preSell': preSell,
        'playMaxbr': playMaxbr,
        'downloadMaxbr': downloadMaxbr,
        'maxBrLevel': maxBrLevel,
        'playMaxBrLevel': playMaxBrLevel,
        'downloadMaxBrLevel': downloadMaxBrLevel,
        'plLevel': plLevel,
        'dlLevel': dlLevel,
        'flLevel': flLevel,
        'rscl': rscl,
        'freeTrialPrivilege': freeTrialPrivilege?.toJson(),
        'chargeInfoList': chargeInfoList?.map((e) => e.toJson()).toList(),
      };
}
