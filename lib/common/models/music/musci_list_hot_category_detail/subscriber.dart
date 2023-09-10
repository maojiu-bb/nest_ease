class Subscriber {
  bool? defaultAvatar;
  int? province;
  int? authStatus;
  bool? followed;
  String? avatarUrl;
  int? accountStatus;
  int? gender;
  int? city;
  int? birthday;
  int? userId;
  int? userType;
  String? nickname;
  String? signature;
  String? description;
  String? detailDescription;
  int? avatarImgId;
  int? backgroundImgId;
  String? backgroundUrl;
  int? authority;
  bool? mutual;
  dynamic expertTags;
  dynamic experts;
  int? djStatus;
  int? vipType;
  dynamic remarkName;
  int? authenticationTypes;
  dynamic avatarDetail;
  String? avatarImgIdStr;
  String? backgroundImgIdStr;
  bool? anchor;
  // String? avatarImgIdStr;

  Subscriber({
    this.defaultAvatar,
    this.province,
    this.authStatus,
    this.followed,
    this.avatarUrl,
    this.accountStatus,
    this.gender,
    this.city,
    this.birthday,
    this.userId,
    this.userType,
    this.nickname,
    this.signature,
    this.description,
    this.detailDescription,
    this.avatarImgId,
    this.backgroundImgId,
    this.backgroundUrl,
    this.authority,
    this.mutual,
    this.expertTags,
    this.experts,
    this.djStatus,
    this.vipType,
    this.remarkName,
    this.authenticationTypes,
    this.avatarDetail,
    this.avatarImgIdStr,
    this.backgroundImgIdStr,
    this.anchor,
    // this.avatarImgIdStr,
  });

  factory Subscriber.fromJson(Map<String, dynamic> json) => Subscriber(
        defaultAvatar: json['defaultAvatar'] as bool?,
        province: json['province'] as int?,
        authStatus: json['authStatus'] as int?,
        followed: json['followed'] as bool?,
        avatarUrl: json['avatarUrl'] as String?,
        accountStatus: json['accountStatus'] as int?,
        gender: json['gender'] as int?,
        city: json['city'] as int?,
        birthday: json['birthday'] as int?,
        userId: json['userId'] as int?,
        userType: json['userType'] as int?,
        nickname: json['nickname'] as String?,
        signature: json['signature'] as String?,
        description: json['description'] as String?,
        detailDescription: json['detailDescription'] as String?,
        avatarImgId: json['avatarImgId'] as int?,
        backgroundImgId: json['backgroundImgId'] as int?,
        backgroundUrl: json['backgroundUrl'] as String?,
        authority: json['authority'] as int?,
        mutual: json['mutual'] as bool?,
        expertTags: json['expertTags'] as dynamic,
        experts: json['experts'] as dynamic,
        djStatus: json['djStatus'] as int?,
        vipType: json['vipType'] as int?,
        remarkName: json['remarkName'] as dynamic,
        authenticationTypes: json['authenticationTypes'] as int?,
        avatarDetail: json['avatarDetail'] as dynamic,
        avatarImgIdStr: json['avatarImgIdStr'] as String?,
        backgroundImgIdStr: json['backgroundImgIdStr'] as String?,
        anchor: json['anchor'] as bool?,
        // avatarImgIdStr: json['avatarImgId_str'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'defaultAvatar': defaultAvatar,
        'province': province,
        'authStatus': authStatus,
        'followed': followed,
        'avatarUrl': avatarUrl,
        'accountStatus': accountStatus,
        'gender': gender,
        'city': city,
        'birthday': birthday,
        'userId': userId,
        'userType': userType,
        'nickname': nickname,
        'signature': signature,
        'description': description,
        'detailDescription': detailDescription,
        'avatarImgId': avatarImgId,
        'backgroundImgId': backgroundImgId,
        'backgroundUrl': backgroundUrl,
        'authority': authority,
        'mutual': mutual,
        'expertTags': expertTags,
        'experts': experts,
        'djStatus': djStatus,
        'vipType': vipType,
        'remarkName': remarkName,
        'authenticationTypes': authenticationTypes,
        'avatarDetail': avatarDetail,
        'avatarImgIdStr': avatarImgIdStr,
        'backgroundImgIdStr': backgroundImgIdStr,
        'anchor': anchor,
        'avatarImgId_str': avatarImgIdStr,
      };
}
