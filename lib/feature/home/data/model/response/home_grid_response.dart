class HomeGridItemResponse {
  int? status;
  String? message;
  List<HomeGridDataResponse>? data;
  Paging? paging;

  HomeGridItemResponse({this.status, this.message, this.data, this.paging});

  HomeGridItemResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <HomeGridDataResponse>[];
      json['data'].forEach((v) {
        data?.add(HomeGridDataResponse.fromJson(v));
      });
    }
    paging = json['paging'] != null ? Paging.fromJson(json['paging']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    if (paging != null) {
      data['paging'] = paging?.toJson();
    }
    return data;
  }
}

class HomeGridDataResponse {
  int? id;
  String? type;
  String? name;
  String? description;
  String? thumbnail;
  bool? favorite;
  String? createdAt;

  HomeGridDataResponse({
    this.id,
    this.type,
    this.name,
    this.description,
    this.thumbnail,
    this.favorite,
    this.createdAt,
  });

  HomeGridDataResponse.fromJson(Map<String, dynamic> json) {
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
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['description'] = description;
    data['thumbnail'] = thumbnail;
    data['favorite'] = favorite;
    data['createdAt'] = createdAt;
    return data;
  }
}

class Paging {
  int? page;
  int? size;
  int? total;
  int? totalPages;

  Paging({this.page, this.size, this.total, this.totalPages});

  Paging.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    size = json['size'];
    total = json['total'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['size'] = size;
    data['total'] = total;
    data['totalPages'] = totalPages;
    return data;
  }
}
