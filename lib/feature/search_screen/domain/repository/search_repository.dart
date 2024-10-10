import 'package:project/feature/home/domain/model/home_grid_detail_model.dart';
import 'package:project/feature/search_screen/domain/model/searh_model.dart';

abstract class SearchReposiory {
  Future<List<SerachModelUI>> search({String? query, int? page});
  Future<List<CategoryModel>> getCategory();
}
