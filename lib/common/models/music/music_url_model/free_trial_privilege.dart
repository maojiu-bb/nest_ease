class FreeTrialPrivilege {
  bool? resConsumable;
  bool? userConsumable;
  dynamic listenType;
  dynamic cannotListenReason;

  FreeTrialPrivilege({
    this.resConsumable,
    this.userConsumable,
    this.listenType,
    this.cannotListenReason,
  });

  factory FreeTrialPrivilege.fromJson(Map<String, dynamic> json) {
    return FreeTrialPrivilege(
      resConsumable: json['resConsumable'] as bool?,
      userConsumable: json['userConsumable'] as bool?,
      listenType: json['listenType'] as dynamic,
      cannotListenReason: json['cannotListenReason'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'resConsumable': resConsumable,
        'userConsumable': userConsumable,
        'listenType': listenType,
        'cannotListenReason': cannotListenReason,
      };
}
