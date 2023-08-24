class Radio {
  int? id;
  dynamic dj;
  String? name;
  String? picUrl;
  String? desc;
  int? subCount;
  int? programCount;
  int? createTime;
  int? categoryId;
  String? category;
  int? radioFeeType;
  int? feeScope;
  bool? buyed;
  dynamic videos;
  bool? finished;
  bool? underShelf;
  int? purchaseCount;
  int? price;
  int? originalPrice;
  dynamic discountPrice;
  int? lastProgramCreateTime;
  dynamic lastProgramName;
  int? lastProgramId;
  int? picId;
  String? rcmdText;
  bool? hightQuality;
  bool? whiteList;
  bool? composeVideo;
  bool? subed;

  Radio({
    this.id,
    this.dj,
    this.name,
    this.picUrl,
    this.desc,
    this.subCount,
    this.programCount,
    this.createTime,
    this.categoryId,
    this.category,
    this.radioFeeType,
    this.feeScope,
    this.buyed,
    this.videos,
    this.finished,
    this.underShelf,
    this.purchaseCount,
    this.price,
    this.originalPrice,
    this.discountPrice,
    this.lastProgramCreateTime,
    this.lastProgramName,
    this.lastProgramId,
    this.picId,
    this.rcmdText,
    this.hightQuality,
    this.whiteList,
    this.composeVideo,
    this.subed,
  });

  factory Radio.fromJson(Map<String, dynamic> json) => Radio(
        id: json['id'] as int?,
        dj: json['dj'] as dynamic,
        name: json['name'] as String?,
        picUrl: json['picUrl'] as String?,
        desc: json['desc'] as String?,
        subCount: json['subCount'] as int?,
        programCount: json['programCount'] as int?,
        createTime: json['createTime'] as int?,
        categoryId: json['categoryId'] as int?,
        category: json['category'] as String?,
        radioFeeType: json['radioFeeType'] as int?,
        feeScope: json['feeScope'] as int?,
        buyed: json['buyed'] as bool?,
        videos: json['videos'] as dynamic,
        finished: json['finished'] as bool?,
        underShelf: json['underShelf'] as bool?,
        purchaseCount: json['purchaseCount'] as int?,
        price: json['price'] as int?,
        originalPrice: json['originalPrice'] as int?,
        discountPrice: json['discountPrice'] as dynamic,
        lastProgramCreateTime: json['lastProgramCreateTime'] as int?,
        lastProgramName: json['lastProgramName'] as dynamic,
        lastProgramId: json['lastProgramId'] as int?,
        picId: json['picId'] as int?,
        rcmdText: json['rcmdText'] as String?,
        hightQuality: json['hightQuality'] as bool?,
        whiteList: json['whiteList'] as bool?,
        composeVideo: json['composeVideo'] as bool?,
        subed: json['subed'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'dj': dj,
        'name': name,
        'picUrl': picUrl,
        'desc': desc,
        'subCount': subCount,
        'programCount': programCount,
        'createTime': createTime,
        'categoryId': categoryId,
        'category': category,
        'radioFeeType': radioFeeType,
        'feeScope': feeScope,
        'buyed': buyed,
        'videos': videos,
        'finished': finished,
        'underShelf': underShelf,
        'purchaseCount': purchaseCount,
        'price': price,
        'originalPrice': originalPrice,
        'discountPrice': discountPrice,
        'lastProgramCreateTime': lastProgramCreateTime,
        'lastProgramName': lastProgramName,
        'lastProgramId': lastProgramId,
        'picId': picId,
        'rcmdText': rcmdText,
        'hightQuality': hightQuality,
        'whiteList': whiteList,
        'composeVideo': composeVideo,
        'subed': subed,
      };
}
