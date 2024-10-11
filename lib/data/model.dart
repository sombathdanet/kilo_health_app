class SearchModel {
  final String id;
  final String title;
  final String subtitle;
  final String thumnail;
  SearchModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.thumnail,
  });
}

class SearchItemModel {
  final bool isAlreadyLoad;
  final List<SearchModel> item;
  final String category;
  SearchItemModel({
    required this.category,
    this.isAlreadyLoad = false,
    required this.item,
  });
}

// Message Detail Screen
class MessageDetailModel {
  final String thumnail;
  final bool isSender;
  final String message;
  final String time;
  MessageDetailModel(
      {required this.thumnail,
      required this.isSender,
      required this.message,
      required this.time});
}
