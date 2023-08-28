class FreeTimeTrialPrivilege {
  bool? resConsumable;
  bool? userConsumable;
  int? type;
  int? remainTime;

  FreeTimeTrialPrivilege({
    this.resConsumable,
    this.userConsumable,
    this.type,
    this.remainTime,
  });

  factory FreeTimeTrialPrivilege.fromJson(Map<String, dynamic> json) {
    return FreeTimeTrialPrivilege(
      resConsumable: json['resConsumable'] as bool?,
      userConsumable: json['userConsumable'] as bool?,
      type: json['type'] as int?,
      remainTime: json['remainTime'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'resConsumable': resConsumable,
        'userConsumable': userConsumable,
        'type': type,
        'remainTime': remainTime,
      };
}
