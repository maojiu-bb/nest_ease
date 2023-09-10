class MusciListHotCategoryDetailRequest {
  int? limit;
  String? order;
  String cat;
  int page;

  MusciListHotCategoryDetailRequest({
    this.limit,
    this.order,
    required this.cat,
    required this.page,
  });

  Map<String, dynamic> toJson() => {
        'limit': limit ?? 15,
        'order': order ?? 'hot',
        'cat': cat,
        'page': page,
      };
}
