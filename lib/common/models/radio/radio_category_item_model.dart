class RadioCategoryItemModel {
  String? pic56x56Url;
  String? pic96x96IdStr;
  String? pic96x96Url;
  String? pic84x84IdUrl;
  String? picPcWhiteStr;
  String? picPcWhiteUrl;
  String? picPcBlackStr;
  String? picPcBlackUrl;
  String? picWebStr;
  String? picWebUrl;
  String? picMacId;
  String? picMacUrl;
  String? picUwpId;
  String? picUwpUrl;
  String? picIPadStr;
  String? picIPadUrl;
  String? pic56x56IdStr;
  int? picPcWhite;
  int? picPcBlack;
  int? picWeb;
  int? picIPad;
  int? pic84x84Id;
  int? pic56x56Id;
  int? pic96x96Id;
  String? name;
  int? id;

  RadioCategoryItemModel({
    this.pic56x56Url,
    this.pic96x96IdStr,
    this.pic96x96Url,
    this.pic84x84IdUrl,
    this.picPcWhiteStr,
    this.picPcWhiteUrl,
    this.picPcBlackStr,
    this.picPcBlackUrl,
    this.picWebStr,
    this.picWebUrl,
    this.picMacId,
    this.picMacUrl,
    this.picUwpId,
    this.picUwpUrl,
    this.picIPadStr,
    this.picIPadUrl,
    this.pic56x56IdStr,
    this.picPcWhite,
    this.picPcBlack,
    this.picWeb,
    this.picIPad,
    this.pic84x84Id,
    this.pic56x56Id,
    this.pic96x96Id,
    this.name,
    this.id,
  });

  factory RadioCategoryItemModel.fromJson(Map<String, dynamic> json) {
    return RadioCategoryItemModel(
      pic56x56Url: json['pic56x56Url'] as String?,
      pic96x96IdStr: json['pic96x96IdStr'] as String?,
      pic96x96Url: json['pic96x96Url'] as String?,
      pic84x84IdUrl: json['pic84x84IdUrl'] as String?,
      picPcWhiteStr: json['picPCWhiteStr'] as String?,
      picPcWhiteUrl: json['picPCWhiteUrl'] as String?,
      picPcBlackStr: json['picPCBlackStr'] as String?,
      picPcBlackUrl: json['picPCBlackUrl'] as String?,
      picWebStr: json['picWebStr'] as String?,
      picWebUrl: json['picWebUrl'] as String?,
      picMacId: json['picMacId'] as String?,
      picMacUrl: json['picMacUrl'] as String?,
      picUwpId: json['picUWPId'] as String?,
      picUwpUrl: json['picUWPUrl'] as String?,
      picIPadStr: json['picIPadStr'] as String?,
      picIPadUrl: json['picIPadUrl'] as String?,
      pic56x56IdStr: json['pic56x56IdStr'] as String?,
      picPcWhite: json['picPCWhite'] as int?,
      picPcBlack: json['picPCBlack'] as int?,
      picWeb: json['picWeb'] as int?,
      picIPad: json['picIPad'] as int?,
      pic84x84Id: json['pic84x84Id'] as int?,
      pic56x56Id: json['pic56x56Id'] as int?,
      pic96x96Id: json['pic96x96Id'] as int?,
      name: json['name'] as String?,
      id: json['id'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'pic56x56Url': pic56x56Url,
        'pic96x96IdStr': pic96x96IdStr,
        'pic96x96Url': pic96x96Url,
        'pic84x84IdUrl': pic84x84IdUrl,
        'picPCWhiteStr': picPcWhiteStr,
        'picPCWhiteUrl': picPcWhiteUrl,
        'picPCBlackStr': picPcBlackStr,
        'picPCBlackUrl': picPcBlackUrl,
        'picWebStr': picWebStr,
        'picWebUrl': picWebUrl,
        'picMacId': picMacId,
        'picMacUrl': picMacUrl,
        'picUWPId': picUwpId,
        'picUWPUrl': picUwpUrl,
        'picIPadStr': picIPadStr,
        'picIPadUrl': picIPadUrl,
        'pic56x56IdStr': pic56x56IdStr,
        'picPCWhite': picPcWhite,
        'picPCBlack': picPcBlack,
        'picWeb': picWeb,
        'picIPad': picIPad,
        'pic84x84Id': pic84x84Id,
        'pic56x56Id': pic56x56Id,
        'pic96x96Id': pic96x96Id,
        'name': name,
        'id': id,
      };
}
