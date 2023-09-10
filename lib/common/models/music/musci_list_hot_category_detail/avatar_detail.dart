class AvatarDetail {
  int? userType;
  int? identityLevel;
  String? identityIconUrl;

  AvatarDetail({this.userType, this.identityLevel, this.identityIconUrl});

  factory AvatarDetail.fromJson(Map<String, dynamic> json) => AvatarDetail(
        userType: json['userType'] as int?,
        identityLevel: json['identityLevel'] as int?,
        identityIconUrl: json['identityIconUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'userType': userType,
        'identityLevel': identityLevel,
        'identityIconUrl': identityIconUrl,
      };
}
