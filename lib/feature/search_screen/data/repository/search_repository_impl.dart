import 'package:project/feature/home/domain/model/home_grid_detail_model.dart';
import 'package:project/feature/search_screen/data/mapper/search_response_mapper.dart';
import 'package:project/feature/search_screen/data/network/search_network_data_source.dart';
import 'package:project/feature/search_screen/domain/model/searh_model.dart';
import 'package:project/feature/search_screen/domain/repository/search_repository.dart';

class SearchRepositoryImpl extends SearchReposiory {
  final SearchNetWorkDataSource _searchNetWorkDataSource;
  SearchRepositoryImpl(this._searchNetWorkDataSource);

  @override
  Future<List<SerachModelUI>> search({String? query, int? page}) async {
    final res = await _searchNetWorkDataSource.getSearch(
      page: page,
      queryParameters: query,
    );
    return res.data.toSearchModelItem();
  }

  @override
  Future<List<CategoryModel>> getCategory() async {
    final res = await _searchNetWorkDataSource.getCategoryResponse();
    return res.data.toCategoryModelItem();
  }
}
