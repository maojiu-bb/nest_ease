import 'album.dart';
import 'artist.dart';
import 'b_music.dart';
import 'h_music.dart';
import 'l_music.dart';

class MainSong {
  String? name;
  int? id;
  int? position;
  List<dynamic>? alias;
  int? status;
  int? fee;
  int? copyrightId;
  String? disc;
  int? no;
  List<Artist>? artists;
  Album? album;
  bool? starred;
  int? popularity;
  int? score;
  int? starredNum;
  int? duration;
  int? playedNum;
  int? dayPlays;
  int? hearTime;
  dynamic sqMusic;
  dynamic hrMusic;
  String? ringtone;
  dynamic crbt;
  dynamic audition;
  String? copyFrom;
  String? commentThreadId;
  dynamic rtUrl;
  int? ftype;
  List<dynamic>? rtUrls;
  int? copyright;
  dynamic transName;
  dynamic sign;
  int? mark;
  int? originCoverType;
  dynamic originSongSimpleData;
  int? single;
  dynamic noCopyrightRcmd;
  int? rtype;
  dynamic rurl;
  int? mvid;
  BMusic? bMusic;
  dynamic mp3Url;
  HMusic? hMusic;
  dynamic mMusic;
  LMusic? lMusic;

  MainSong({
    this.name,
    this.id,
    this.position,
    this.alias,
    this.status,
    this.fee,
    this.copyrightId,
    this.disc,
    this.no,
    this.artists,
    this.album,
    this.starred,
    this.popularity,
    this.score,
    this.starredNum,
    this.duration,
    this.playedNum,
    this.dayPlays,
    this.hearTime,
    this.sqMusic,
    this.hrMusic,
    this.ringtone,
    this.crbt,
    this.audition,
    this.copyFrom,
    this.commentThreadId,
    this.rtUrl,
    this.ftype,
    this.rtUrls,
    this.copyright,
    this.transName,
    this.sign,
    this.mark,
    this.originCoverType,
    this.originSongSimpleData,
    this.single,
    this.noCopyrightRcmd,
    this.rtype,
    this.rurl,
    this.mvid,
    this.bMusic,
    this.mp3Url,
    this.hMusic,
    this.mMusic,
    this.lMusic,
  });

  factory MainSong.fromJson(Map<String, dynamic> json) => MainSong(
        name: json['name'] as String?,
        id: json['id'] as int?,
        position: json['position'] as int?,
        alias: json['alias'] as List<dynamic>?,
        status: json['status'] as int?,
        fee: json['fee'] as int?,
        copyrightId: json['copyrightId'] as int?,
        disc: json['disc'] as String?,
        no: json['no'] as int?,
        artists: (json['artists'] as List<dynamic>?)
            ?.map((e) => Artist.fromJson(e as Map<String, dynamic>))
            .toList(),
        album: json['album'] == null
            ? null
            : Album.fromJson(json['album'] as Map<String, dynamic>),
        starred: json['starred'] as bool?,
        popularity: json['popularity'] as int?,
        score: json['score'] as int?,
        starredNum: json['starredNum'] as int?,
        duration: json['duration'] as int?,
        playedNum: json['playedNum'] as int?,
        dayPlays: json['dayPlays'] as int?,
        hearTime: json['hearTime'] as int?,
        sqMusic: json['sqMusic'] as dynamic,
        hrMusic: json['hrMusic'] as dynamic,
        ringtone: json['ringtone'] as String?,
        crbt: json['crbt'] as dynamic,
        audition: json['audition'] as dynamic,
        copyFrom: json['copyFrom'] as String?,
        commentThreadId: json['commentThreadId'] as String?,
        rtUrl: json['rtUrl'] as dynamic,
        ftype: json['ftype'] as int?,
        rtUrls: json['rtUrls'] as List<dynamic>?,
        copyright: json['copyright'] as int?,
        transName: json['transName'] as dynamic,
        sign: json['sign'] as dynamic,
        mark: json['mark'] as int?,
        originCoverType: json['originCoverType'] as int?,
        originSongSimpleData: json['originSongSimpleData'] as dynamic,
        single: json['single'] as int?,
        noCopyrightRcmd: json['noCopyrightRcmd'] as dynamic,
        rtype: json['rtype'] as int?,
        rurl: json['rurl'] as dynamic,
        mvid: json['mvid'] as int?,
        bMusic: json['bMusic'] == null
            ? null
            : BMusic.fromJson(json['bMusic'] as Map<String, dynamic>),
        mp3Url: json['mp3Url'] as dynamic,
        hMusic: json['hMusic'] == null
            ? null
            : HMusic.fromJson(json['hMusic'] as Map<String, dynamic>),
        mMusic: json['mMusic'] as dynamic,
        lMusic: json['lMusic'] == null
            ? null
            : LMusic.fromJson(json['lMusic'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'position': position,
        'alias': alias,
        'status': status,
        'fee': fee,
        'copyrightId': copyrightId,
        'disc': disc,
        'no': no,
        'artists': artists?.map((e) => e.toJson()).toList(),
        'album': album?.toJson(),
        'starred': starred,
        'popularity': popularity,
        'score': score,
        'starredNum': starredNum,
        'duration': duration,
        'playedNum': playedNum,
        'dayPlays': dayPlays,
        'hearTime': hearTime,
        'sqMusic': sqMusic,
        'hrMusic': hrMusic,
        'ringtone': ringtone,
        'crbt': crbt,
        'audition': audition,
        'copyFrom': copyFrom,
        'commentThreadId': commentThreadId,
        'rtUrl': rtUrl,
        'ftype': ftype,
        'rtUrls': rtUrls,
        'copyright': copyright,
        'transName': transName,
        'sign': sign,
        'mark': mark,
        'originCoverType': originCoverType,
        'originSongSimpleData': originSongSimpleData,
        'single': single,
        'noCopyrightRcmd': noCopyrightRcmd,
        'rtype': rtype,
        'rurl': rurl,
        'mvid': mvid,
        'bMusic': bMusic?.toJson(),
        'mp3Url': mp3Url,
        'hMusic': hMusic?.toJson(),
        'mMusic': mMusic,
        'lMusic': lMusic?.toJson(),
      };
}
