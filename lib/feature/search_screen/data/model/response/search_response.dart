// ignore_for_file: unnecessary_this

class SerachResponse {
  int? id;
  String? type;
  String? name;
  String? description;
  String? thumbnail;
  bool? favorite;
  String? createdAt;

  SerachResponse({
    this.id,
    this.type,
    this.name,
    this.description,
    this.thumbnail,
    this.favorite,
    this.createdAt,
  });

  SerachResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    favorite = json['favorite'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['description'] = this.description;
    data['thumbnail'] = this.thumbnail;
    data['favorite'] = this.favorite;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
