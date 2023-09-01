import 'klyric.dart';
import 'lrc.dart';
import 'romalrc.dart';
import 'tlyric.dart';

class LyricModel {
  bool? sgc;
  bool? sfy;
  bool? qfy;
  Lrc? lrc;
  Klyric? klyric;
  Tlyric? tlyric;
  Romalrc? romalrc;
  int? code;

  LyricModel({
    this.sgc,
    this.sfy,
    this.qfy,
    this.lrc,
    this.klyric,
    this.tlyric,
    this.romalrc,
    this.code,
  });

  factory LyricModel.fromJson(Map<String, dynamic> json) => LyricModel(
        sgc: json['sgc'] as bool?,
        sfy: json['sfy'] as bool?,
        qfy: json['qfy'] as bool?,
        lrc: json['lrc'] == null
            ? null
            : Lrc.fromJson(json['lrc'] as Map<String, dynamic>),
        klyric: json['klyric'] == null
            ? null
            : Klyric.fromJson(json['klyric'] as Map<String, dynamic>),
        tlyric: json['tlyric'] == null
            ? null
            : Tlyric.fromJson(json['tlyric'] as Map<String, dynamic>),
        romalrc: json['romalrc'] == null
            ? null
            : Romalrc.fromJson(json['romalrc'] as Map<String, dynamic>),
        code: json['code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'sgc': sgc,
        'sfy': sfy,
        'qfy': qfy,
        'lrc': lrc?.toJson(),
        'klyric': klyric?.toJson(),
        'tlyric': tlyric?.toJson(),
        'romalrc': romalrc?.toJson(),
        'code': code,
      };
}
