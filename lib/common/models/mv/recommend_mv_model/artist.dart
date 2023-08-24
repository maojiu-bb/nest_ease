class Artist {
  int? id;
  String? name;

  Artist({this.id, this.name});

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
