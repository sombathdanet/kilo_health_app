class HomeGridDetailResponse {
  int? id;
  String? type;
  String? name;
  String? description;
  String? content;
  String? thumbnail;
  int? views;
  String? status;
  bool? favorite;
  String? createdAt;
  List<CategoriesRes>? categories;
  List<TagsRes>? tags;

  HomeGridDetailResponse({
    this.id,
    this.type,
    this.name,
    this.description,
    this.content,
    this.thumbnail,
    this.views,
    this.status,
    this.favorite,
    this.createdAt,
    this.categories,
    this.tags,
  });

  HomeGridDetailResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    description = json['description'];
    content = json['content'];
    thumbnail = json['thumbnail'];
    views = json['views'];
    status = json['status'];
    favorite = json['favorite'];
    createdAt = json['createdAt'];
    if (json['categories'] != null) {
      categories = <CategoriesRes>[];
      json['categories'].forEach((v) {
        categories?.add(CategoriesRes.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <TagsRes>[];
      json['tags'].forEach((v) {
        tags?.add(TagsRes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['description'] = description;
    data['content'] = content;
    data['thumbnail'] = thumbnail;
    data['views'] = views;
    data['status'] = status;
    data['favorite'] = favorite;
    data['createdAt'] = createdAt;
    if (categories != null) {
      data['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    if (tags != null) {
      data['tags'] = tags?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoriesRes {
  int? id;
  String? name;
  String? icon;
  int? order;

  CategoriesRes({this.id, this.name, this.icon, this.order});

  CategoriesRes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['icon'] = icon;
    data['order'] = order;
    return data;
  }
}

class TagsRes {
  int? id;
  String? name;

  TagsRes({this.id, this.name});

  TagsRes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
