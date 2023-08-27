class SongListRequest {
  SongListRequest({
    this.id,
    this.limit,
    this.offset,
  });

  int? id;
  String? limit;
  String? offset;

  Map<String, dynamic> toJson() => {
        'id': id,
        'limit': limit ?? 100,
        'offset': offset ?? 1,
      };
}
