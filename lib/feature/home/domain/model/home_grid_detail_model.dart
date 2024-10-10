class HomeGridDetialModel {
  String id;
  String type;
  String name;
  String description;
  String content;
  String thumbnail;
  int views;
  String status;
  bool favorite;
  String createdAt;
  List<CategoryModel> categories;
  List<TagModel> tags;

  HomeGridDetialModel({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.content,
    required this.thumbnail,
    required this.views,
    required this.status,
    required this.favorite,
    required this.createdAt,
    required this.categories,
    required this.tags,
  });
}

class CategoryModel {
  int id;
  String name;
  String icon;
  int order;

  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.order,
  });
}

class TagModel {
  int id;
  String name;

  TagModel({
    required this.id,
    required this.name,
  });
}
