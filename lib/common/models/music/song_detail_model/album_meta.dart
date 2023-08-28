class AlbumMeta {
  int? id;
  String? name;

  AlbumMeta({this.id, this.name});

  factory AlbumMeta.fromJson(Map<String, dynamic> json) => AlbumMeta(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
