import 'al.dart';
import 'ar.dart';
import 'h.dart';
import 'l.dart';
import 'm.dart';
import 'sq.dart';

class SongListMusicModel {
  String? name;
  int? id;
  int? pst;
  int? t;
  List<Ar>? ar;
  List<dynamic>? alia;
  int? pop;
  int? st;
  String? rt;
  int? fee;
  int? v;
  dynamic crbt;
  String? cf;
  Al? al;
  int? dt;
  H? h;
  M? m;
  L? l;
  Sq? sq;
  dynamic hr;
  dynamic a;
  String? cd;
  int? no;
  dynamic rtUrl;
  int? ftype;
  List<dynamic>? rtUrls;
  int? djId;
  int? copyright;
  int? sId;
  int? mark;
  int? originCoverType;
  dynamic originSongSimpleData;
  dynamic tagPicList;
  bool? resourceState;
  int? version;
  dynamic songJumpInfo;
  dynamic entertainmentTags;
  dynamic awardTags;
  int? single;
  dynamic noCopyrightRcmd;
  int? rtype;
  dynamic rurl;
  int? mst;
  int? cp;
  int? mv;
  int? publishTime;

  SongListMusicModel({
    this.name,
    this.id,
    this.pst,
    this.t,
    this.ar,
    this.alia,
    this.pop,
    this.st,
    this.rt,
    this.fee,
    this.v,
    this.crbt,
    this.cf,
    this.al,
    this.dt,
    this.h,
    this.m,
    this.l,
    this.sq,
    this.hr,
    this.a,
    this.cd,
    this.no,
    this.rtUrl,
    this.ftype,
    this.rtUrls,
    this.djId,
    this.copyright,
    this.sId,
    this.mark,
    this.originCoverType,
    this.originSongSimpleData,
    this.tagPicList,
    this.resourceState,
    this.version,
    this.songJumpInfo,
    this.entertainmentTags,
    this.awardTags,
    this.single,
    this.noCopyrightRcmd,
    this.rtype,
    this.rurl,
    this.mst,
    this.cp,
    this.mv,
    this.publishTime,
  });

  factory SongListMusicModel.fromJson(Map<String, dynamic> json) {
    return SongListMusicModel(
      name: json['name'] as String?,
      id: json['id'] as int?,
      pst: json['pst'] as int?,
      t: json['t'] as int?,
      ar: (json['ar'] as List<dynamic>?)
          ?.map((e) => Ar.fromJson(e as Map<String, dynamic>))
          .toList(),
      alia: json['alia'] as List<dynamic>?,
      pop: json['pop'] as int?,
      st: json['st'] as int?,
      rt: json['rt'] as String?,
      fee: json['fee'] as int?,
      v: json['v'] as int?,
      crbt: json['crbt'] as dynamic,
      cf: json['cf'] as String?,
      al: json['al'] == null
          ? null
          : Al.fromJson(json['al'] as Map<String, dynamic>),
      dt: json['dt'] as int?,
      h: json['h'] == null
          ? null
          : H.fromJson(json['h'] as Map<String, dynamic>),
      m: json['m'] == null
          ? null
          : M.fromJson(json['m'] as Map<String, dynamic>),
      l: json['l'] == null
          ? null
          : L.fromJson(json['l'] as Map<String, dynamic>),
      sq: json['sq'] == null
          ? null
          : Sq.fromJson(json['sq'] as Map<String, dynamic>),
      hr: json['hr'] as dynamic,
      a: json['a'] as dynamic,
      cd: json['cd'] as String?,
      no: json['no'] as int?,
      rtUrl: json['rtUrl'] as dynamic,
      ftype: json['ftype'] as int?,
      rtUrls: json['rtUrls'] as List<dynamic>?,
      djId: json['djId'] as int?,
      copyright: json['copyright'] as int?,
      sId: json['s_id'] as int?,
      mark: json['mark'] as int?,
      originCoverType: json['originCoverType'] as int?,
      originSongSimpleData: json['originSongSimpleData'] as dynamic,
      tagPicList: json['tagPicList'] as dynamic,
      resourceState: json['resourceState'] as bool?,
      version: json['version'] as int?,
      songJumpInfo: json['songJumpInfo'] as dynamic,
      entertainmentTags: json['entertainmentTags'] as dynamic,
      awardTags: json['awardTags'] as dynamic,
      single: json['single'] as int?,
      noCopyrightRcmd: json['noCopyrightRcmd'] as dynamic,
      rtype: json['rtype'] as int?,
      rurl: json['rurl'] as dynamic,
      mst: json['mst'] as int?,
      cp: json['cp'] as int?,
      mv: json['mv'] as int?,
      publishTime: json['publishTime'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'pst': pst,
        't': t,
        'ar': ar?.map((e) => e.toJson()).toList(),
        'alia': alia,
        'pop': pop,
        'st': st,
        'rt': rt,
        'fee': fee,
        'v': v,
        'crbt': crbt,
        'cf': cf,
        'al': al?.toJson(),
        'dt': dt,
        'h': h?.toJson(),
        'm': m?.toJson(),
        'l': l?.toJson(),
        'sq': sq?.toJson(),
        'hr': hr,
        'a': a,
        'cd': cd,
        'no': no,
        'rtUrl': rtUrl,
        'ftype': ftype,
        'rtUrls': rtUrls,
        'djId': djId,
        'copyright': copyright,
        's_id': sId,
        'mark': mark,
        'originCoverType': originCoverType,
        'originSongSimpleData': originSongSimpleData,
        'tagPicList': tagPicList,
        'resourceState': resourceState,
        'version': version,
        'songJumpInfo': songJumpInfo,
        'entertainmentTags': entertainmentTags,
        'awardTags': awardTags,
        'single': single,
        'noCopyrightRcmd': noCopyrightRcmd,
        'rtype': rtype,
        'rurl': rurl,
        'mst': mst,
        'cp': cp,
        'mv': mv,
        'publishTime': publishTime,
      };
}
