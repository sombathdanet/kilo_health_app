class CategoryResponse {
  int? id;
  String? name;
  String? icon;
  int? order;

  CategoryResponse({this.id, this.name, this.icon, this.order});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
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
