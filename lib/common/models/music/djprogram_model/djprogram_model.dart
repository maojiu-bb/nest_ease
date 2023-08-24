import 'program.dart';

class DjprogramModel {
  int? id;
  int? type;
  String? name;
  String? copywriter;
  String? picUrl;
  bool? canDislike;
  dynamic trackNumberUpdateTime;
  Program? program;
  String? alg;

  DjprogramModel({
    this.id,
    this.type,
    this.name,
    this.copywriter,
    this.picUrl,
    this.canDislike,
    this.trackNumberUpdateTime,
    this.program,
    this.alg,
  });

  factory DjprogramModel.fromJson(Map<String, dynamic> json) {
    return DjprogramModel(
      id: json['id'] as int?,
      type: json['type'] as int?,
      name: json['name'] as String?,
      copywriter: json['copywriter'] as String?,
      picUrl: json['picUrl'] as String?,
      canDislike: json['canDislike'] as bool?,
      trackNumberUpdateTime: json['trackNumberUpdateTime'] as dynamic,
      program: json['program'] == null
          ? null
          : Program.fromJson(json['program'] as Map<String, dynamic>),
      alg: json['alg'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'name': name,
        'copywriter': copywriter,
        'picUrl': picUrl,
        'canDislike': canDislike,
        'trackNumberUpdateTime': trackNumberUpdateTime,
        'program': program?.toJson(),
        'alg': alg,
      };
}
