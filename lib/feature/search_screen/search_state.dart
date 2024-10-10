import 'package:project/data/model.dart';
import 'package:project/feature/home/domain/model/home_grid_detail_model.dart';

class SearchState {
  int currentIndex = 0;
  int currentPageIndex = 0;
  List<SearchModel> searchItemUi = [];
  List<CategoryModel> categoryItem = [];
  bool loading = true;
  late bool searchLoading;
  bool isFetchingData = false;
  String tabQuery = "";
}
