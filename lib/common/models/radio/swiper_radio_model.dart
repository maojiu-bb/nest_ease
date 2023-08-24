class SwiperRadioModel {
  int? targetId;
  int? targetType;
  String? pic;
  String? url;
  String? typeTitle;
  bool? exclusive;

  SwiperRadioModel({
    this.targetId,
    this.targetType,
    this.pic,
    this.url,
    this.typeTitle,
    this.exclusive,
  });

  factory SwiperRadioModel.fromJson(Map<String, dynamic> json) {
    return SwiperRadioModel(
      targetId: json['targetId'] as int?,
      targetType: json['targetType'] as int?,
      pic: json['pic'] as String?,
      url: json['url'] as String?,
      typeTitle: json['typeTitle'] as String?,
      exclusive: json['exclusive'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'targetId': targetId,
        'targetType': targetType,
        'pic': pic,
        'url': url,
        'typeTitle': typeTitle,
        'exclusive': exclusive,
      };
}
