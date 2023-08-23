class FreeTrialPrivilege {
  bool? resConsumable;
  bool? userConsumable;
  dynamic listenType;

  FreeTrialPrivilege({
    this.resConsumable,
    this.userConsumable,
    this.listenType,
  });

  factory FreeTrialPrivilege.fromJson(Map<String, dynamic> json) {
    return FreeTrialPrivilege(
      resConsumable: json['resConsumable'] as bool?,
      userConsumable: json['userConsumable'] as bool?,
      listenType: json['listenType'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'resConsumable': resConsumable,
        'userConsumable': userConsumable,
        'listenType': listenType,
      };
}
